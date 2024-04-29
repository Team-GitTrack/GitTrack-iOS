//
//  RepositoryInfoView.swift
//  GitTrack-iOS
//
//  Created by 김주영 on 4/25/24.
//

import SwiftUI

struct RepositoryInfoView: View {
    let name: String
    let description: String
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(name)")
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
