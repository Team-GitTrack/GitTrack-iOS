import Moya
import Foundation

enum GithubAPI {
    case getAccessToken(code: String)
    case getUserInfo
    case getOrganizations
    case getIssues(filter: IssueType)
    case getOrganizationMemberList(organization: String)
    case getOrganizationRepos(organization: String)
    case getRepositoryLanguages(organization: String, repository: String)
    case getRepositoryContributors(organization: String, repository: String)
    case getRepositoryCommits(org: String, repo: String)
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
        case let .getOrganizationMemberList(organization):
            return "/\(organization)/members"
        case let .getOrganizationRepos(organization):
            return "/\(organization)/repos"
        case let .getRepositoryLanguages(organization, repository):
            return "/\(organization)/\(repository)/languages"
        case let .getRepositoryContributors(organization, repository):
            return "/\(organization)/\(repository)/contributors"
        case let .getRepositoryCommits(org, repo):
            return "/\(org)/\(repo)/commits"
        }
    }
    
    var validationType: ValidationType { .successCodes }
    
    var method: Moya.Method { .get }
    
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
        case .getAccessToken, .getRepositoryLanguages:
            return Header.tokenIsEmpty.header()
        case .getUserInfo, .getOrganizations, .getIssues, .getOrganizationMemberList, .getOrganizationRepos, .getRepositoryContributors, .getRepositoryCommits:
            return Header.accessToken.header()
        }
    }
}
