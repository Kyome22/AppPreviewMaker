/*
 PagingView.swift
 AppPreviewMaker

 Created by Takuto Nakamura on 2023/10/20.
 
*/

import SwiftUI

struct PagingView: View {
    @Environment(\.dismiss) var dismiss
    let device: Device
    let totalPageNumber: Int

    var body: some View {
        TabView {
            Button {
                dismiss()
            } label: {
                Label("back", systemImage: "arrow.backward")
            }
            .accessibilityIdentifier("backButton1")
            ForEach(0 ..< totalPageNumber, id: \.self) { index in
                PageView(
                    device: device,
                    title: LocalizedStringKey(stringLiteral: "title\(index)"),
                    imageResource: ImageResource(name: "\(device.prefix)_\(index)", bundle: .main)
                )
            }
            Button {
                dismiss()
            } label: {
                Label("back", systemImage: "arrow.backward")
            }
            .accessibilityIdentifier("backButton2")
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .ignoresSafeArea(.all)
        .background(Color.background)
        .statusBarHidden()
        .persistentSystemOverlays(.hidden)
    }
}

#Preview {
    PagingView(device: .iPhone15ProMax, totalPageNumber: 1)
}
