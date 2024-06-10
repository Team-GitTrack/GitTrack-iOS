import Foundation

struct RepositoryCommitResponse: Decodable {
    let commits: [Commits]
}

struct Commits: Decodable {
    let login: String
    let month: Int
    let value: Int
}

extension RepositoryCommitResponse {
    func toDomain() -> RepositoryCommitEntity {
        .init(commits: commits.map { $0.toDomain() })
    }
}

extension Commits {
    func toDomain() -> CommitsEntity {
        .init(login: login, month: month, commitCount: value)
    }
}
