import SwiftUI
import RxSwift
import Moya

class HomeViewModel: ObservableObject {
    
    @Published var userInfoEntity: UserInfoEntity = .init(login: "", email: "", avatarURL: "", followers: 0)
    @Published var organizations: [OrganizationEntity] = []
    @Published var issues: [IssueEntity] = []
    @Published var isLoading = false
    
    let githubService = GithubService()
    private let disposeBag = DisposeBag()
    
    func getUserInfo() {
        githubService.getUserInfo()
            .subscribe(onSuccess: { [weak self] in
                guard let self else { return }
                userInfoEntity = $0
            })
            .disposed(by: disposeBag)
    }
    
    func getOrganizations() {
        githubService.getOrganizations()
            .subscribe(onSuccess: { [weak self] in
                guard let self else { return }
                organizations = $0
            })
            .disposed(by: disposeBag)
    }
    
    func getIssues(filter: IssueType) {
        isLoading = true
        githubService.getIssues(filter: filter)
            .subscribe(onSuccess: { [weak self] in
                guard let self else { return }
                issues = $0
                isLoading = false
            })
            .disposed(by: disposeBag)
    }
}
