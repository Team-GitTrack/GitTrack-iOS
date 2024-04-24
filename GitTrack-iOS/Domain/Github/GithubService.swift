import Foundation
import Moya
import RxMoya
import RxSwift
import RxCocoa

public class GithubService {
    let provider = MoyaProvider<GithubAPI>(plugins: [MoyaLoggingPlugin()])
    
    func getAccessToken(code: String) -> Single<TokenResponse> {
        provider.rx.request(.getAccessToken(code: code))
            .map(TokenResponse.self)
    }
    
    func getUserInfo() -> Single<UserInfoEntity> {
        provider.rx.request(.getUserInfo)
            .map(UserInfoResponse.self)
            .map { $0.toDomain() }
    }
    
    func getOrganizations() -> Single<[OrganizationEntity]> {
        provider.rx.request(.getOrganizations)
            .map(OrganizationsResponse.self)
            .map { $0.toDomain() }
    }
    
    func getIssues(filter: IssueType) -> Single<[IssueEntity]> {
        provider.rx.request(.getIssues(filter: filter))
            .map(IssuesResponse.self)
            .map { $0.toDomain() }
    }
    
    func getOrganizationMembers(organization: String) -> Single<[OrganizationMemberEntity]> {
        provider.rx.request(.getOrganizationMemberList(organization: organization))
            .map(OrganizationMembersResponse.self)
            .map { $0.toDomain() }
    }
    
    func getOrganizationRepos(organization: String) -> Single<[OrganizationReposEntity]> {
        provider.rx.request(.getOrganizationRepos(organization: organization))
            .map(OrganizationReposResponse.self)
            .map { $0.toDomain() }
    }
}
