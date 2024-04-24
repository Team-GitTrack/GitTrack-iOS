import SwiftUI

struct RepositoryInfoSummaryView: View {
    let name: String
    let description: String
    let isPrivate: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 3) {
                Text("\(name)")
                    .font(.body3SemiBold)
                    .foregroundStyle(.gray800)
                Text("\(description)")
                    .font(.caption1Regular)
                    .foregroundStyle(.gray500)
                IsPrivateView(isPrivate: isPrivate)
            }
            .padding(16)
            Spacer()
        }
        .frame(width: 358, height: 80)
        .background(.white)
        .cornerRadius(16)
    }
}

#Preview {
    RepositoryInfoSummaryView(name: "lsdjfl", description: "lsdfhl", isPrivate: true)
}
