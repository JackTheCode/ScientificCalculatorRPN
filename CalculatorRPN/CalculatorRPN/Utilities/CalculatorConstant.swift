//
//  CalculatorConstant.swift
//  rtCPMS
//
//  Created by phat nguyen on 12/29/17.
//  Copyright © 2017 RTA. All rights reserved.
//

import Foundation

struct CalculatorConstant {
	//MARK Math
	static let AC                    = "AC"
	static let NEGATIVE_NUMBER       = "+/-"
	static let PERCENT               = "%"
	static let DELETE                = "ic_backspace_white_18pt"
	static let SEVEN                 = "7"
	static let EIGHT                 = "8"
	static let NINE                  = "9"
	static let FOUR                  = "4"
	static let FIVE                  = "5"
	static let SIX                   = "6"
	static let THREE                 = "3"
	static let TWO                   = "2"
	static let ONE                   = "1"
	static let ZERO                  = "0"
	static let COMMA                 = ","
	static let PLUS                  = "+"
	static let MINUS                 = "-"
	static let MULTIPLY              = "×"
	static let DIVIDE                = "÷"
	static let EQUAL                 = "="
	//MARK Scientific
	static let DEG                   = "DEG"
	static let RAD					 = "RAD"
	static let TWOPOWND_RAW          = "2nd"
	static let LEFT_BRACKET          = "("
	static let RIGHT_BRACKET         = ")"
	static let SIN                   = "sin"
	static let COS                   = "cos"
	static let TAN                   = "tan"
	static let EPOWX_RAW             = "e^x"
	static let LN                    = "ln"
	static let TENPOWX_RAW           = "10^x"
	static let LOG_TEN_RAW           = "log10"
	static let FACTORIAL             = "x!"
	static let XPOWTHREE_RAW         = "x^3"
	static let XPOWTWO_RAW           = "x^2"
	static let XPOWY_RAW             = "x^y"
	static let PI                    = "π"
	static let TWO_SQUARE_ROOT_RAW   = "x^1/2"
	static let THREE_SQUARE_ROOT_RAW = "x^1/3"
	static let XY_SQUARE_ROOT_RAW    = "y^1/x"
	static let E                     = "e"
	//Mark 2ND MODE
	static let YPOWX_RAW 			 = "y^x"
	static let TWOPOWX_RAW 			 = "2^x"
	static let LOGY_RAW  			 = "logy"
	static let LOGTWO_RAW			 = "log2"
	static let SIN_INVERSE_RAW       = "sin-1"
	static let COS_INVERSE_RAW       = "cos-1"
	static let TAN_INVERSE_RAW       = "tan-1"
	//MARK Button Entities
	static let TOTAL_BUTTON_PER_PAGE = 20
	static let TITLE                 = "title"
	static let TYPE                  = "type"
	
	//MARK Beauty Format
	static let TWOPOWND : NSMutableAttributedString = {
		let twopownd = NSMutableAttributedString().characterSubscriptAndSuperscript(
			string: "2nd",
			characters:["n","d"],
			type: .aSuper,
			fontSize: 17,
			scriptFontSize: 12,
			offSet: 10,
			length: [1,1],
			alignment: .center)
		return twopownd
	}()
	static let EPOWX : NSMutableAttributedString = {
		let ex = NSMutableAttributedString().characterSubscriptAndSuperscript(
			string: "ex",
			characters:["x"],
			type: .aSuper,
			fontSize: 17,
			scriptFontSize: 12,
			offSet: 10,
			length: [1],
			alignment: .center)
		return ex
	}()
	static let TENPOWX : NSMutableAttributedString = {
		let tenx = NSMutableAttributedString().characterSubscriptAndSuperscript(
			string: "10x",
			characters:["x"],
			type: .aSuper,
			fontSize: 17,
			scriptFontSize: 12,
			offSet: 10,
			length: [1],
			alignment: .center)
		return tenx
	}()
	static let LOG_TEN : NSMutableAttributedString = {
		let logten = NSMutableAttributedString().characterSubscriptAndSuperscript(
			string: "log10",
			characters:["1","0"],
			type: .aSub,
			fontSize: 17,
			scriptFontSize: 10,
			offSet: 5,
			length: [1,1],
			alignment: .center)
		return logten
	}()
	static let XPOWTWO : NSMutableAttributedString = {
		let xpowtwo = NSMutableAttributedString().characterSubscriptAndSuperscript(
			string: "x2",
			characters:["2"],
			type: .aSuper,
			fontSize: 17,
			scriptFontSize: 12,
			offSet: 10,
			length: [1],
			alignment: .center)
		return xpowtwo
	}()
	static let XPOWTHREE : NSMutableAttributedString = {
		let xpowthree = NSMutableAttributedString().characterSubscriptAndSuperscript(
			string: "x3",
			characters:["3"],
			type: .aSuper,
			fontSize: 17,
			scriptFontSize: 12,
			offSet: 10,
			length: [1],
			alignment: .center)
		return xpowthree
	}()
	static let XPOWY : NSMutableAttributedString = {
		let xpowy = NSMutableAttributedString().characterSubscriptAndSuperscript(
			string: "xy",
			characters:["y"],
			type: .aSuper,
			fontSize: 17,
			scriptFontSize: 12,
			offSet: 10,
			length: [1],
			alignment: .center)
		return xpowy
	}()
	static let TWO_SQUARE_ROOT : NSMutableAttributedString = {
		let two_square_root = NSMutableAttributedString().characterSubscriptAndSuperscript(
			string: "2√x",
			characters:["2"],
			type: .aSuper,
			fontSize: 17,
			scriptFontSize: 12,
			offSet: 5,
			length: [1],
			alignment: .center)
		return two_square_root
	}()
	static let THREE_SQUARE_ROOT : NSMutableAttributedString = {
		let three_square_root = NSMutableAttributedString().characterSubscriptAndSuperscript(
			string: "3√x",
			characters:["3"],
			type: .aSuper,
			fontSize: 17,
			scriptFontSize: 12,
			offSet: 5,
			length: [1],
			alignment: .center)
		return three_square_root
	}()
	static let XY_SQUARE_ROOT : NSMutableAttributedString = {
		let xy_square_root = NSMutableAttributedString().characterSubscriptAndSuperscript(
			string: "y√x",
			characters:["y"],
			type: .aSuper,
			fontSize: 17,
			scriptFontSize: 12,
			offSet: 5,
			length: [1],
			alignment: .center)
		return xy_square_root
	}()
	static let YPOWX : NSMutableAttributedString = {
		let ypowx = NSMutableAttributedString().characterSubscriptAndSuperscript(
			string: "yx",
			characters:["x"],
			type: .aSuper,
			fontSize: 17,
			scriptFontSize: 12,
			offSet: 10,
			length: [1],
			alignment: .center)
		return ypowx
	}()
	static let TWOPOWX : NSMutableAttributedString = {
		let twopowx = NSMutableAttributedString().characterSubscriptAndSuperscript(
			string: "2x",
			characters:["x"],
			type: .aSuper,
			fontSize: 17,
			scriptFontSize: 12,
			offSet: 10,
			length: [1],
			alignment: .center)
		return twopowx
	}()
	static let LOG_Y : NSMutableAttributedString = {
		let logy = NSMutableAttributedString().characterSubscriptAndSuperscript(
			string: "logy",
			characters:["y"],
			type: .aSub,
			fontSize: 17,
			scriptFontSize: 10,
			offSet: 5,
			length: [1],
			alignment: .center)
		return logy
	}()
	static let LOG_2 : NSMutableAttributedString = {
		let logtwo = NSMutableAttributedString().characterSubscriptAndSuperscript(
			string: "log2",
			characters:["2"],
			type: .aSub,
			fontSize: 17,
			scriptFontSize: 10,
			offSet: 5,
			length: [1],
			alignment: .center)
		return logtwo
	}()
	static let SIN_INVERSE : NSMutableAttributedString = {
		let sin_inverse = NSMutableAttributedString().characterSubscriptAndSuperscript(
			string: "sin-1",
			characters:["-","1"],
			type: .aSuper,
			fontSize: 17,
			scriptFontSize: 12,
			offSet: 10,
			length: [1,1],
			alignment: .center)
		return sin_inverse
	}()
	static let COS_INVERSE : NSMutableAttributedString = {
		let cos_inverse = NSMutableAttributedString().characterSubscriptAndSuperscript(
			string: "cos-1",
			characters:["-","1"],
			type: .aSuper,
			fontSize: 17,
			scriptFontSize: 12,
			offSet: 10,
			length: [1,1],
			alignment: .center)
		return cos_inverse
	}()
	static let TAN_INVERSE : NSMutableAttributedString = {
		let tan_inverse = NSMutableAttributedString().characterSubscriptAndSuperscript(
			string: "tan-1",
			characters:["-","1"],
			type: .aSuper,
			fontSize: 17,
			scriptFontSize: 12,
			offSet: 10,
			length: [1,1],
			alignment: .center)
		return tan_inverse
	}()
}
