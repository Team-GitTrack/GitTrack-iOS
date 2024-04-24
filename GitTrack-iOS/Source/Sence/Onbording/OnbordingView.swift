import SwiftUI

struct OnbordingView: View {
    @StateObject var viewModel = OnbordingViewModel()

    var body: some View {
        VStack {
            Image(.gitLogo)
                .resizable()
                .frame(width: 150, height: 150)
        }
        .onAppear {
            if !viewModel.loginIsRequied {
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                    viewModel.loginIsRequied = true
                }
            } else { viewModel.homeIsRequired = true }
        }
        .fullScreenCover(isPresented: $viewModel.homeIsRequired) {
            HomeView()
        }
        .fullScreenCover(isPresented: $viewModel.loginIsRequied) {
            LoginView()
        }
    }
}
