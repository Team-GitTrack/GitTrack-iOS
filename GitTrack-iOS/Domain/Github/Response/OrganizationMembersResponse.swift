import Foundation

// MARK: - OrganizationMembersResponse
struct OrganizationMembersResponse: Codable {
    let members: [Member]
}

// MARK: - Member
struct Member: Codable {
    let login: String
    let avatarURL: String

    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
}

extension OrganizationMembersResponse {
    func toDomain() -> [OrganizationMemberEntity] {
        self.members.map {
            .init(login: $0.login, avatarURL: $0.avatarURL)
        }
    }
}
