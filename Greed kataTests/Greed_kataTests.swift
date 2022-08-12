//
//  Greed_kataTests.swift
//  Greed kataTests
//
//  Created by Игорь Гранкин on 12.08.2022.
//

import XCTest
@testable import Greed_kata

class Greed_kataTests: XCTestCase {

    func test_ZeroMovesReturnsZeroPoints() {
        let result = Calculator.calculate([])
        XCTAssertEqual(result, 0)
    }

}
