//
//  OrganizationMemberListView.swift
//  GitTrack-iOS
//
//  Created by 김주영 on 4/24/24.
//

import SwiftUI

struct OrganizationMemberListView: View {
    @ObservedObject var viewModel = OrganizationViewModel()
    let organization: String
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Members")
                .font(.body2SemiBold)
                .foregroundStyle(.blue800)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(viewModel.members, id: \.self) {
                        OrganizationMemberView(imageUrl: $0.avatarURL, login: $0.login)
                    }
                }
            }
            
        }.onAppear {
            viewModel.getOrganizationMembers(organization: organization)
        }
    }
}

#Preview {
    OrganizationMemberListView(organization: "EntryDSM")
}
