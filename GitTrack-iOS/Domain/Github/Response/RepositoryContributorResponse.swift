import Foundation

// MARK: - RepositoryContributorResponse
struct RepositoryContributorResponse: Codable {
    let contributors: [Contributor]
}

// MARK: - Contributor
struct Contributor: Codable {
    let login: String
    let contributions: Int
}

extension RepositoryContributorResponse {
    func toDomain() -> [ContributorEntity] {
        self.contributors.map {
            .init(login: $0.login, contributions: $0.contributions)
        }
    }
}
