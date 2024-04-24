//
//  CountView.swift
//  GitTrack-iOS
//
//  Created by 김주영 on 4/9/24.
//

import SwiftUI

struct IsPrivateView: View {
    let isPrivate: Bool
    var body: some View {
        HStack(alignment: .center, spacing: 2) {
            Image(.star)
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundColor(.blue400)
            if isPrivate {
                Text("Private")
                    .font(.caption2SemiBold)
                    .foregroundColor(.blue400)
            } else {
                Text("Public")
                    .font(.caption2SemiBold)
                    .foregroundColor(.blue400)
            }
        }
    }
}

#Preview {
    IsPrivateView(isPrivate: false)
}
