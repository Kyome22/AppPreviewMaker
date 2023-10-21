/*
 PageView.swift
 AppPreviewMaker

 Created by Takuto Nakamura on 2023/10/20.
 
*/

import SwiftUI

struct PageView: View {
    let device: Device
    let title: String
    let imageResource: ImageResource

    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.black)
            GeometryReader { proxy in
                ZStack {
                    Image(imageResource)
                        .clipShape(RoundedRectangle(cornerRadius: device.radius))
                    device.image
                }
                .scaleEffect(device.scale)
                .frame(width: proxy.size.width, height: proxy.size.height)
                .clipped()
            }
        }
        .padding(device.padding)
        .ignoresSafeArea(.all, edges: [.bottom, .horizontal])
    }
}

#Preview {
    PageView(device: .iPhone14ProMax, title: "Title", imageResource: .iPhone14ProMax)
}
