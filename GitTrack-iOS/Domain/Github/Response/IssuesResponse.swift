import Foundation

// MARK: - IssuesResponse
struct IssuesResponse: Codable {
    let issues: [IssueElement]
}

// MARK: - Issue
struct IssueElement: Codable {
    let title: String
    let number: Int
    let fullName: String
    
    enum CodingKeys: String, CodingKey {
        case title, number
        case fullName = "full_name"
    }
}

extension IssuesResponse {
    func toDomain() -> [IssueEntity] {
        self.issues.map {
            .init(title: $0.title, fullName: $0.fullName, number: $0.number)
        }
    }
}
