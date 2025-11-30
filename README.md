# Original App Design Project - Slice

# Slice 🍕

## Table of Contents
1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)
5.[Progress](#Progress)


---

## Overview

### Description
Slice is a social platform that helps college students discover clubs, connect with communities, and engage with campus life. The app combines location-based club discovery (with an interactive map), Instagram-style posts and social features, and Discord-like community management with role-based permissions. Students can browse clubs on a map, join groups, share posts with photos, follow other users, and manage club memberships.

### App Evaluation

**Category:** Social Networking / Education

**Mobile:** 
- Yes, this is a mobile-first application
- Uses location services for club discovery on an interactive map
- Utilizes camera for uploading photos to posts and profile pictures
- Designed for on-the-go access to campus activities
- Push notifications for club updates and events (planned)

**Story:** 
- Solves the problem of fragmented club information across campus
- Makes it easy for students to discover and join clubs based on their location and interests
- Creates a centralized hub for campus social life
- Combines the best of Instagram (visual posts), Discord (community management), and Meetup (location-based discovery)
- Clear value proposition: "Find your community on campus"

**Market:** 
- Target audience: College and university students (20M+ in the US)
- Can expand to high schools, community colleges, and corporate organizations
- Addresses a real pain point: students struggle to find and engage with campus clubs
- Large, defined market with clear user needs

**Habit:** 
- Daily use app - students check for club updates, events, and social posts
- Multiple engagement loops: creating posts, liking/commenting, browsing clubs, messaging
- Users both consume content (feed, explore) and create content (posts, clubs, comments)
- Social features (follows, likes) create habit-forming engagement
- Event reminders and notifications encourage regular returns

**Scope:** 
- V1 is clearly defined and technically feasible within 8 weeks
- MVP includes: authentication, club discovery (map + list), social posts, follow system, club management
- V2 adds: real-time messaging, events, push notifications
- V3 adds: advanced analytics, event check-in, recommendations
- Well-scoped with room for iterative feature additions

---

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can create a new account (sign up)
* User can log in to existing account
* User can log out of their account
* User can view all clubs on an interactive map
* User can browse clubs in a list view
* User can search for clubs by name
* User can filter clubs by category (Sport, Tech, Music, Arts, Gaming, Business, Education, Social)
* User can view detailed information about a club (name, description, location, members)
* User can join a club
* User can leave a club
* User can create a new club with name, description, category, and location
* User can view a feed of posts from all users
* User can create a post with an image and caption
* User can like a post
* User can comment on a post
* User can search for other users by username
* User can follow another user
* User can unfollow a user
* User can view another user's profile (bio, posts, follower/following counts)
* User can view their own profile with all their posts
* User can edit their profile (upload profile picture, edit bio)
* User can toggle between light and dark mode
* User can view clubs they've joined in "My Clubs"
* Admin of a club can edit club details (name, description, category)
* Admin of a club can promote members to leader role
* Admin of a club can demote leaders to member role
* Admin/Leader of a club can remove members from the club

**Optional Nice-to-have Stories**

* User can send direct messages to other users
* User can create events for clubs with date, time, and location
* User can RSVP to events
* User can receive push notifications for new posts, messages, and events
* User can view recommended clubs based on their interests
* User can apply photo filters to posts
* User can check in to events with QR code
* User can view club analytics (member growth, engagement)
* User can add hashtags to posts
* User can save/bookmark posts
* User can share posts with other users
* User can report inappropriate content
* Admin can view club analytics dashboard
* User can tag other users in posts
* User can view a calendar of upcoming events

---

### 2. Screen Archetypes

#### Authentication Screen
* User can create a new account (sign up)
* User can log in to existing account
* User can see validation errors for invalid credentials

#### Home Feed Screen
* User can view a feed of posts from all users
* User can like a post
* User can comment on a post
* User can tap a post to view comments
* User can tap a username to view that user's profile
* User can create a new post (via + button)

#### Create Post Screen
* User can upload an image from camera or photo library
* User can add a caption to their post
* User can post to share with all users

#### Explore Clubs Screen
* User can view all clubs in list view
* User can view clubs on an interactive map
* User can search for clubs by name
* User can filter clubs by category
* User can toggle between list and map view
* User can create a new club (via + button)
* User can tap a club to view details

#### Create Club Screen
* User can enter club name, description, category
* User can select club location on map
* User can set club privacy (public/private)
* User can create the club (becomes admin automatically)

#### Club Detail Screen
* User can view club information (name, description, category, location)
* User can see member count and privacy status
* User can join or leave the club
* User can view club members with their roles (admin, leader, member)
* User can view club location on map
* Admin/Leader can access club settings (via ⚙️ button)

#### Club Settings Screen (Admin/Leader only)
* Admin/Leader can edit club details
* Admin can promote members to leader
* Admin can demote leaders to member
* Admin/Leader can remove members from club
* Member can leave club (not admin)

#### Edit Club Screen (Admin/Leader only)
* User can edit club name
* User can edit club description
* User can change club category
* User can save changes

#### My Clubs Screen
* User can view all clubs they've joined
* User can see their role in each club (admin, leader, member)
* User can tap a club to view details

#### Search Users Screen
* User can search for users by username
* User can view search results
* User can tap a user to view their profile
* User can follow/unfollow users from search results

#### User Profile Screen (Other Users)
* User can view another user's profile information
* User can view user's posts in a grid layout
* User can see follower and following counts
* User can follow or unfollow the user
* User can tap a post to view it

#### My Profile Screen
* User can view their own profile
* User can view their posts in a grid layout
* User can see their follower, following, and post counts
* User can access edit profile
* User can access settings

#### Edit Profile Screen
* User can upload or change profile picture
* User can edit bio
* User can save profile changes

#### Settings Screen
* User can navigate to edit profile
* User can toggle dark mode on/off
* User can sign out of their account
* User can view app version

---

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home Feed - View all posts
* Explore - Browse clubs (list and map)
* Search - Find users
* My Clubs - View joined clubs
* Profile - View own profile and settings

**Flow Navigation** (Screen to Screen)

#### Authentication Screen
* => Home Feed (after successful login/signup)

#### Home Feed Screen
* => Create Post Screen (tap + button)
* => Post Detail Screen (tap post to see comments)
* => User Profile Screen (tap username on post)

#### Create Post Screen
* => Home Feed (after posting)

#### Explore Clubs Screen
* => Create Club Screen (tap + button)
* => Club Detail Screen (tap club card)
* => Map View (toggle view button)

#### Create Club Screen
* => Club Detail Screen (after creating club)

#### Club Detail Screen
* => Club Settings Screen (tap ⚙️ button - admin/leader only)
* => User Profile Screen (tap member in list)

#### Club Settings Screen
* => Edit Club Screen (tap "Edit Club Details")
* => Club Detail Screen (tap "Done")

#### Edit Club Screen
* => Club Settings Screen (after saving)

#### My Clubs Screen
* => Club Detail Screen (tap club)

#### Search Users Screen
* => User Profile Screen (tap user in search results)

#### User Profile Screen (Others)
* => Post Detail Screen (tap post in grid)

#### My Profile Screen
* => Edit Profile Screen (tap "Edit Profile")
* => Settings Screen (tap ⚙️)
* => Post Detail Screen (tap post in grid)

#### Edit Profile Screen
* => My Profile Screen (after saving)

#### Settings Screen
* => Edit Profile Screen (tap "Edit Profile")
* => Authentication Screen (tap "Sign Out")

---

## Wireframes

### Hand-Sketched Wireframes
[Add photo of your hand-drawn wireframes here]

###  Digital Wireframes & Mockups

#### Authentication Flow
```
┌─────────────────────┐
│     S   Logo        │
│      Slice          │
│                     │
│  [Username Field]   │
│  [Email Field]      │
│  [Password Field]   │
│                     │
│  [Sign Up Button]   │
│                     │
│  Already have       │
│  account? Sign In   │
└─────────────────────┘
```

#### Home Feed
```
┌─────────────────────┐
│ Feed            [+] │
├─────────────────────┤
│ ┌─[○] Username     │
│ │  [Post Image]    │
│ │  Caption text... │
│ │  ❤️ 23  💬 5      │
│ └─────────────────  │
│ ┌─[○] Username     │
│ │  [Post Image]    │
│ └─────────────────  │
├─────────────────────┤
│ 🏠 🔍 👥 📱 👤     │ (Tab Bar)
└─────────────────────┘
```

#### Explore Clubs
```
┌─────────────────────┐
│ Explore         [+] │
│ [Search bar...]     │
│ [All][Sport][Tech]  │
│ [List] [Map]        │
├─────────────────────┤
│ ┌[F] First Club    │
│ │  Social • 1 mem.  │
│ ├─────────────────  │
│ ┌[J] JPMorgan      │
│ │  Business • 1 m.  │
│ └─────────────────  │
├─────────────────────┤
│ 🏠 🔍 👥 📱 👤     │
└─────────────────────┘
```

#### Club Detail
```
┌─────────────────────┐
│  < Club        [⚙️] │
├─────────────────────┤
│   [Club Cover]      │
│      [Icon]         │
│   Club Name         │
│   [Category]        │
│   Description...    │
│                     │
│ ┌─────┬─────┬─────┐│
│ │ 25  │     │Pub..││
│ │Memb.│     │lic  ││
│ └─────┴─────┴─────┘│
│                     │
│  [Join Club]        │
│                     │
│ 📍 Location         │
│ [Map Preview]       │
│                     │
│ Members (25)        │
│ [○ ○ ○ ○ ...]     │
└─────────────────────┘
```

#### Club Settings (Admin)
```
┌─────────────────────┐
│ Club Settings    [X]│
├─────────────────────┤
│ Club Management     │
│  ✏️ Edit Club Det...│
├─────────────────────┤
│ Members (3)         │
│ [○] John [ADMIN]    │
│ [○] Sarah [LEADER]..│
│ [○] Mike [MEMBER].. │
└─────────────────────┘
```

#### My Profile
```
┌─────────────────────┐
│ Profile        [⚙️] │
├─────────────────────┤
│      [Profile]      │
│      @username      │
│      Bio text...    │
│                     │
│  25     30    12    │
│ Posts Follow. Foll. │
│                     │
│ [Edit Profile]      │
│                     │
│ ┌──┬──┬──┐         │
│ │▪️│▪️│▪️│ (Posts) │
│ ├──┼──┼──┤         │
│ │▪️│▪️│▪️│         │
│ └──┴──┴──┘         │
├─────────────────────┤
│ 🏠 🔍 👥 📱 👤     │
└─────────────────────┘
```

### [BONUS] Interactive Prototype
[Add link to Figma/InVision prototype if created]

---

## Schema 

### Models

#### User

| Property | Type | Description |
|----------|------|-------------|
| objectId | String | unique id for the user (default field) |
| username | String | unique username for login |
| email | String | user's email address |
| password | String | user's password for authentication (hashed) |
| bio | String | user's profile bio/description |
| profileImageURL | String | URL to user's profile picture |
| followersCount | Number | number of users following this user |
| followingCount | Number | number of users this user follows |
| postsCount | Number | number of posts created by user |
| createdAt | DateTime | date when user was created (default field) |
| updatedAt | DateTime | date when user was last updated (default field) |

#### Club

| Property | Type | Description |
|----------|------|-------------|
| objectId | String | unique id for the club (default field) |
| name | String | name of the club |
| description | String | description of the club |
| category | String | category of club (Sport, Tech, Music, etc.) |
| location | GeoPoint | geographic coordinates of club location |
| address | String | human-readable address of club |
| privacy | String | "Public" or "Private" |
| memberCount | Number | number of members in the club |
| adminId | String | objectId of the club creator/admin |
| leaderIds | Array<String> | array of objectIds for club co-leaders |
| moderatorIds | Array<String> | array of objectIds for club moderators |
| createdAt | DateTime | date when club was created (default field) |
| updatedAt | DateTime | date when club was last updated (default field) |

#### Member

| Property | Type | Description |
|----------|------|-------------|
| objectId | String | unique id for the membership (default field) |
| userId | String | objectId of the user |
| clubId | String | objectId of the club |
| role | String | user's role in club ("admin", "leader", "moderator", "member") |
| joinedAt | DateTime | date when user joined the club |
| createdAt | DateTime | date when membership was created (default field) |
| updatedAt | DateTime | date when membership was last updated (default field) |

#### Post

| Property | Type | Description |
|----------|------|-------------|
| objectId | String | unique id for the post (default field) |
| userId | String | objectId of the user who created the post |
| imageURL | String | URL to the post's image |
| caption | String | caption/description for the post |
| likesCount | Number | number of likes on the post |
| commentsCount | Number | number of comments on the post |
| createdAt | DateTime | date when post was created (default field) |
| updatedAt | DateTime | date when post was last updated (default field) |

#### Comment

| Property | Type | Description |
|----------|------|-------------|
| objectId | String | unique id for the comment (default field) |
| postId | String | objectId of the post being commented on |
| userId | String | objectId of the user who wrote the comment |
| text | String | content of the comment |
| createdAt | DateTime | date when comment was created (default field) |
| updatedAt | DateTime | date when comment was last updated (default field) |

#### Like

| Property | Type | Description |
|----------|------|-------------|
| objectId | String | unique id for the like (default field) |
| postId | String | objectId of the post being liked |
| userId | String | objectId of the user who liked |
| createdAt | DateTime | date when like was created (default field) |
| updatedAt | DateTime | date when like was last updated (default field) |

#### Friendship

| Property | Type | Description |
|----------|------|-------------|
| objectId | String | unique id for the friendship (default field) |
| followerId | String | objectId of the user who is following |
| followingId | String | objectId of the user being followed |
| createdAt | DateTime | date when follow was created (default field) |
| updatedAt | DateTime | date when follow was last updated (default field) |

---

### Networking

#### List of network requests by screen

**Authentication Screen**
- (POST) Create new user account
  ```swift
  func signUp(username: String, email: String, password: String) async throws -> User {
      var user = User()
      user.username = username
      user.email = email
      user.password = password
      return try await user.signup()
  }
  ```
- (POST) Log in existing user
  ```swift
  func signIn(username: String, password: String) async throws -> User {
      return try await User.login(username: username, password: password)
  }
  ```

**Home Feed Screen**
- (GET) Fetch all posts
  ```swift
  func fetchAllPosts() async throws -> [Post] {
      let query = Post.query()
          .include("user")
          .order([.descending("createdAt")])
          .limit(50)
      return try await query.find()
  }
  ```
- (POST) Create a new like on a post
  ```swift
  func likePost(postId: String, userId: String) async throws {
      var like = Like()
      like.postId = postId
      like.userId = userId
      _ = try await like.save()
  }
  ```
- (DELETE) Remove a like from a post
  ```swift
  func unlikePost(likeId: String) async throws {
      let like = Like()
      like.objectId = likeId
      try await like.delete()
  }
  ```
- (POST) Create a new comment on a post
  ```swift
  func addComment(postId: String, userId: String, text: String) async throws {
      var comment = Comment()
      comment.postId = postId
      comment.userId = userId
      comment.text = text
      _ = try await comment.save()
  }
  ```

**Create Post Screen**
- (POST) Create a new post
  ```swift
  func createPost(userId: String, image: UIImage, caption: String) async throws -> Post {
      // Upload image
      let imageFile = ParseFile(data: image.jpegData(compressionQuality: 0.8)!)
      let uploadedFile = try await imageFile.save()
      
      // Create post
      var post = Post()
      post.userId = userId
      post.imageURL = uploadedFile.url
      post.caption = caption
      post.likesCount = 0
      post.commentsCount = 0
      return try await post.save()
  }
  ```

**Explore Clubs Screen**
- (GET) Fetch all clubs
  ```swift
  func fetchAllClubs() async throws -> [Club] {
      let query = Club.query()
          .limit(100)
          .order([.descending("createdAt")])
      return try await query.find()
  }
  ```
- (GET) Search clubs by name
  ```swift
  func searchClubs(searchText: String) async throws -> [Club] {
      let query = Club.query().limit(50)
      let clubs = try await query.find()
      return clubs.filter { $0.name?.localizedCaseInsensitiveContains(searchText) ?? false }
  }
  ```
- (GET) Filter clubs by category
  ```swift
  func filterClubsByCategory(category: ClubCategory) async throws -> [Club] {
      let clubs = try await fetchAllClubs()
      return clubs.filter { $0.category == category.rawValue }
  }
  ```

**Create Club Screen**
- (POST) Create a new club
  ```swift
  func createClub(name: String, description: String, category: ClubCategory,
                  location: CLLocationCoordinate2D, address: String, 
                  isPrivate: Bool) async throws -> Club {
      var club = Club()
      club.name = name
      club.description = description
      club.category = category.rawValue
      club.location = try ParseGeoPoint(latitude: location.latitude, 
                                       longitude: location.longitude)
      club.address = address
      club.privacy = isPrivate ? "Private" : "Public"
      club.memberCount = 1
      club.adminId = User.current?.objectId
      return try await club.save()
  }
  ```

**Club Detail Screen**
- (GET) Check if user is a member
  ```swift
  func checkMembership(userId: String, clubId: String) async throws -> Bool {
      let allMembers = try await Member.query().find()
      return allMembers.contains { $0.userId == userId && $0.clubId == clubId }
  }
  ```
- (POST) Join a club
  ```swift
  func joinClub(userId: String, clubId: String) async throws {
      var member = Member()
      member.userId = userId
      member.clubId = clubId
      member.role = "member"
      member.joinedAt = Date()
      _ = try await member.save()
  }
  ```
- (DELETE) Leave a club
  ```swift
  func leaveClub(userId: String, clubId: String) async throws {
      let allMembers = try await Member.query().find()
      if let member = allMembers.first(where: { 
          $0.userId == userId && $0.clubId == clubId 
      }) {
          try await member.delete()
      }
  }
  ```
- (GET) Get club members with roles
  ```swift
  func getClubMembersWithRoles(clubId: String) async throws -> [(user: User, role: String)] {
      let members = try await Member.query().find()
      let clubMembers = members.filter { $0.clubId == clubId }
      // Fetch user details and combine with roles
      // Implementation details in ParseService.swift
  }
  ```

**Club Settings Screen**
- (PUT) Update club details
  ```swift
  func updateClub(clubId: String, name: String?, description: String?, 
                  category: String?) async throws {
      let allClubs = try await Club.query().find()
      if var club = allClubs.first(where: { $0.objectId == clubId }) {
          if let name = name { club.name = name }
          if let description = description { club.description = description }
          if let category = category { club.category = category }
          _ = try await club.save()
      }
  }
  ```
- (PUT) Promote member to leader
  ```swift
  func promoteToLeader(userId: String, clubId: String) async throws {
      let allClubs = try await Club.query().find()
      if var club = allClubs.first(where: { $0.objectId == clubId }) {
          var leaderIds = club.leaderIds ?? []
          leaderIds.append(userId)
          club.leaderIds = leaderIds
          _ = try await club.save()
      }
  }
  ```
- (DELETE) Remove member from club
  ```swift
  func removeMember(userId: String, clubId: String) async throws {
      try await leaveClub(userId: userId, clubId: clubId)
  }
  ```

**Search Users Screen**
- (GET) Search users by username
  ```swift
  func searchUsers(searchText: String) async throws -> [User] {
      let allUsers = try await User.query().find()
      return allUsers.filter { 
          $0.username?.localizedCaseInsensitiveContains(searchText) ?? false 
      }
  }
  ```
- (POST) Follow a user
  ```swift
  func followUser(followerId: String, followingId: String) async throws {
      var friendship = Friendship()
      friendship.followerId = followerId
      friendship.followingId = followingId
      _ = try await friendship.save()
  }
  ```
- (DELETE) Unfollow a user
  ```swift
  func unfollowUser(followerId: String, followingId: String) async throws {
      let friendships = try await Friendship.query().find()
      if let friendship = friendships.first(where: { 
          $0.followerId == followerId && $0.followingId == followingId 
      }) {
          try await friendship.delete()
      }
  }
  ```

**User Profile Screen**
- (GET) Fetch user's posts
  ```swift
  func getUserPosts(userId: String) async throws -> [Post] {
      let allPosts = try await Post.query().find()
      return allPosts.filter { $0.userId == userId }
          .sorted { ($0.createdAt ?? Date()) > ($1.createdAt ?? Date()) }
  }
  ```

**Edit Profile Screen**
- (PUT) Update user profile
  ```swift
  func updateProfile(bio: String?, profileImage: UIImage?) async throws {
      guard var user = User.current else { return }
      
      if let bio = bio {
          user.bio = bio
      }
      
      if let image = profileImage {
          let imageFile = ParseFile(data: image.jpegData(compressionQuality: 0.8)!)
          let uploadedFile = try await imageFile.save()
          user.profileImageURL = uploadedFile.url
      }
      
      _ = try await user.save()
  }
  ```

**My Clubs Screen**
- (GET) Fetch user's clubs
  ```swift
  func getUserClubs(userId: String) async throws -> [Club] {
      let allMembers = try await Member.query().find()
      let userMemberships = allMembers.filter { $0.userId == userId }
      let clubIds = userMemberships.compactMap { $0.clubId }
      
      let allClubs = try await Club.query().find()
      return allClubs.filter { clubIds.contains($0.objectId ?? "") }
  }
  ```

**Settings Screen**
- (POST) Sign out
  ```swift
  func signOut() async throws {
      try await User.logout()
  }
  ```

---

#### Existing API Endpoints

**Back4App Parse Server**
- Base URL: `https://parseapi.back4app.com`
- All endpoints use standard Parse REST API format
- Authentication via Application ID and Client Key headers
- Automatic endpoints for each Parse class (User, Club, Post, etc.)


#### Progress
## Authenticator 

![ezgif-13f26db8143fed4c](https://github.com/user-attachments/assets/35c1ac93-3cbc-47ab-b9ef-135fe2f48033)

## Messages:
![ezgif-5f798cf49e76e8d0](https://github.com/user-attachments/assets/b5c711b9-d449-4b74-bb66-19e34ad594c7)

## Profile + Dark Mode 

![ezgif-52c2d0944ea8d18c](https://github.com/user-attachments/assets/b0839522-bb74-4aff-9ba4-2ff837941fb2)


## Discover page
![ezgif-5e872e59b209434e](https://github.com/user-attachments/assets/43b06550-de5e-4cba-8ecf-f8dc7c65784a)

## Events
![ezgif-561be3f5396cf2fb](https://github.com/user-attachments/assets/266c1eaa-9cd3-4ef9-9888-95749be167ed)

![ezgif-5bb3cf1751bc8b4c](https://github.com/user-attachments/assets/16cb643c-a12e-4aa3-b4de-63cb46f77135)

## Posts / Feed

![ezgif-507814ecc7903e12](https://github.com/user-attachments/assets/485c90aa-1cf4-4ad0-a66e-bf619cc6c6d2)


####  Full Video Link Presetation 
### https://youtu.be/o5rzRO6zdns 


---

## License

    Copyright 2025 Ahmet Aytac

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
