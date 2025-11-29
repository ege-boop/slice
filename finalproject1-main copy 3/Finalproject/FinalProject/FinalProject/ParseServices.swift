import Foundation
import ParseSwift
import CoreLocation

class ParseService {
    static let shared = ParseService()
    
    private init() {}
    
    func signUp(username: String, email: String, password: String) async throws -> User {
        var user = User()
        user.username = username
        user.email = email
        user.password = password
        
        let signedUpUser = try await user.signup()
        print("User signed up: \(signedUpUser.username ?? "")")
        return signedUpUser
    }
    
    func signIn(username: String, password: String) async throws -> User {
        let user = try await User.login(username: username, password: password)
        print("User signed in: \(user.username ?? "")")
        return user
    }
    
    func signOut() async throws {
        try await User.logout()
        print("User signed out")
    }
    
    func getCurrentUser() -> User? {
        return User.current
    }
    
    func fetchAllClubs() async throws -> [Club] {
        let query = Club.query()
            .limit(100)
            .order([.descending("createdAt")])
        
        let clubs = try await query.find()
        print("Fetched \(clubs.count) clubs")
        return clubs
    }
    
    func createClub(name: String, description: String, category: ClubCategory,
                   location: CLLocationCoordinate2D, address: String,
                   isPrivate: Bool) async throws -> Club {
        var club = Club()
        club.name = name
        club.description = description
        club.category = category.rawValue
        club.location = try ParseGeoPoint(latitude: location.latitude, longitude: location.longitude)
        club.address = address
        club.privacy = isPrivate ? "Private" : "Public"
        club.memberCount = 1
        club.adminId = User.current?.objectId
        
        let savedClub = try await club.save()
        print("Created club: \(savedClub.name ?? "")")
        
        // ✅ FIX: Auto-add creator as admin member
        guard let clubId = savedClub.objectId,
              let currentUserId = User.current?.objectId else {
            return savedClub
        }
        
        var adminMember = Member()
        adminMember.userId = currentUserId
        adminMember.clubId = clubId
        adminMember.role = "admin"
        adminMember.joinedAt = Date()
        
        do {
            _ = try await adminMember.save()
            print("✅ Creator added as admin member")
        } catch {
            print("⚠️ Failed to add creator as member: \(error)")
        }
        
        return savedClub
    }
    
    func searchClubs(searchText: String) async throws -> [Club] {
        let query = Club.query()
            .limit(50)
        
        let clubs = try await query.find()
        
        let filtered = clubs.filter { club in
            guard let name = club.name else { return false }
            return name.localizedCaseInsensitiveContains(searchText)
        }
        
        print("Found \(filtered.count) clubs matching \(searchText)")
        return filtered
    }
    
    func filterClubsByCategory(category: ClubCategory) async throws -> [Club] {
        let query = Club.query()
            .limit(100)
        
        let clubs = try await query.find()
        
        let filtered = clubs.filter { $0.category == category.rawValue }
        
        print("Found \(filtered.count) \(category.rawValue) clubs")
        return filtered
    }
    
    // MARK: - Membership Functions
    
    func checkMembership(userId: String, clubId: String) async throws -> Bool {
        do {
            let allMembers = try await Member.query().find()
            
            let isMember = allMembers.contains { member in
                member.userId == userId && member.clubId == clubId
            }
            
            return isMember
        } catch {
            print("Error checking membership: \(error)")
            return false
        }
    }
    
    func joinClub(userId: String, clubId: String) async throws {
        var member = Member()
        member.userId = userId
        member.clubId = clubId
        member.role = "member"
        member.joinedAt = Date()
        
        let savedMember = try await member.save()
        
        // Update member count
        let allClubs = try await Club.query().find()
        if var club = allClubs.first(where: { $0.objectId == clubId }) {
            let oldCount = club.memberCount ?? 0
            club.memberCount = oldCount + 1
            _ = try await club.save()
        }
        
        print("✅ User joined club: \(savedMember.objectId ?? "")")
    }
    
    func leaveClub(userId: String, clubId: String) async throws {
        let allMembers = try await Member.query().find()
        
        if let member = allMembers.first(where: { $0.userId == userId && $0.clubId == clubId }) {
            try await member.delete()
            
            // Update member count
            let allClubs = try await Club.query().find()
            if var club = allClubs.first(where: { $0.objectId == clubId }) {
                club.memberCount = max(0, (club.memberCount ?? 1) - 1)
                _ = try await club.save()
            }
            
            print("✅ User left club")
        }
    }
    
    func getUserClubs(userId: String) async throws -> [Club] {
        let allMembers = try await Member.query().find()
        let userMemberships = allMembers.filter { $0.userId == userId }
        
        let clubIds = userMemberships.compactMap { $0.clubId }
        
        if clubIds.isEmpty {
            return []
        }
        
        let allClubs = try await Club.query().find()
        let userClubs = allClubs.filter { club in
            guard let clubId = club.objectId else { return false }
            return clubIds.contains(clubId)
        }
        
        print("✅ User is member of \(userClubs.count) clubs")
        return userClubs
    }
    
    // MARK: - Club Management Functions
    
    func isClubAdmin(userId: String, clubId: String) async throws -> Bool {
        let allClubs = try await Club.query().find()
        if let club = allClubs.first(where: { $0.objectId == clubId }) {
            return club.adminId == userId
        }
        return false
    }
    
    func isClubLeader(userId: String, clubId: String) async throws -> Bool {
        let allClubs = try await Club.query().find()
        if let club = allClubs.first(where: { $0.objectId == clubId }) {
            if club.adminId == userId {
                return true
            }
            if let leaderIds = club.leaderIds {
                return leaderIds.contains(userId)
            }
        }
        return false
    }
    
    func getUserRoleInClub(userId: String, clubId: String) async throws -> String? {
        let allClubs = try await Club.query().find()
        if let club = allClubs.first(where: { $0.objectId == clubId }) {
            if club.adminId == userId {
                return "admin"
            }
            if let leaderIds = club.leaderIds, leaderIds.contains(userId) {
                return "leader"
            }
            if let moderatorIds = club.moderatorIds, moderatorIds.contains(userId) {
                return "moderator"
            }
        }
        
        let allMembers = try await Member.query().find()
        if allMembers.contains(where: { $0.userId == userId && $0.clubId == clubId }) {
            return "member"
        }
        
        return nil
    }
    
    func updateClub(clubId: String, name: String?, description: String?, category: String?) async throws {
        guard let userId = User.current?.objectId else {
            throw NSError(domain: "ParseService", code: 401, userInfo: [NSLocalizedDescriptionKey: "User not logged in"])
        }
        
        let isLeader = try await isClubLeader(userId: userId, clubId: clubId)
        guard isLeader else {
            throw NSError(domain: "ParseService", code: 403, userInfo: [NSLocalizedDescriptionKey: "You don't have permission to edit this club"])
        }
        
        let allClubs = try await Club.query().find()
        if var club = allClubs.first(where: { $0.objectId == clubId }) {
            if let name = name {
                club.name = name
            }
            if let description = description {
                club.description = description
            }
            if let category = category {
                club.category = category
            }
            
            _ = try await club.save()
            print("✅ Club updated")
        }
    }
    
    func promoteToLeader(userId: String, clubId: String) async throws {
        guard let currentUserId = User.current?.objectId else {
            throw NSError(domain: "ParseService", code: 401, userInfo: [NSLocalizedDescriptionKey: "User not logged in"])
        }
        
        let isAdmin = try await isClubAdmin(userId: currentUserId, clubId: clubId)
        guard isAdmin else {
            throw NSError(domain: "ParseService", code: 403, userInfo: [NSLocalizedDescriptionKey: "Only admin can promote to leader"])
        }
        
        let allClubs = try await Club.query().find()
        if var club = allClubs.first(where: { $0.objectId == clubId }) {
            var leaderIds = club.leaderIds ?? []
            if !leaderIds.contains(userId) {
                leaderIds.append(userId)
                club.leaderIds = leaderIds
                _ = try await club.save()
                
                let allMembers = try await Member.query().find()
                if var member = allMembers.first(where: { $0.userId == userId && $0.clubId == clubId }) {
                    member.role = "leader"
                    _ = try await member.save()
                }
                
                print("✅ User promoted to leader")
            }
        }
    }
    
    func demoteFromLeader(userId: String, clubId: String) async throws {
        guard let currentUserId = User.current?.objectId else {
            throw NSError(domain: "ParseService", code: 401, userInfo: [NSLocalizedDescriptionKey: "User not logged in"])
        }
        
        let isAdmin = try await isClubAdmin(userId: currentUserId, clubId: clubId)
        guard isAdmin else {
            throw NSError(domain: "ParseService", code: 403, userInfo: [NSLocalizedDescriptionKey: "Only admin can demote leaders"])
        }
        
        let allClubs = try await Club.query().find()
        if var club = allClubs.first(where: { $0.objectId == clubId }) {
            var leaderIds = club.leaderIds ?? []
            leaderIds.removeAll { $0 == userId }
            club.leaderIds = leaderIds
            _ = try await club.save()
            
            let allMembers = try await Member.query().find()
            if var member = allMembers.first(where: { $0.userId == userId && $0.clubId == clubId }) {
                member.role = "member"
                _ = try await member.save()
            }
            
            print("✅ User demoted to member")
        }
    }
    
    func removeMember(userId: String, clubId: String) async throws {
        guard let currentUserId = User.current?.objectId else {
            throw NSError(domain: "ParseService", code: 401, userInfo: [NSLocalizedDescriptionKey: "User not logged in"])
        }
        
        let isLeader = try await isClubLeader(userId: currentUserId, clubId: clubId)
        guard isLeader else {
            throw NSError(domain: "ParseService", code: 403, userInfo: [NSLocalizedDescriptionKey: "You don't have permission to remove members"])
        }
        
        let isAdmin = try await isClubAdmin(userId: userId, clubId: clubId)
        guard !isAdmin else {
            throw NSError(domain: "ParseService", code: 403, userInfo: [NSLocalizedDescriptionKey: "Cannot remove club admin"])
        }
        
        try await leaveClub(userId: userId, clubId: clubId)
        print("✅ Member removed from club")
    }
    
    func getClubMembersWithRoles(clubId: String) async throws -> [(user: User, role: String)] {
        let allMembers = try await Member.query().find()
        let clubMembers = allMembers.filter { $0.clubId == clubId }
        
        let userIds = clubMembers.compactMap { $0.userId }
        let allUsers = try await User.query().find()
        let users = allUsers.filter { user in
            guard let userId = user.objectId else { return false }
            return userIds.contains(userId)
        }
        
        let allClubs = try await Club.query().find()
        guard let club = allClubs.first(where: { $0.objectId == clubId }) else {
            return []
        }
        
        var result: [(user: User, role: String)] = []
        for user in users {
            guard let userId = user.objectId else { continue }
            
            var role = "member"
            if club.adminId == userId {
                role = "admin"
            } else if let leaderIds = club.leaderIds, leaderIds.contains(userId) {
                role = "leader"
            } else if let moderatorIds = club.moderatorIds, moderatorIds.contains(userId) {
                role = "moderator"
            }
            
            result.append((user: user, role: role))
        }
        
        result.sort { member1, member2 in
            let roleOrder = ["admin": 0, "leader": 1, "moderator": 2, "member": 3]
            let order1 = roleOrder[member1.role] ?? 99
            let order2 = roleOrder[member2.role] ?? 99
            return order1 < order2
        }
        
        return result
    }
}
