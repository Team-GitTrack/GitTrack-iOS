import SwiftUI
import RxSwift
import Moya

class OnbordingViewModel: ObservableObject {
    private let disposeBag = DisposeBag()
    @Published var loginIsRequied: Bool = false
    @Published var homeIsRequired: Bool = false
}
