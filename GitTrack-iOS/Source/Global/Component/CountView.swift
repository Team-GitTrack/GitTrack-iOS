//
//  CountView.swift
//  GitTrack-iOS
//
//  Created by 김주영 on 4/9/24.
//

import SwiftUI

struct CountView: View {
    let icon: UIImage
    let count: String
    let color: Color
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            Image(uiImage: icon)
                .resizable()
                .frame(width: 15, height: 15)
                .foregroundColor(color)
            
            Text(count)
                .font(.caption1Regular)
                .foregroundColor(color)
        }
    }
}

#Preview {
    CountView(icon: UIImage.peopleIcon, count: "sldfjel", color: .gray400)
}
