//
//  ModalViewControllerTests.swift
//  UIKitExampleTests
//
//  Created by Kevin Conner on 2022-11-21.
//

import XCTest
@testable import UIKitExample
import UIKitExampleServices

@MainActor
final class ModalViewControllerTests: XCTestCase {
    
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

    private func makeSubject(
        parent: TestEnvironmentView,
        text: String,
        delegate: ModalDelegate?
    ) throws -> ModalViewController {
        let subject = UIStoryboard(name: "Modal", bundle: nil).instantiateInitialViewController { coder in
            ModalViewController(text: text, coder: coder)
        }
        
        guard let subject else {
            throw TestError(message: "View controller not instantiated")
        }
        
        subject.delegate = delegate
        parent.addSubview(subject.view)
        return subject
    }
    
    func testViewSetup() throws {
        let parent = Environment()
            .adding(StuffService.self, item: FakeStuffService())
            .view()
        
        let subject = try makeSubject(
            parent: parent,
            text: "okay",
            delegate: FakeModalDelegate(modalSessionDescription: "one two three")
        )
        
        XCTAssertEqual(subject.label.text, "okay, one two three")
    }
    
    func testDidTapButton() throws {
        let stuffService = FakeStuffService()
        let parent = Environment()
            .adding(StuffService.self, item: stuffService)
            .view()
        let delegate = FakeModalDelegate(modalSessionDescription: "ignored")
        
        let subject = try makeSubject(
            parent: parent,
            text: "ignored",
            delegate: delegate
        )
        
        subject.didTapButton(self)
        
        XCTAssertEqual(stuffService.doStuffCount, 1)
        XCTAssertEqual(delegate.modalDidStuffCount, 1)
    }
    
}
