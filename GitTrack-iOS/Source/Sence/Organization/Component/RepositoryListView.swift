import SwiftUI

struct RepositoryListView: View {
    @ObservedObject var viewModel = OrganizationViewModel()
    let organization: String
    var body: some View {
            VStack(alignment: .leading, spacing: 6) {
                Text("Repositories")
                    .font(.body2SemiBold)
                    .foregroundStyle(.blue800)
                
                VStack(spacing: 6) {
                    ForEach(viewModel.repos, id: \.self) {
                        RepositoryInfoSummaryView(name: $0.name, description: $0.description, isPrivate: $0.isPrivate, orgName: organization)
                    }
                }
                
            }
            .padding(.top, 16)
            .onAppear {
                viewModel.getOrganizationRepos(organization: organization)
            }
    }
}

#Preview {
    RepositoryListView(organization: "team-xquare")
}
