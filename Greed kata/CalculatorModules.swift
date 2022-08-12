//
//  CalculatorModules.swift
//  Greed kata
//
//  Created by Игорь Гранкин on 12.08.2022.
//

import Foundation

protocol CalculatorRule: AnyObject {
    func sum(with set: NSCountedSet) -> Output
    func getPoints(for value: Int) -> Int
    var priority: CalculatorPriority { get }
}

enum CalculatorPriority: Int {
    case partly
    case single
}

// MARK: - Triple

public class TripleRule: CalculatorRule {
    var priority: CalculatorPriority = .partly
    
    func sum(with originSet: NSCountedSet) -> Output {
        var sum = 0
        let outputSet: NSCountedSet = originSet.copy() as! NSCountedSet
        
        for element in originSet {
            if originSet.count(for: element) >= 3 {
                sum += getPoints(for: element as! Int)
                outputSet.removeElement(element: element as! Int, times: 3)
            }
        }
        
        return Output(sum: sum, set: outputSet)
    }
    
    func getPoints(for value: Int) -> Int {
        switch value {
        case 1:
            return 1000
        case 2...6:
            return value * 100
        default:
            return 0
        }
    }
}

// MARK: - Single

public class SingleRule: CalculatorRule {
    var priority: CalculatorPriority = .single
    
    func sum(with originSet: NSCountedSet) -> Output {
        var sum = 0
        var outputSet: NSCountedSet = originSet.copy() as! NSCountedSet
        
        for element in getPointValues() {
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
    
    func getPoints(for value: Int) -> Int {
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

