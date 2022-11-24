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

@MainActor
final class ModalViewControllerTests: XCTestCase {
    
    func makeSubject(environment: Environment, text: String) -> ModalViewController! {
        let subject = UIStoryboard(name: "Modal", bundle: nil).instantiateInitialViewController { coder in
            ModalViewController(environment: environment, text: text, coder: coder)
        }
        
        guard let subject else {
            XCTFail("Expected view controller")
            return nil
        }
        
        subject.loadViewIfNeeded()
        
        return subject
    }
    
    func testViewSetup() throws {
        var environment = Environment()
        environment.add(LeftSession.self, item: LeftSession())
        environment.add(StuffService.self, item: FakeStuff {})
        
        let labelText = "okay"
        
        let subject = makeSubject(environment: environment, text: labelText)!
        
        XCTAssertEqual(subject.label.text, "\(labelText), 0, 0")
    }
    
    func testDidTapButton() throws {
        var didCallDoStuff = false
        
        var environment = Environment()
        environment.add(LeftSession.self, item: LeftSession())
        environment.add(StuffService.self, item: FakeStuff {
            didCallDoStuff = true
        })
        
        let subject = makeSubject(environment: environment, text: "ignored")!
        
        subject.didTapButton(self)
        
        XCTAssertTrue(didCallDoStuff)
    }

}
