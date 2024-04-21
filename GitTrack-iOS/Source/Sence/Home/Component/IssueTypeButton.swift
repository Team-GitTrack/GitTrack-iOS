//
//  PRTypeButton.swift
//  GitTrack-iOS
//
//  Created by 김주영 on 4/16/24.
//

import SwiftUI

struct IssueTypeButton: View {
    let action: () -> Void
    let buttonType: IssueType
    @Binding var selecedType: IssueType
    var body: some View {
        Button(action: action) {
            Text(buttonType.name)
                .font(.caption1Medium)
                .padding(.horizontal, 16)
                .padding(.vertical, 5)
                .background(selecedType == buttonType ? .blue500 : .white)
                .tint(selecedType == buttonType ? .white : .blue500)
                .cornerRadius(16)
                .background(
                    RoundedRectangle(
                        cornerRadius: 16,
                        style: .continuous
                    )
                    .stroke(selecedType == buttonType ? .clear : .gray200 , lineWidth: 2)
                )
        }
    }
}
