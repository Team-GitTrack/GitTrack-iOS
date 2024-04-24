import SwiftUI

struct OrganizationInfoView: View {
    let organizationName: String
    let description: String
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(organizationName)")
                    .font(.header3SemiBold)
                    .foregroundStyle(.blue500)
                
                Text("\(description)")
                    .font(.caption1Regular)
                    .foregroundStyle(.black)
            }
            Spacer()
        }
    }
}

#Preview {
    OrganizationInfoView(organizationName: "skdjhfd", description: "sdfhk")
}
