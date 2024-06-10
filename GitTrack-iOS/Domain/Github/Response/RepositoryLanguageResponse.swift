import Foundation

// MARK: - RepositoryLanguageResponse
struct RepositoryLanguageResponse: Codable {
    let languages: [Language]
}

// MARK: - Language
struct Language: Codable {
    let name: String
    let count: Int
}

extension RepositoryLanguageResponse {
    func toDomain() -> [LanguageEntity] {
        self.languages.map {
            .init(name: $0.name, count: $0.count)
        }
    }
}
