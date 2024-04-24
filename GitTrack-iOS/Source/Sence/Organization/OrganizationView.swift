import SwiftUI

struct OrganizationView: View {
    let organizationName: String
    let description: String
    var body: some View {
        VStack(spacing: 16) {
            OrganizationInfoView(organizationName: organizationName, description: description)
            OrganizationMemberListView(organization: organizationName)
            RepositoryListView(organization: organizationName)
            Spacer()
        }
        .padding(16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .setCustomNavigationBarTitle(organizationName)
        .background(Color(.blue50).ignoresSafeArea())
    }
}
