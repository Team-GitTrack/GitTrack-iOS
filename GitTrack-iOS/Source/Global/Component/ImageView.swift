//
//  ImageView.swift
//  GitTrack-iOS
//
//  Created by 김주영 on 4/7/24.
//

import SwiftUI

struct ImageView: View {
    let imageUrl: String
    var body: some View {
        AsyncImage(
            url: URL(string: imageUrl),
            content: { image in
                image.resizable()
            },
            placeholder: {
                ProgressView()
            }
        )
    }
}

#Preview {
    ImageView(imageUrl: "https://images-ng.pixai.art/images/orig/48a4207e-5f8d-4daa-85e6-1111d1812c72")
}
