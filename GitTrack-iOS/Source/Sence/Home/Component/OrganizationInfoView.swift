import SwiftUI

struct OrganizationInfoView: View {
    let url: String
    let organizationName: String
    let discription: String
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ImageView(imageUrl: url)
                .frame(width: 100, height: 100)
                .cornerRadius(100)
                .padding(.bottom, 5)
            
            OrganzationInfoTitle(
                organizationName: organizationName,
                description: discription
            )
            .padding(.bottom, 10)
            
            Button(action: {
                print("sldjfhl")
            }, label: {
                Text("더보기")
                    .font(.caption1Medium)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 60)
                    .padding(.vertical, 16)
            })
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
