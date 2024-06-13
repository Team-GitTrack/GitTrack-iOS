//
//  RepositoryLanguageView.swift
//  GitTrack-iOS
//
//  Created by 김주영 on 6/12/24.
//

import SwiftUI

struct RepositoryLanguageView: View {
    var body: some View {
        VStack {
            Text("Repository")
                .font(.body2SemiBold)
                .foregroundStyle(.blue800)
            Chart(viewModel.languages, id: \.name) { element in
                BarMark(
                    x: .value("languages size", element.count)
                )
                .foregroundStyle(by: .value("languages category", element.name))
                .opacity(0.8)
            }
            .chartXAxis(.hidden)
            .frame(height: 50)
        }
        .on
    }
}

#Preview {
    RepositoryLanguageView()
}
