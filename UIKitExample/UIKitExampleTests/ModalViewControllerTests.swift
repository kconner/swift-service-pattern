//
//  ModalViewControllerTests.swift
//  UIKitExampleTests
//
//  Created by Kevin Conner on 2022-11-21.
//

import XCTest
@testable import UIKitExample
@testable import UIKitExampleServices

@MainActor
final class ModalViewControllerTests: XCTestCase {
    
    private class FakeModalDelegate : ModalDelegate {
        let countString: String
        
        init(countString: String = "unused") {
            self.countString = countString
        }
        
        func modalCountString(_ modal: ModalViewController) -> String {
            countString
        }
        
        private(set) var modalDidStuffCount = 0
        
        func modalDidStuff(_ modal: ModalViewController) {
            modalDidStuffCount += 1
        }
    }

    private func makeSubject(
        environment: FakeEnvironment,
        text: String,
        delegate: (any ModalDelegate)?
    ) throws -> ModalViewController {
        let subject = UIStoryboard(name: "Modal", bundle: nil).instantiateInitialViewController { coder in
            ModalViewController(environment: environment, text: text, coder: coder)
        }
        
        guard let subject else {
            throw TestError(message: "View controller not instantiated")
        }
        
        subject.delegate = delegate
        
        subject.loadViewIfNeeded()
        return subject
    }
    
    func testViewSetup() throws {
        let subject = try makeSubject(
            environment: FakeEnvironment(stuff: FakeStuffService()),
            text: "okay",
            delegate: FakeModalDelegate(countString: "one two three")
        )
        
        XCTAssertEqual(subject.label.text, "okay, one two three")
    }
    
    func testDidTapButton() throws {
        let stuffService = FakeStuffService()
        let delegate = FakeModalDelegate()
        
        let subject = try makeSubject(
            environment: FakeEnvironment(stuff: stuffService),
            text: "unused",
            delegate: delegate
        )
        
        subject.didTapButton(self)
        
        XCTAssertEqual(stuffService.doStuffCount, 1)
        XCTAssertEqual(delegate.modalDidStuffCount, 1)
    }
    
}
