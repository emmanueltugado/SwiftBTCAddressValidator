//
//  SwiftBTCAddressValidatorTests.swift
//  SwiftBTCAddressValidatorTests
//
//  Created by Emmanuel Francisco Tugado on 8/9/17.
//  Copyright © 2017 Emmanuel Tugado. All rights reserved.
//

import XCTest
@testable import SwiftBTCAddressValidator

class SwiftBTCAddressValidatorTests: XCTestCase {
    
    var validator: BTCAddressValidator!
    
    override func setUp() {
        super.setUp()
        
        validator = BTCAddressValidator()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_blank_ReturnsFalse() {
        XCTAssertFalse(validator.isValid(bitcoinAddress: ""))
    }
    
    func test_validAddress_ReturnsTrue() {
        XCTAssertTrue(validator.isValid(bitcoinAddress: "1Q1pE5vPGEEMqRcVRMbtBK842Y6Pzo6nK9"))
        XCTAssertTrue(validator.isValid(bitcoinAddress: "34zq6WDhbkmGwsna2PYQyEu269DicVhKkM"))
        XCTAssertTrue(validator.isValid(bitcoinAddress: "1AGNa15ZQXAZUgFiqJ2i7Z2DPU2J6hW62i"))
    }
    
    func test_invalidAddress_ReturnsFalse() {
        XCTAssertFalse(validator.isValid(bitcoinAddress: "1AGNa15ZQXAZUgFiqJ2i7Z2DPU2J6hW62j"))
        XCTAssertFalse(validator.isValid(bitcoinAddress: "1AGNa15ZQXAZUgFiqJ2i7Z2DPU2J6hW62X"))
        XCTAssertFalse(validator.isValid(bitcoinAddress: "1ANNa15ZQXAZUgFiqJ2i7Z2DPU2J6hW62i"))
        XCTAssertFalse(validator.isValid(bitcoinAddress: "1A Na15ZQXAZUgFiqJ2i7Z2DPU2J6hW62i"))
        XCTAssertFalse(validator.isValid(bitcoinAddress: "BZbvjr"))
        XCTAssertFalse(validator.isValid(bitcoinAddress: "i55j"))
        XCTAssertFalse(validator.isValid(bitcoinAddress: "1AGNa15ZQXAZUgFiqJ2i7Z2DPU2J6hW62!"))
        XCTAssertFalse(validator.isValid(bitcoinAddress: "1AGNa15ZQXAZUgFiqJ2i7Z2DPU2J6hW62iz"))
        XCTAssertFalse(validator.isValid(bitcoinAddress: "1AGNa15ZQXAZUgFiqJ2i7Z2DPU2J6hW62izz"))
        XCTAssertFalse(validator.isValid(bitcoinAddress: "1Q1pE5vPGEEMqRcVRMbtBK842Y6Pzo6nJ9"))
        XCTAssertFalse(validator.isValid(bitcoinAddress: "1AGNa15ZQXAZUgFiqJ2i7Z2DPU2J6hW62I"))
    }

}
