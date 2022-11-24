//
//  ModalViewControllerTests.swift
//  UIKitExampleTests
//
//  Created by Kevin Conner on 2022-11-21.
//

import XCTest
@testable import UIKitExample
@testable import UIKitExampleServices

private class FakeStuff : StuffService {
    var doStuffCount = 0
    
    func doStuff() {
        doStuffCount += 1
    }
}

private class FakeModalDelegate : ModalDelegate {
    var modalSessionDescription: String
    
    init(modalSessionDescription: String) {
        self.modalSessionDescription = modalSessionDescription
    }
    
    var modalDidStuffCount = 0
    
    func modalDidStuff() {
        modalDidStuffCount += 1
    }
}

@MainActor
final class ModalViewControllerTests: XCTestCase {
    
    func makeSubject(environment: Environment, text: String, delegate: ModalDelegate?) -> ModalViewController! {
        let subject = UIStoryboard(name: "Modal", bundle: nil).instantiateInitialViewController { coder in
            ModalViewController(text: text, coder: coder)
        }
        
        guard let subject else {
            XCTFail("Expected view controller")
            return nil
        }
        
        subject.delegate = delegate
        subject.loadViewIfNeeded()
        return subject
    }
    
    func testViewSetup() throws {
        var environment = Environment()
        environment.add(StuffService.self, item: FakeStuff())
        
        let labelText = "okay"
        
        let delegate = FakeModalDelegate(modalSessionDescription: "one two three")
        
        let subject = makeSubject(environment: environment, text: labelText, delegate: delegate)!
        
        XCTAssertEqual(subject.label.text, "okay, one two three")
    }
    
    func testDidTapButton() throws {
        let stuffService = FakeStuff()
        
        var environment = Environment()
        environment.add(StuffService.self, item: stuffService)
        
        let delegate = FakeModalDelegate(modalSessionDescription: "ignored")
        
        let subject = makeSubject(environment: environment, text: "ignored", delegate: delegate)!
        
        subject.didTapButton(self)
        
        XCTAssertEqual(stuffService.doStuffCount, 1)
        XCTAssertEqual(delegate.modalDidStuffCount, 1)
    }

}
