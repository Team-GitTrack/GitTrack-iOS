//
//  OrganzationInfoTitle.swift
//  GitTrack-iOS
//
//  Created by 김주영 on 4/5/24.
//

import SwiftUI

struct OrganzationInfoTitle: View {

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

#Preview {
    OrganzationInfoTitle(
        organizationName: "XQUARE",
        description: "대덕소프트웨어마이스터고등학교"
    )
}
