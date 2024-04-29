import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    @State var selectItem: IssueType = .CREATED
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                UserInfoView(url: viewModel.userInfoEntity.avatarURL, username: viewModel.userInfoEntity.login, email: viewModel.userInfoEntity.email, followers: viewModel.userInfoEntity.followers)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(alignment: .center, spacing: 16) {
                        ForEach(viewModel.organizations, id: \.self) {
                            OrganizationListView(
                                url: $0.avatarURL,
                                organizationName: $0.login,
                                description: $0.description
                            )
                        }
                    }
                }
                
                VStack {
                    IssueTypeButtonsView(selectedItem: $selectItem) {
                        viewModel.getIssues(filter: selectItem)
                    }
                    if viewModel.isLoading {
                        Spacer()
                        ProgressView()
                    } else {
                        ScrollView(showsIndicators: false) {
                            ForEach(viewModel.issues, id: \.self) {
                                IssueListView(
                                    fullName: $0.fullName,
                                    title: $0.title,
                                    number: $0.number
                                )
                                .padding(4)
                            }
                        }
                    }
                    Spacer()
                }
                .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                .frame(width: 358, height: 358)
                .background(.white)
                .cornerRadius(32)
                
                Spacer()
            }
            .padding(16)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.blue50).ignoresSafeArea())
            .onAppear {
                viewModel.getUserInfo()
                viewModel.getOrganizations()
                viewModel.getIssues(filter: .CREATED)
            }
        }
    }
}

#Preview {
    HomeView()
}
