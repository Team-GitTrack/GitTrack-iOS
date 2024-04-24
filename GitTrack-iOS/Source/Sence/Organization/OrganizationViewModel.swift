import SwiftUI
import RxSwift
import Moya

class OrganizationViewModel: ObservableObject {
    @Published var members: [OrganizationMemberEntity] = []
    @Published var repos: [OrganizationReposEntity] = []
    
    let githubService = GithubService()
    private let disposeBag = DisposeBag()
    
    func getOrganizationMembers(organization: String) {
        githubService.getOrganizationMembers(organization: organization)
            .subscribe(onSuccess: { [weak self] in
                guard let self else { return }
                members = $0
            })
            .disposed(by: disposeBag)
    }
    
    func getOrganizationRepos(organization: String) {
        githubService.getOrganizationRepos(organization: organization)
            .subscribe(onSuccess: { [weak self] in
                guard let self else {return}
                repos = $0
            })
            .disposed(by: disposeBag)
    }
}
