//
//  ContentView.swift
//  AppPreviewMaker
//
//  Created by Takuto Nakamura on 2023/10/20.
//

import SwiftUI

struct ContentView: View {
    @State var device: Device = .iPhone15ProMax
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
                Text("device")
            }
            .accessibilityIdentifier("devicePicker")
            Button {
                showPagingView = true
            } label: {
                Label("go", systemImage: "arrow.forward")
            }
            .accessibilityIdentifier("showPagingViewButton")
            .fullScreenCover(isPresented: $showPagingView) {
                PagingView(device: device, totalPageNumber: 4)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
