import SwiftUI

struct OrganzationInfoSummaryView: View {
    
    let organizationName: String
    let description: String
    
    var body: some View {
        VStack {
            Text(organizationName)
                .font(.body2SemiBold)
                .foregroundColor(.blue500)
                .lineLimit(1)
            Text(description)
                .font(.caption1Regular)
                .foregroundColor(.gray800)
                .lineLimit(1)
        }
    }
}
