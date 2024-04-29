//
//  RepositoryView.swift
//  GitTrack-iOS
//
//  Created by 김주영 on 4/25/24.
//

import SwiftUI

struct RepositoryView: View {
    let name: String
    let description: String
    var body: some View {
        VStack(spacing: 16) {
            RepositoryInfoView(name: name, description: description)
            Spacer()
        }
        .padding(16)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .setCustomNavigationBarTitle("\(name)")
        .background(Color(.blue50).ignoresSafeArea())
    }
}
