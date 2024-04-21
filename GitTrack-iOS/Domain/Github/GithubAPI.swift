import Moya
import Foundation

enum GithubAPI {
    case getAccessToken(code: String)
    case getUserInfo
    case getOrganizations
    case getIssues(filter: IssueType)
}

extension GithubAPI: TargetType {
    var baseURL: URL {
        return URL(string: "http://localhost:8080/github")!
    }
    
    var path: String {
        switch self {
        case let .getAccessToken(code):
            return "/token/\(code)"
        case .getUserInfo:
            return "/user"
        case .getOrganizations:
            return "/organizations"
        case .getIssues:
            return "/issues"
        }
    }
    
    var validationType: ValidationType { .successCodes }
    
    var method: Moya.Method {
        switch self {
        case .getAccessToken, .getUserInfo, .getOrganizations, .getIssues:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getIssues(let type):
            return .requestParameters(
                parameters: [
                    "filter": type.filter
                ],
                encoding: URLEncoding.queryString
            )
        default:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getAccessToken:
            return Header.tokenIsEmpty.header()
        case .getUserInfo, .getOrganizations, .getIssues:
            return Header.accessToken.header()
        }
    }
}
