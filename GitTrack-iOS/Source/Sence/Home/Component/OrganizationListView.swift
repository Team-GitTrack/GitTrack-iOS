import SwiftUI

struct OrganizationListView: View {
    let url: String
    let organizationName: String
    let description: String
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ImageView(imageUrl: url)
                .frame(width: 100, height: 100)
                .cornerRadius(100)
                .padding(.bottom, 5)
            
            OrganzationInfoSummaryView(
                organizationName: organizationName,
                description: description
            )
            .padding(.bottom, 10)
            
            NavigationLink(
                destination: OrganizationView(organizationName: organizationName, description: description)
            ) {
                Text("더보기")
                    .font(.caption1Medium)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 60)
                    .padding(.vertical, 16)
            }
            .frame(width: 160, height: 49)
            .background(.blue500)
            .cornerRadius(16)
        }
        .padding(16)
        .background(.white)
        .frame(width: 192, alignment: .center)
        .cornerRadius(32)
    }
}
