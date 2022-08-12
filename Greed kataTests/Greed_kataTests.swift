//
//  Greed_kataTests.swift
//  Greed kataTests
//
//  Created by Игорь Гранкин on 12.08.2022.
//

import XCTest
@testable import Greed_kata

class Greed_kataTests: XCTestCase {
    
    var sut: Calculator!

    override func setUp() {
        super.setUp()
        sut = Calculator()
    }
    
    func test_ZeroMovesReturnsZeroPoints() {
        let result = sut.calculate([])
        XCTAssertEqual(result, 0)
    }
    
    func test_1Returns1Point() {
        let result = sut.calculate([1])
        XCTAssertEqual(result, 100)
    }
    
    func test_5Returns5Point() {
        let result = sut.calculate([5])
        XCTAssertEqual(result, 50)
    }
    
    func test_Not1And5NumbersReturnsZeroPoints() {
        let result = sut.calculate([2,3,4,2,3])
        XCTAssertEqual(result, 0)
    }
    
    func test_1And5Returns150Points() {
        let result = sut.calculate([1,5])
        XCTAssertEqual(result, 150)
    }
    
    func test_Triple1Returns1000Points() {
        let result = sut.calculate([1,1,1])
        XCTAssertEqual(result, 1000)
    }
    
    func test_Triple2Returns200Points() {
        let result = sut.calculate([2,2,2])
        XCTAssertEqual(result, 200)
    }
}
