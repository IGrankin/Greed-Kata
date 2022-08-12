//
//  Calculator.swift
//  Greed kata
//
//  Created by Игорь Гранкин on 12.08.2022.
//

import Foundation

class Calculator {
    
    struct Output {
        var sum: Int
        var set: NSCountedSet
    }
    
    func calculate(_ moves: [Int]) -> Int {
        guard !moves.isEmpty else {
            return 0
        }
        
        var sum = 0
        let countedSet = NSCountedSet(array: moves)
        
        //triple counting
        let tripleOutput = sumForTriples(countedSet)
        sum += tripleOutput.sum
        
        //single counting
        let singleOutput = sumForSingles(
            tripleOutput.set,
            pointValues: getPointValues()
        )
        sum += singleOutput.sum
        
        return sum
    }
    
    // MARK: - Triples
    
    fileprivate func sumForTriples(_ originSet: NSCountedSet) -> Output {
        var sum = 0
        let outputSet: NSCountedSet = originSet.copy() as! NSCountedSet
        
        for element in originSet {
            if originSet.count(for: element) >= 3 {
                sum += getTriplePoints(for: element as! Int)
                outputSet.removeElement(element: element as! Int, times: 3)
            }
        }
        
        return Output(sum: sum, set: outputSet)
    }
    
    fileprivate func getTriplePoints(for tripleValue: Int) -> Int {
        switch tripleValue {
        case 1:
            return 1000
        case 2...6:
            return tripleValue * 100
        default:
            return 0
        }
    }
    
    // MARK: - Singles
    
    fileprivate func sumForSingles(_ originSet: NSCountedSet, pointValues: [Int]) -> Output {
        var sum = 0
        var outputSet: NSCountedSet = originSet.copy() as! NSCountedSet
        
        for element in pointValues {
            let output = sumForPointValues(outputSet, pointValue: element)
            sum += output.sum
            outputSet = output.set
            }

        return Output(sum: sum, set: outputSet)
    }
    
    fileprivate func sumForPointValues(_ originSet: NSCountedSet, pointValue: Int) -> Output {
        var sum = 0
        let outputSet: NSCountedSet = originSet.copy() as! NSCountedSet
        
        for _ in 0..<originSet.count(for: pointValue) {
            sum += getPoints(for: pointValue)
            outputSet.remove(pointValue)
        }
        
        return Output(sum: sum, set: outputSet)
    }
    
    fileprivate func getPointValues() -> [Int] {
        [1, 5]
    }
    
    fileprivate func getPoints(for value: Int) -> Int {
        switch value {
        case 1:
            return 100
        case 5:
            return 50
        default:
            return 0
        }
    }
}

// MARK: - helpers

extension NSCountedSet {
    public func removeElement(element: Int, times: Int) {
        for _ in 0..<times {
            self.remove(element)
        }
    }
}

