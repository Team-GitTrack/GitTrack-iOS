import SwiftUI

struct OrganizationMemberView: View {
    let imageUrl: String
    let login: String
    var body: some View {
        VStack(spacing: 3) {
            ImageView(imageUrl: imageUrl)
                .frame(width: 50, height: 50)
                .cornerRadius(50)
            Text("@\(login)")
                .font(.caption1Regular)
                .foregroundStyle(.gray800)
            
        }
    }
}

#Preview {
    OrganizationMemberView(imageUrl: "https://images-ng.pixai.art/images/orig/48a4207e-5f8d-4daa-85e6-1111d1812c72", login: "sdjf")
}
