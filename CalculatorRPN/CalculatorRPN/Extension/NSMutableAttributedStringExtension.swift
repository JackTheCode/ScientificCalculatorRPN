//
//  NSMutableAttributedStringExtension.swift
//  CalculatorRPN
//
//  Created by JackTheCode on 2/17/18.
//  Copyright © 2018 phat nguyen. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

extension NSMutableAttributedString{
	enum scripting : Int
	{
		case aSub = -1
		case aSuper = 1
	}
	
	func characterSubscriptAndSuperscript(string:String,
										  characters:[Character],
										  type:scripting,
										  fontSize:CGFloat,
										  scriptFontSize:CGFloat,
										  offSet:Int,
										  length:[Int],
										  alignment:NSTextAlignment)-> NSMutableAttributedString
	{
		let paraghraphStyle = NSMutableParagraphStyle()
		paraghraphStyle.alignment = alignment
		
		var scriptedCharaterLocation = Int()
		let stringFont = UIFont.boldSystemFont(ofSize: fontSize)
		let scriptFont = UIFont.boldSystemFont(ofSize: scriptFontSize)
		let attString = NSMutableAttributedString(string:string, attributes: [NSFontAttributeName:stringFont,NSForegroundColorAttributeName:UIColor.white,NSParagraphStyleAttributeName: paraghraphStyle])
		
		let baseLineOffset = offSet * type.rawValue
		for (i,c) in string.characters.enumerated()
		{
			for (theLength,aCharacter) in characters.enumerated()
			{
				if c == aCharacter
				{
					scriptedCharaterLocation = i
					attString.setAttributes([NSFontAttributeName:scriptFont,
											 NSBaselineOffsetAttributeName:baseLineOffset,
											 NSForegroundColorAttributeName:UIColor.white],
											range:NSRange(location:scriptedCharaterLocation,
														  length:length[theLength]))
				}
			}
		}
		return attString
	}

}
