import Foundation

struct RepositoryCommitEntity: Hashable {
    let commits: [CommitsEntity]
}

struct CommitsEntity: Hashable {
    let login: String
    let month: Int
    let commitCount: Int
}

extension RepositoryCommitEntity {
    static let mock: [CommitsEntity] = [
        .init(login: "hello", month: 1, commitCount: 10),
        .init(login: "yee", month: 1, commitCount: 30),
        .init(login: "hello", month: 2, commitCount: 20),
        .init(login: "yee", month: 2, commitCount: 80)
    ]
}
