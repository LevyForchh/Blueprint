import XCTest
import BlueprintUI
@testable import BlueprintUICommonControls


class TextFieldTests: XCTestCase {

    func test_snapshots() {

        do {
            let field = TextField(text: "Hello, world")
            compareSnapshot(
                of: field,
                size: CGSize(width: 200, height: 44),
                identifier: "text_simple")
        }

        do {
            var field = TextField(text: "")
            field.placeholder = "Type something..."
            compareSnapshot(
                of: field,
                size: CGSize(width: 200, height: 44),
                identifier: "placeholder")
        }

        do {
            var field = TextField(text: "Disabled")
            field.isEnabled = false
            compareSnapshot(
                of: field,
                size: CGSize(width: 200, height: 44),
                identifier: "text_disabled")
        }

    }

}

