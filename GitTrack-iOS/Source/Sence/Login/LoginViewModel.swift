import SwiftUI
import RxSwift
import Moya

class LoginViewModel: ObservableObject {
    let githubService = GithubService()
    @Published var loginSuccess: Bool = false
    private let disposeBag = DisposeBag()
    func getAccessToken(code: String) {
        githubService.getAccessToken(code: code)
            .subscribe(onSuccess: { Token.accessToken = $0.accessToken })
            .disposed(by: disposeBag)
    }
}
