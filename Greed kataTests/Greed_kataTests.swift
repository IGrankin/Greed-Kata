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
    
    // MARK: - triples
    func test_Triple1Returns1000Points() {
        let result = sut.calculate([1,1,1])
        XCTAssertEqual(result, 1000)
    }
    
    func test_Triple2Returns200Points() {
        let result = sut.calculate([2,2,2])
        XCTAssertEqual(result, 200)
    }
    
    func test_Triple3Returns300Points() {
        let result = sut.calculate([3,3,3])
        XCTAssertEqual(result, 300)
    }
    
    func test_Triple4Returns400Points() {
        let result = sut.calculate([4,4,4])
        XCTAssertEqual(result, 400)
    }
    
    func test_Triple5Returns500Points() {
        let result = sut.calculate([5,5,5])
        XCTAssertEqual(result, 500)
    }
    
    func test_Triple6Returns600Points() {
        let result = sut.calculate([6,6,6])
        XCTAssertEqual(result, 600)
    }
    
    func test_Triple7ReturnsZeroPoints() {
        let result = sut.calculate([7,7,7])
        XCTAssertEqual(result, 0)
    }
    
    func test_TripleZerosReturnsZeroPoints() {
        let result = sut.calculate([0,0,0])
        XCTAssertEqual(result, 0)
    }
}
