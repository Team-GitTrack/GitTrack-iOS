import SwiftUI
import RxSwift
import Moya

class RepositoryViewModel: ObservableObject {
    @Published var languages: [LanguageEntity] = []
    @Published var contributors: [ContributorEntity] = []
    @Published var commits: [CommitsEntity] = []
    @Published var maxLanguages: Int = 0
    let githubService = GithubService()
    private let disposeBag = DisposeBag()
    
    func getRepositoryLanguages(organization: String, repository: String) {
        githubService.getRepositoryLanguages(organization: organization, repository: repository)
            .subscribe(onSuccess: { [weak self] in
                guard let self else { return }
                languages = $0.sorted { $0.count < $1.count }
                maxLanguages = $0.map {
                    $0.count
                }.max() ?? 0
            })
            .disposed(by: disposeBag)
    }
    
    func getRepositoryContributors(organization: String, repository: String) {
        githubService.getRepositoryContributors(organization: organization, repository: repository)
            .subscribe(onSuccess: { [weak self] in
                guard let self else { return }
                contributors = $0
            })
            .disposed(by: disposeBag)
    }
    
    func getRepositoryCommits(organization: String, repository: String) {
        githubService.getRepositoryCommits(organization: organization, repository: repository)
            .subscribe(onSuccess: { [weak self] commitList in
                guard let self else { return }
                var commitData = commitList
                var userID: Set<String> = []
                let maxMonth = commitList.map { $0.month }.max() ?? 0
                commitList.forEach { userID.insert($0.login) }

                userID.forEach { name in
                    var monthChecker = [Bool](repeating: false, count: maxMonth)
                    commitList
                        .filter { $0.login == name }
                        .forEach { monthChecker[$0.month - 1] = true }

                    monthChecker.enumerated()
                        .filter { !$0.element }
                        .forEach { commitData.append(.init(login: name, month: $0.offset + 1, commitCount: 0))}
                }
                commits = commitData.sorted { $0.month < $1.month }
        })
        .disposed(by: disposeBag)
    }
}

