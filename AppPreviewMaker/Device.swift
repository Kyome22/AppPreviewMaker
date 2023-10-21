/*
 Device.swift
 AppPreviewMaker

 Created by Takuto Nakamura on 2023/10/20.
 
*/

import SwiftUI

enum Device: Int, Identifiable, CaseIterable {
    case iPhone14ProMax
    case iPhone8Plus
    case iPadPro6th
    case iPadPro2nd

    var id: Int { rawValue }

    var title: String {
        switch self {
        case .iPhone14ProMax: return "iPhone 14 Pro Max"
        case .iPhone8Plus:    return "iPhone 8 Plus"
        case .iPadPro6th:     return "iPad Pro 6th"
        case .iPadPro2nd:     return "iPad Pro 2nd"
        }
    }

    var icon: Image {
        switch self {
        case .iPhone14ProMax: return Image(systemName: "iphone.gen2")
        case .iPhone8Plus:    return Image(systemName: "iphone.gen1")
        case .iPadPro6th:     return Image(systemName: "ipad.gen2")
        case .iPadPro2nd:     return Image(systemName: "ipad.gen1")
        }
    }

    var image: Image {
        switch self {
        case .iPhone14ProMax: return Image(.iPhone14ProMax)
        case .iPhone8Plus:    return Image(.iPhone8Plus)
        case .iPadPro6th:     return Image(.iPadPro6Th)
        case .iPadPro2nd:     return Image(.iPadPro2Nd)
        }
    }

    var prefix: String {
        switch self {
        case .iPhone14ProMax: return "iPhone14ProMax"
        case .iPhone8Plus:    return "iPhone8Plus"
        case .iPadPro6th:     return "iPadPro6th"
        case .iPadPro2nd:     return "iPadPro2nd"
        }
    }

    var size: CGSize {
        switch self {
        case .iPhone14ProMax: return CGSize(width: 1452, height: 2940)
        case .iPhone8Plus:    return CGSize(width: 1512, height: 2928)
        case .iPadPro6th:     return CGSize(width: 2972, height: 2288)
        case .iPadPro2nd:     return CGSize(width: 3272, height: 2348)
        }
    }

    var offset: CGPoint {
        switch self {
        case .iPhone14ProMax: return CGPoint(x: 81, y: 72)
        case .iPhone8Plus:    return CGPoint(x: 135, y: 360)
        case .iPadPro6th:     return CGPoint(x: 120, y: 120)
        case .iPadPro2nd:     return CGPoint(x: 150, y: 270)
        }
    }

    var radius: CGFloat {
        return self == .iPhone14ProMax ? 80 : 0
    }

    var scale: CGFloat {
        switch self {
        case .iPhone14ProMax: return 0.25
        case .iPhone8Plus:    return 0.2
        case .iPadPro6th:     return 0.4
        case .iPadPro2nd:     return 0.4
        }
    }

    var padding: CGFloat {
        switch self {
        case .iPhone14ProMax: return 16
        case .iPhone8Plus:    return 16
        case .iPadPro6th:     return 32
        case .iPadPro2nd:     return 32
        }
    }
}
