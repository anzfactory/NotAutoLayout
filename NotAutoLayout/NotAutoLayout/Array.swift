//
//  Array.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/03/19.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

// FIXME: Seems like a compiler's bug that it shows an error while using `min(index, self.endIndex)` so I made this bypass function.
private func minimum(_ x: Int, _ y: Int) -> Int {
	return x < y ? x : y
}

extension Array {
	
	func last(before index: Index, where condition: (Element) throws -> Bool) rethrows -> Element? {
		
		let index = minimum(index, self.endIndex)
		
		for item in self[self.startIndex ..< index].reversed() {
			
			if try condition(item) == true {
				return item
			}
			
		}
		
		return nil
		
	}
	
}

extension Array {
	
	func forEachPair(_ body: (_ previous: Element?, _ current: Element) throws -> Void) rethrows {
		
		var iterator = self.makeIterator()
		var previous: Element? = nil
		
		func postProcess(previous: inout Element?, current: Element) {
			
			previous = current
			
		}
		
		while let next = iterator.next() {
			
			try body(previous, next)
			
			postProcess(previous: &previous, current: next)
			
		}
		
	}
	
}

extension Array {
	
	func forEachCell(underColsPerRow colsPerRow: Int, _ body: (_ previousRow: Element?, _ previousCol: Element?, _ current: Element) throws -> Void) rethrows {
		
		var iterator = self.makeIterator()
		var previousRowIterator: Iterator = self.makeIterator()
		
		var currentIndex = 0
		var previousRow: Element? = nil
		var previousCol: Element? = nil
		
		func postProcess(previousRow: inout Element?, previousCol: inout Element?, current: Element) {
			
			currentIndex += 1
			
			if currentIndex % colsPerRow == 0 {
				previousCol = nil
				
			} else {
				previousCol = current
			}
			
			if currentIndex >= colsPerRow {
				previousRow = previousRowIterator.next()
			}
			
		}
		
		while let next = iterator.next() {
			
			try body(previousRow, previousCol, next)
			
			postProcess(previousRow: &previousRow, previousCol: &previousCol, current: next)
			
		}
		
	}
	
}