//
//  StringExtension.swift
//  CalculatorRPN
//
//  Created by JackTheCode on 4/16/18.
//  Copyright © 2018 phat nguyen. All rights reserved.
//

import Foundation

extension String {
	mutating func removingRegexMatches(pattern: String, replaceWith: String = "") {
		do {
			let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
			let range = NSMakeRange(0, self.count)
			self = regex.stringByReplacingMatches(in: self, options: [], range: range, withTemplate: replaceWith)
		} catch {
			return
		}
	}
	struct NumFormatter {
		static let instance = NumberFormatter()
	}
	
	var doubleValue: Double? {
		return NumFormatter.instance.number(from: self)?.doubleValue
	}
	
	var integerValue: Int? {
		return NumFormatter.instance.number(from: self)?.intValue
	}
}
