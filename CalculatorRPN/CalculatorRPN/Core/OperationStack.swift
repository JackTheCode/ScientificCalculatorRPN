//
//  OperationStack.swift
//  rtCPMS
//
//  Created by phat nguyen on 12/20/17.
//  Copyright © 2017 RTA. All rights reserved.
//

import Foundation

class OperationStack {
	static var sharedInstance : OperationStack = {
		let instance = OperationStack()
		return instance
	}()
	
	var items : [String] = [String]()
	
	func push(item: String) {
		items.append(item)
	}
	
	func pop() -> String {
		return items.removeLast()
	}
	
	func peek() -> String {
		return items.last!
	}
	
	func count() -> Int {
		return items.count
	}
	
	func show() {
		print(items)
	}
	
}
