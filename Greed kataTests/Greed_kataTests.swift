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
        sut = Calculator(rules: [TripleRule(), SingleRule()])
    }
    
    func test_zeroMovesReturnsZeroPoints() {
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
    
    func test_not1And5NumbersReturnsZeroPoints() {
        let result = sut.calculate([2,3,4,2,3])
        XCTAssertEqual(result, 0)
    }
    
    func test_1And5Returns150Points() {
        let result = sut.calculate([1,5])
        XCTAssertEqual(result, 150)
    }
    
    // MARK: - triples
    
    func test_triple1Returns1000Points() {
        let result = sut.calculate([1,1,1])
        XCTAssertEqual(result, 1000)
    }
    
    func test_triple2Returns200Points() {
        let result = sut.calculate([2,2,2])
        XCTAssertEqual(result, 200)
    }
    
    func test_triple3Returns300Points() {
        let result = sut.calculate([3,3,3])
        XCTAssertEqual(result, 300)
    }
    
    func test_triple4Returns400Points() {
        let result = sut.calculate([4,4,4])
        XCTAssertEqual(result, 400)
    }
    
    func test_triple5Returns500Points() {
        let result = sut.calculate([5,5,5])
        XCTAssertEqual(result, 500)
    }
    
    func test_triple6Returns600Points() {
        let result = sut.calculate([6,6,6])
        XCTAssertEqual(result, 600)
    }
    
    func test_triple7ReturnsZeroPoints() {
        let result = sut.calculate([7,7,7])
        XCTAssertEqual(result, 0)
    }
    
    func test_tripleZerosReturnsZeroPoints() {
        let result = sut.calculate([0,0,0])
        XCTAssertEqual(result, 0)
    }
    
    // MARK: - sum checks
    
    func test_triple1And1And5Returns1150Points() {
        let result = sut.calculate([1,1,1,1,5])
        XCTAssertEqual(result, 1150)
    }
    
    func test_all1Returns1200points() {
        let result = sut.calculate([1,1,1,1,1])
        XCTAssertEqual(result, 1200)
    }
    
    func test_double1AndDouble5Returns300Points() {
        let result = sut.calculate([1,1,5,5,9])
        XCTAssertEqual(result, 300)
    }
    
    // MARK: - Examples
    
    func test_nonPointValuesReturnZeroPoints() {
        let result = sut.calculate([2,3,4,6,2])
        XCTAssertEqual(result, 0)
    }
    
    func test_tripleAnd5Returns450Points() {
        let result = sut.calculate([3,4,5,3,3])
        XCTAssertEqual(result, 350)
    }
    
    func test_test() {
        let result = sut.calculate([1,1,1,2,2])
        XCTAssertEqual(result, 1000)
    }
}
