import SwiftUI

struct RepositoryInfoSummaryView: View {
    let name: String
    let description: String
    let isPrivate: Bool
    
    var body: some View {
        NavigationLink(destination: RepositoryView(name: name, description: description)) {
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
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .frame(width: 9, height: 16)
                    .tint(.gray400)
                    .padding(16)
            }
        }
        .frame(width: 358, height: 80)
        .background(.white)
        .cornerRadius(16)
    }
}

#Preview {
    RepositoryInfoSummaryView(name: "lsdjfl", description: "lsdfhl", isPrivate: true)
}
