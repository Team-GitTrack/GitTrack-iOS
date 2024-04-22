import SwiftUI

struct UserInfoView: View {
    let url: String
    let username: String
    let email: String
    let followers: Int
    var body: some View {
        HStack {
            ImageView(imageUrl: url)
                .frame(width: 70, height: 70)
                .cornerRadius(70)
            
            VStack(alignment: .leading, spacing: 5) {
                VStack(alignment: .leading, spacing: 2){
                    Text("@\(username)")
                        .font(.body1SemiBold)
                        .foregroundStyle(.blue600)
                    Text(email)
                        .font(.caption1Regular)
                        .tint(.gray800)
                }
                Text("Followers : \(followers)")
                    .font(.caption1Regular)
                    .foregroundStyle(.gray500)
            }
            Spacer()
        }
        .padding(16)
        .background(.white)
        .cornerRadius(16)
    }
}
