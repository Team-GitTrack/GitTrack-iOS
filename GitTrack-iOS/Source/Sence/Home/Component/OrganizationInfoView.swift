//
//  OrganizationInfoView.swift
//  GitTrack-iOS
//
//  Created by 김주영 on 4/5/24.
//

import SwiftUI

struct OrganizationInfoView: View {
    let url: String
    let organizationName: String
    let discription: String
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            ImageView(imageUrl: url)
            .frame(width: 100, height: 100)
            .cornerRadius(100)
            .padding(.bottom, 5)
            
            OrganzationInfoTitle(
                organizationName: organizationName,
                description: discription
            )
            .padding(.bottom, 10)

            Button(action: {
                print("sldjfhl")
            }, label: {
                Text("더보기")
                    .font(.caption1Medium)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 60)
                    .padding(.vertical, 16)
            })
            .frame(width: 160, height: 49)
            .background(.blue500)
            .cornerRadius(16)
        }
        .padding(16)
        .background(.white)
        .frame(width: 192, alignment: .center)
        .cornerRadius(32)
    }
}

#Preview {
    OrganizationInfoView(url: "https://www.tygerauto.com/mm5/graphics/photos/test-sku.jpg",
                         organizationName: "XQAURE", discription: "대덕소프트웨어마이스터고등학교")
}
