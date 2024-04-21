import Foundation

// MARK: - OrganizationListResponse
struct OrganizationsResponse: Codable {
    let organizations: [OrganizationElement]
}

// MARK: - OrganizationElement
struct OrganizationElement: Codable {
    let login: String
    let avatarURL: String
    let description: String

    enum CodingKeys: String, CodingKey {
        case login, description
        case avatarURL = "avatar_url"
    }
}


extension OrganizationsResponse {
    func toDomain() -> [OrganizationEntity] {
        self.organizations.map {
            .init(login: $0.login, avatarURL: $0.avatarURL, description: $0.description)
        }
    }
}
