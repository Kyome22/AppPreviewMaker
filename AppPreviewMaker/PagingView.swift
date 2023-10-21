/*
 PagingView.swift
 AppPreviewMaker

 Created by Takuto Nakamura on 2023/10/20.
 
*/

import SwiftUI

struct PagingView: View {
    @Environment(\.dismiss) var dismiss
    let device: Device
    let pages: [Page]

    var body: some View {
        TabView {
            Button {
                dismiss()
            } label: {
                Label("Back", systemImage: "arrow.backward")
            }
            .accessibilityIdentifier("backButton1")
            ForEach(pages) { page in
                PageView(
                    device: device,
                    title: page.enTitle,
                    imageResource: page.imageResource(device: device)
                )
                .environment(\.locale, .init(identifier: "en"))
                PageView(
                    device: device,
                    title: page.jaTitle,
                    imageResource: page.imageResource(device: device)
                )
                .environment(\.locale, .init(identifier: "ja"))
            }
            Button {
                dismiss()
            } label: {
                Label("Back", systemImage: "arrow.backward")
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
    PagingView(device: .iPhone14ProMax, pages: [])
}
