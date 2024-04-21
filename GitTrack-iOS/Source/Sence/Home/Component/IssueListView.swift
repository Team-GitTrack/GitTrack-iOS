//
//  PRListView.swift
//  GitTrack-iOS
//
//  Created by 김주영 on 4/16/24.
//

import SwiftUI

struct IssueListView: View {
    let fullName: String
    let title: String
    let number: Int
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(fullName)
                    .font(.caption1Medium)
                    .foregroundStyle(.gray800)
                Text(title)
                    .font(.body3Bold)
                    .foregroundStyle(.blue500)
            }
            Spacer()
            
            Text("#\(number)")
                .font(.caption1Medium)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    IssueListView(fullName: "sldkjf", title: "sldhflshdlfhlksjf", number: 1233)
}
