//
//  StackToken.swift
//  rtCPMS
//
//  Created by JackTheCode on 2/7/18.
//  Copyright © 2018 RTA. All rights reserved.
//

import Foundation
/*
Last-in first-out stack (LIFO)
Push and pop are O(1) operations.
*/
public struct StackToken<T> {
	fileprivate var array = [T]()
	
	public var isEmpty: Bool {
		return array.isEmpty
	}
	
	public var count: Int {
		return array.count
	}
	
	public mutating func push(_ element: T) {
		array.append(element)
	}
	
	public mutating func pop() -> T? {
		return array.popLast()
	}
	
	public var top: T? {
		return array.last
	}
}

extension StackToken: Sequence {
	public func makeIterator() -> AnyIterator<T> {
		var curr = self
		return AnyIterator {
			return curr.pop()
		}
	}
}
