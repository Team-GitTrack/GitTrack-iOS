import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @Environment(\.presentationMode) var dismiss
    var body: some View {
        VStack {
            Text("GitTrack")
                .font(.header1Bold)
                .foregroundStyle(.blue500)
            Text("Project, Git 분석을 위한")
                .font(.body1Medium)
                .foregroundStyle(.blue800)
            
            Link(destination: URL(string: "http://localhost:8080/oauth2/authorization/github")!) {
                HStack {
                    Image(.githubLogo)
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Github로 로그인하기")
                        .font(.body3Medium)
                        .foregroundStyle(.white)
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 55)
            }
            .background(.black)
            .cornerRadius(16)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.blue50).ignoresSafeArea())
        .onOpenURL { url in
            let code = url.absoluteString.components(separatedBy: "code=").last ?? ""
            viewModel.getAccessToken(code: code.components(separatedBy: "&state=").first!)
            dismiss.wrappedValue.dismiss()
//            viewModel.loginSuccess = true
        }
//        .fullScreenCover(isPresented: $viewModel.loginSuccess) {
//            HomeView()
//        }
        
    }
}

#Preview {
    LoginView()
}
