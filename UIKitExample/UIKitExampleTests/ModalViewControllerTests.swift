//
//  ModalViewControllerTests.swift
//  UIKitExampleTests
//
//  Created by Kevin Conner on 2022-11-21.
//

import XCTest
@testable import UIKitExample
@testable import UIKitExampleServices

private struct FakeStuff : StuffService {
    let didStuff: () -> Void
    
    func doStuff() {
        didStuff()
    }
}

private struct FakeModalServices : ModalServices {
    let stuff: StuffService
    
    init(didStuff: @escaping () -> Void) {
        self.stuff = FakeStuff(didStuff: didStuff)
    }
}

final class ModalViewControllerTests: XCTestCase {
    
    func makeSubject(services: ModalServices, text: String) -> ModalViewController! {
        let subject = UIStoryboard(name: "Modal", bundle: nil).instantiateInitialViewController { coder in
            ModalViewController(services: services, text: text, coder: coder)
        }
        
        guard let subject else {
            XCTFail("Expected view controller")
            return nil
        }
        
        subject.loadViewIfNeeded()
        
        return subject
    }
    
    func testViewSetup() throws {
        let services = FakeModalServices(didStuff: {})
        let labelText = "okay"
        
        let subject = makeSubject(services: services, text: labelText)!
        
        XCTAssertEqual(subject.label.text, labelText)
    }
    
    func testDidTapButton() throws {
        var didCallDoStuff = false
        
        let services = FakeModalServices(
            didStuff: {
                didCallDoStuff = true
            }
        )
        
        let subject = makeSubject(services: services, text: "ignored")!
        
        subject.didTapButton(self)
        
        XCTAssertTrue(didCallDoStuff)
    }

}
