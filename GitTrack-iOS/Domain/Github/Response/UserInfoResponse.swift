import Foundation

// MARK: - UserInfoResponse
struct UserInfoResponse: Codable {
    let login, email, avatarURL: String
    let followers: Int
    
    enum CodingKeys: String, CodingKey {
        case login, email, followers
        case avatarURL = "avatar_url"
    }
}

extension UserInfoResponse {
    func toDomain() -> UserInfoEntity {
        .init(
            login: login,
            email: email,
            avatarURL: avatarURL,
            followers: followers
        )
    }
}
