import Foundation
import ParseSwift
import CoreLocation

struct User: ParseUser {
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?
    
    var username: String?
    var email: String?
    var emailVerified: Bool?
    var password: String?
    var authData: [String: [String: String]?]?
    
    var bio: String?
    var profileImageURL: String?
    
    // Social features fields
    var followersCount: Int?
    var followingCount: Int?
    var postsCount: Int?
    
    // NEW: Search and discovery features
    var displayName: String?
    var usernameTag: String?
    var searchableName: String?
    var isVerified: Bool?
    var interests: [String]?
    
    var atUsername: String {
        return "@\(username ?? "user")"
    }
    
    mutating func updateSearchableFields() {
        self.usernameTag = username?.lowercased()
        var searchTerms: [String] = []
        if let displayName = displayName {
            searchTerms.append(displayName.lowercased())
        }
        if let username = username {
            searchTerms.append(username.lowercased())
        }
        self.searchableName = searchTerms.joined(separator: " ")
    }
}

enum ClubCategory: String, CaseIterable {
    case sport = "Sport"
    case tech = "Tech"
    case music = "Music"
    case arts = "Arts"
    case gaming = "Gaming"
    case business = "Business"
    case education = "Education"
    case social = "Social"
}

struct Club: ParseObject {
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?
    
    var name: String?
    var description: String?
    var category: String?
    var location: ParseGeoPoint?
    var address: String?
    var privacy: String?
    var memberCount: Int?
    
    // Club leadership fields
    var adminId: String?
    var leaderIds: [String]?
    var moderatorIds: [String]?
    
    // Club images
    var profileImageURL: String?
    var bannerImageURL: String?
    
    var coordinate: CLLocationCoordinate2D {
        guard let location = location else {
            return CLLocationCoordinate2D(latitude: 0, longitude: 0)
        }
        return CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
    }
}

struct Member: ParseObject {
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?
    
    var userId: String?
    var clubId: String?
    var role: String?
    var joinedAt: Date?
}

struct ClubMessage: ParseObject {
    var objectId: String?
    var createdAt: Date?
    var updatedAt: Date?
    var ACL: ParseACL?
    var originalData: Data?
    
    var clubId: String?
    var userId: String?
    var username: String?
    var text: String?
}
