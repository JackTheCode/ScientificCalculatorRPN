//
//  CalculatorConstant.swift
//  rtCPMS
//
//  Created by phat nguyen on 12/19/17.
//  Copyright © 2017 RTA. All rights reserved.
//

import Foundation

class CalculatorButton: NSObject {
	var titleAttr: NSMutableAttributedString
	var titleStr: String
	var command: String
	var type: ButtonType
	init(_ button: ButtonType) {
		switch button {
		case .AC :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr = CalculatorConstant.AC
			command = CommandType.COMMAND
			type = .AC
		case .NEGATIVE_NUMBER :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr = CalculatorConstant.NEGATIVE_NUMBER
			command = CommandType.COMMAND
			type = .NEGATIVE_NUMBER
		case .PERCENT :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr = CalculatorConstant.PERCENT
			command   = CommandType.COMMAND
			type      = .PERCENT
		case .DELETE :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr  = CalculatorConstant.DELETE
			command   = CommandType.COMMAND
			type      = .DELETE
		case .SEVEN :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr  = CalculatorConstant.SEVEN
			command   = CommandType.NUMBER
			type      = .SEVEN
		case .EIGHT :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr  = CalculatorConstant.EIGHT
			command   = CommandType.NUMBER
			type      = .EIGHT
		case .NINE :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr  = CalculatorConstant.NINE
			command   = CommandType.NUMBER
			type      = .NINE
		case .FOUR :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr  = CalculatorConstant.FOUR
			command   = CommandType.NUMBER
			type      = .FOUR
		case .FIVE :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr  = CalculatorConstant.FIVE
			command   = CommandType.NUMBER
			type      = .FIVE
		case .SIX :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr  = CalculatorConstant.SIX
			command   = CommandType.NUMBER
			type      = .SIX
		case .THREE :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr  = CalculatorConstant.THREE
			command   = CommandType.NUMBER
			type      = .THREE
		case .TWO :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr  = CalculatorConstant.TWO
			command   = CommandType.NUMBER
			type      = .TWO
		case .ONE :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr  = CalculatorConstant.ONE
			command   = CommandType.NUMBER
			type      = .ONE
		case .ZERO :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr  = CalculatorConstant.ZERO
			command   = CommandType.NUMBER
			type      = .ZERO
		case .COMMA :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr  = CalculatorConstant.COMMA
			command   = CommandType.COMMAND
			type      = .COMMA
		case .PLUS :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr  = CalculatorConstant.PLUS
			command   = CommandType.COMMAND
			type      = .PLUS
		case .MINUS :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr  = CalculatorConstant.MINUS
			command   = CommandType.COMMAND
			type      = .MINUS
		case .MULTIPLY :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr  = CalculatorConstant.MULTIPLY
			command   = CommandType.COMMAND
			type      = .MULTIPLY
		case .DIVIDE :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr  = CalculatorConstant.DIVIDE
			command   = CommandType.COMMAND
			type      = .DIVIDE
		case .EQUAL :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr  = CalculatorConstant.EQUAL
			command   = CommandType.COMMAND
			type      = .EQUAL
		case .DEG :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr  = CalculatorConstant.DEG
			command   = CommandType.COMMAND
			type      = .DEG
		case .TWOPOWND :
			titleAttr = CalculatorConstant.TWOPOWND
			titleStr  = CalculatorConstant.TWOPOWND_RAW
			command   = CommandType.COMMAND
			type      = .TWOPOWND
		case .LEFT_BRACKET :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr  = CalculatorConstant.LEFT_BRACKET
			command   = CommandType.COMMAND
			type      = .LEFT_BRACKET
		case .RIGHT_BRACKET :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr  = CalculatorConstant.RIGHT_BRACKET
			command   = CommandType.COMMAND
			type      = .RIGHT_BRACKET
		case .SIN :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr  = CalculatorConstant.SIN
			command   = CommandType.BUTTON_SINGLE
			type      = .SIN
		case .COS :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr  = CalculatorConstant.COS
			command   = CommandType.BUTTON_SINGLE
			type      = .COS
		case .TAN :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr  = CalculatorConstant.TAN
			command   = CommandType.BUTTON_SINGLE
			type      = .TAN
		case .EPOWX :
			titleAttr = CalculatorConstant.EPOWX
			titleStr  = CalculatorConstant.EPOWX_RAW
			command   = CommandType.BUTTON_SINGLE
			type      = .EPOWX
		case .LN :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr  = CalculatorConstant.LN
			command   = CommandType.BUTTON_SINGLE
			type      = .LN
		case .TENPOWX :
			titleAttr = CalculatorConstant.TENPOWX
			titleStr  = CalculatorConstant.TENPOWX_RAW
			command   = CommandType.BUTTON_SINGLE
			type      = .TENPOWX
		case .LOG_TEN :
			titleAttr = CalculatorConstant.LOG_TEN
			titleStr  = CalculatorConstant.LOG_TEN_RAW
			command   = CommandType.BUTTON_SINGLE
			type      = .LOG_TEN
		case .FACTORIAL :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr  = CalculatorConstant.FACTORIAL
			command   = CommandType.BUTTON_SINGLE
			type      = .FACTORIAL
		case .XPOWTHREE :
			titleAttr = CalculatorConstant.XPOWTHREE
			titleStr  = CalculatorConstant.XPOWTHREE_RAW
			command   = CommandType.BUTTON_SINGLE
			type      = .XPOWTHREE
		case .XPOWTWO :
			titleAttr = CalculatorConstant.XPOWTWO
			titleStr  = CalculatorConstant.XPOWTWO_RAW
			command   = CommandType.BUTTON_SINGLE
			type      = .XPOWTWO
		case .XPOWY :
			titleAttr = CalculatorConstant.XPOWY
			titleStr  = CalculatorConstant.XPOWY_RAW
			command   = CommandType.COMMAND
			type      = .XPOWY
		case .PI :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr  = CalculatorConstant.PI
			command   = CommandType.COMMAND
			type      = .PI
		case .TWO_SQUARE_ROOT :
			titleAttr = CalculatorConstant.TWO_SQUARE_ROOT
			titleStr  = CalculatorConstant.TWO_SQUARE_ROOT_RAW
			command   = CommandType.BUTTON_SINGLE
			type      = .TWO_SQUARE_ROOT
		case .THREE_SQUARE_ROOT :
			titleAttr = CalculatorConstant.THREE_SQUARE_ROOT
			titleStr  = CalculatorConstant.THREE_SQUARE_ROOT_RAW
			command   = CommandType.BUTTON_SINGLE
			type      = .THREE_SQUARE_ROOT
		case .XY_SQUARE_ROOT :
			titleAttr = CalculatorConstant.XY_SQUARE_ROOT
			titleStr  = CalculatorConstant.XY_SQUARE_ROOT_RAW
			command   = CommandType.COMMAND
			type      = .XY_SQUARE_ROOT
		case .E :
			titleAttr = NSMutableAttributedString(string: "")
			titleStr  = CalculatorConstant.E
			command   = CommandType.COMMAND
			type      = .E
		case .YPOWX :
			titleAttr = CalculatorConstant.YPOWX
			titleStr  = CalculatorConstant.YPOWX_RAW
			command   = CommandType.COMMAND
			type      = .YPOWX
		case .TWOPOWX :
			titleAttr = CalculatorConstant.TWOPOWX
			titleStr  = CalculatorConstant.TWOPOWX_RAW
			command   = CommandType.BUTTON_SINGLE
			type      = .TWOPOWX
		case .LOGY :
			titleAttr = CalculatorConstant.LOG_Y
			titleStr  = CalculatorConstant.LOGY_RAW
			command   = CommandType.COMMAND
			type      = .LOGY
		case .LOGTWO :
			titleAttr = CalculatorConstant.LOG_2
			titleStr  = CalculatorConstant.LOGTWO_RAW
			command   = CommandType.BUTTON_SINGLE
			type      = .LOGTWO
		case .SIN_INVERSE :
			titleAttr = CalculatorConstant.SIN_INVERSE
			titleStr  = CalculatorConstant.SIN_INVERSE_RAW
			command   = CommandType.BUTTON_SINGLE
			type      = .SIN_INVERSE
		case .COS_INVERSE :
			titleAttr = CalculatorConstant.COS_INVERSE
			titleStr  = CalculatorConstant.COS_INVERSE_RAW
			command   = CommandType.BUTTON_SINGLE
			type      = .COS_INVERSE
		case .TAN_INVERSE :
			titleAttr = CalculatorConstant.TAN_INVERSE
			titleStr  = CalculatorConstant.TAN_INVERSE_RAW
			command   = CommandType.BUTTON_SINGLE
			type      = .TAN_INVERSE
		}
	}
	
	static func getMathButtonsList() -> [CalculatorButton] {
		var mathButtons : [CalculatorButton] = [CalculatorButton]()
		mathButtons.append(CalculatorButton(.AC))
		mathButtons.append(CalculatorButton(.NEGATIVE_NUMBER))
		mathButtons.append(CalculatorButton(.PERCENT))
		mathButtons.append(CalculatorButton(.DELETE))
		mathButtons.append(CalculatorButton(.SEVEN))
		mathButtons.append(CalculatorButton(.EIGHT))
		mathButtons.append(CalculatorButton(.NINE))
		mathButtons.append(CalculatorButton(.DIVIDE))
		mathButtons.append(CalculatorButton(.FOUR))
		mathButtons.append(CalculatorButton(.FIVE))
		mathButtons.append(CalculatorButton(.SIX))
		mathButtons.append(CalculatorButton(.MULTIPLY))
		mathButtons.append(CalculatorButton(.ONE))
		mathButtons.append(CalculatorButton(.TWO))
		mathButtons.append(CalculatorButton(.THREE))
		mathButtons.append(CalculatorButton(.MINUS))
		mathButtons.append(CalculatorButton(.ZERO))
		mathButtons.append(CalculatorButton(.COMMA))
		mathButtons.append(CalculatorButton(.EQUAL))
		mathButtons.append(CalculatorButton(.PLUS))
		return mathButtons
	}
	
	static func getScientificButtonsList() -> [CalculatorButton] {
		var scientificButtons : [CalculatorButton] = [CalculatorButton]()
		scientificButtons.append(CalculatorButton(.DEG))
		scientificButtons.append(CalculatorButton(.TWOPOWND))
		scientificButtons.append(CalculatorButton(.LEFT_BRACKET))
		scientificButtons.append(CalculatorButton(.RIGHT_BRACKET))
		scientificButtons.append(CalculatorButton(.SIN))
		scientificButtons.append(CalculatorButton(.COS))
		scientificButtons.append(CalculatorButton(.TAN))
		scientificButtons.append(CalculatorButton(.EPOWX))
		scientificButtons.append(CalculatorButton(.LN))
		scientificButtons.append(CalculatorButton(.TENPOWX))
		scientificButtons.append(CalculatorButton(.LOG_TEN))
		scientificButtons.append(CalculatorButton(.FACTORIAL))
		scientificButtons.append(CalculatorButton(.XPOWTWO))
		scientificButtons.append(CalculatorButton(.XPOWTHREE))
		scientificButtons.append(CalculatorButton(.XPOWY))
		scientificButtons.append(CalculatorButton(.PI))
		scientificButtons.append(CalculatorButton(.TWO_SQUARE_ROOT))
		scientificButtons.append(CalculatorButton(.THREE_SQUARE_ROOT))
		scientificButtons.append(CalculatorButton(.XY_SQUARE_ROOT))
		scientificButtons.append(CalculatorButton(.E))
		return scientificButtons
	}
	
	static func getTwoNdButtonsList() -> [CalculatorButton] {
		var twoNdButtons : [CalculatorButton] = [CalculatorButton]()
		twoNdButtons.append(CalculatorButton(.SIN_INVERSE))
		twoNdButtons.append(CalculatorButton(.COS_INVERSE))
		twoNdButtons.append(CalculatorButton(.TAN_INVERSE))
	    twoNdButtons.append(CalculatorButton(.YPOWX))
		twoNdButtons.append(CalculatorButton(.LOGY))
		twoNdButtons.append(CalculatorButton(.TWOPOWX))
		twoNdButtons.append(CalculatorButton(.LOGTWO))
		return twoNdButtons
	}
	
	class func getRateNumpadButtonList() -> [CalculatorButton] {
		var numpadList : [CalculatorButton] = [CalculatorButton]()
		numpadList.append(CalculatorButton(.SEVEN))
		numpadList.append(CalculatorButton(.EIGHT))
		numpadList.append(CalculatorButton(.NINE))
		numpadList.append(CalculatorButton(.FOUR))
		numpadList.append(CalculatorButton(.FIVE))
		numpadList.append(CalculatorButton(.SIX))
		numpadList.append(CalculatorButton(.ONE))
		numpadList.append(CalculatorButton(.TWO))
		numpadList.append(CalculatorButton(.THREE))
		numpadList.append(CalculatorButton(.AC))
		numpadList.append(CalculatorButton(.ZERO))
		numpadList.append(CalculatorButton(.COMMA))
		return numpadList
	}
	
}

enum ButtonType {
	//MARK Math
	case AC
	case NEGATIVE_NUMBER
	case PERCENT
	case DELETE
	case SEVEN
	case EIGHT
	case NINE
	case FOUR
	case FIVE
	case SIX
	case THREE
	case TWO
	case ONE
	case ZERO
	case COMMA
	case PLUS
	case MINUS
	case MULTIPLY
	case DIVIDE
	case EQUAL
	//MARK Scientific
	case DEG
	case TWOPOWND
	case LEFT_BRACKET
	case RIGHT_BRACKET
	case SIN
	case COS
	case TAN
	case EPOWX
	case LN
	case TENPOWX
	case LOG_TEN
	case FACTORIAL
	case XPOWTHREE
	case XPOWTWO
	case XPOWY
	case PI
	case TWO_SQUARE_ROOT
	case THREE_SQUARE_ROOT
	case XY_SQUARE_ROOT
	case E
	//Mark 2ND MODE
	case YPOWX
	case TWOPOWX
	case LOGY
	case LOGTWO
	case SIN_INVERSE
	case COS_INVERSE
	case TAN_INVERSE
}

