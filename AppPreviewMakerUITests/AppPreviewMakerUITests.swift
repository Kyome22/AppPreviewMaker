//
//  AppPreviewMakerUITests.swift
//  AppPreviewMakerUITests
//
//  Created by Takuto Nakamura on 2023/10/21.
//

import XCTest

final class AppPreviewMakerUITests: XCTestCase {
    let titles: [String] = [
        "Top",
        "FullScreen",
        "Bookmark",
        "SearchEngine",
        "Share"
    ]

    private func captureScreenshot(device: Device) {
        XCUIDevice.shared.orientation = device.orientation

        let app = XCUIApplication()
        app.launch()

        app.buttons["devicePicker"].tap()
        app.buttons[device.rawValue].tap()
        app.buttons["showPagingViewButton"].tap()

        let exp = expectation(description: "Wait until the home bar disappears.")
        _ = XCTWaiter.wait(for: [exp], timeout: 4.0)

        titles.forEach { title in
            Language.allCases.forEach { language in
                app.swipeLeft()

                let screenshot = app.windows.firstMatch.screenshot()
                let attachment = XCTAttachment(screenshot: screenshot)
                attachment.lifetime = .keepAlways
                attachment.name = "\(language.rawValue)_\(device.rawValue)_\(title)"
                add(attachment)
            }
        }

        app.swipeLeft()
        app.buttons["backButton2"].tap()
        app.terminate()
    }

    func test_iPhone14ProMax() {
        captureScreenshot(device: .iPhone14ProMax)
    }

    func test_iPhone8Plus() {
        captureScreenshot(device: .iPhone8Plus)
    }

    func test_iPadPro6th() {
        captureScreenshot(device: .iPadPro6th)
    }

    func test_iPadPro2nd() {
        captureScreenshot(device: .iPadPro2nd)
    }
}

enum Device: String {
    case iPhone14ProMax
    case iPhone8Plus
    case iPadPro6th
    case iPadPro2nd

    var orientation: UIDeviceOrientation {
        switch self {
        case .iPhone14ProMax: return .portrait
        case .iPhone8Plus:    return .portrait
        case .iPadPro6th:     return .landscapeLeft
        case .iPadPro2nd:     return .landscapeLeft
        }
    }
}

enum Language: String, CaseIterable {
    case en
    case ja
}
