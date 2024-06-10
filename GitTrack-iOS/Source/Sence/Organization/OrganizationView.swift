import SwiftUI

struct OrganizationView: View {
    let organizationName: String
    let description: String
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 0) {
                OrganizationInfoView(organizationName: organizationName, description: description)
                OrganizationMemberListView(organization: organizationName)
                RepositoryListView(organization: organizationName)
                Spacer()
            }
            .padding(.horizontal, 16)
        }
        .setCustomNavigationBarTitle(organizationName)
        .background(Color(.blue50).ignoresSafeArea())
        .ignoresSafeArea(.all, edges: .bottom)
    }
}
