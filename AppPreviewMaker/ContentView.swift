//
//  ContentView.swift
//  AppPreviewMaker
//
//  Created by Takuto Nakamura on 2023/10/20.
//

import SwiftUI

struct ContentView: View {
    @State var device: Device = .iPhone14ProMax
    @State var showPagingView: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Picker(selection: $device) {
                ForEach(Device.allCases) { device in
                    Label {
                        Text(device.title)
                    } icon: {
                        device.icon
                    }
                    .accessibilityIdentifier(device.prefix)
                    .tag(device)
                }
            } label: {
                Text("Device")
            }
            .accessibilityIdentifier("devicePicker")
            Button {
                showPagingView = true
            } label: {
                Label("Go", systemImage: "arrow.forward")
            }
            .accessibilityIdentifier("showPagingViewButton")
            .fullScreenCover(isPresented: $showPagingView) {
                PagingView(device: device, pages: [
                    Page(enTitle: "The Simplest Web Browser",
                         jaTitle: "最もシンプルなWebブラウザ",
                         imageKey: "Top"),
                    Page(enTitle: "Full Screen",
                         jaTitle: "フルスクリーン",
                         imageKey: "FullScreen"),
                    Page(enTitle: "Bookmark",
                         jaTitle: "ブックマーク",
                         imageKey: "Bookmark"),
                    Page(enTitle: "Select Search Engine",
                         jaTitle: "検索エンジンを選択",
                         imageKey: "SearchEngine"),
                    Page(enTitle: "Open Link in Telescopure",
                         jaTitle: "Telescopureでリンクを開く",
                         imageKey: "Share")
                ])
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
