/*
 Page.swift
 AppPreviewMaker

 Created by Takuto Nakamura on 2023/10/20.
 
*/

import Foundation

struct Page: Identifiable {
    var id = UUID()
    var enTitle: String
    var jaTitle: String
    var imageKey: String

    func imageResource(device: Device) -> ImageResource {
        return ImageResource(name: "\(device.prefix)_\(imageKey)", bundle: .main)
    }
}
