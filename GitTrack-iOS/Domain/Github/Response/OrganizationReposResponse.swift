
import Foundation

// MARK: - OrganizationReposResponse
struct OrganizationReposResponse: Codable {
    let repos: [Repo]
}

// MARK: - Repo
struct Repo: Codable {
    let name, description: String
    let isPrivate: Bool
    
    enum CodingKeys: String, CodingKey {
        case name, description
        case isPrivate = "is_private"
    }
}

extension OrganizationReposResponse {
    func toDomain() -> [OrganizationReposEntity] {
        self.repos.map {
            .init(name: $0.name, description: $0.description, isPrivate: $0.isPrivate)
        }
    }
}
