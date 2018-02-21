//
//  CommandRoute.swift
//  rtCPMS
//
//  Created by phat nguyen on 12/21/17.
//  Copyright © 2017 RTA. All rights reserved.
//

import Foundation
import CoreGraphics
import UIKit

protocol CommandRouteDelegate {
	func displayResult(_ resultString: String)
	func deleteBackWard()
	func getResultContext() -> String
    func radiansMode(_ radians: Bool)
}

protocol CommandRouteUIDelegate {
	func needRefreshLayout(_ need: Bool)
	func needChangeRadiansTitle(_ need: Bool)
}

class CommandRoute {
	
	var decimalFlag:Bool = false
	var radiansFlag:Bool = false
	var twoNdFlag: Bool = false
	var operatorPrecedenceFlag : Bool = false
	var didEndSession : Bool = false
	
	static let sharedInstance : CommandRoute = {
		let command = CommandRoute()
		return command
	}()
	
	var delegate : CommandRouteDelegate?
	var delegateUI : CommandRouteUIDelegate?
	
	var operations = OperationStack.sharedInstance
	var operatorPrecedence = InfixExpressionBuilder.sharedInstance
	
	//Calculates total from operations stack
	func caculateTotal() -> Float {
		if operations.count() == 0 {
			return 0
		}
		if operations.count()%2 == 0 {
			operations.pop()
		}
		
		guard var currTotal:Float = Float(operations.pop())! else {return 0.0}
		while(operations.count() > 0){
			guard let currCommand:String = operations.pop() else {return 0.0}
			guard let nextNumber:Float = Float(operations.pop())! else {return 0.0}
			
			if(currCommand == "DIV"){
				currTotal = nextNumber/currTotal
			}else if(currCommand == "MUL"){
				currTotal = currTotal*nextNumber
			}else if(currCommand == "SUB"){
				currTotal = nextNumber - currTotal
			}else if(currCommand == "ADD"){
				currTotal = currTotal + nextNumber
			}else if currCommand == "XPOWY" {
				currTotal = pow(nextNumber,currTotal)
			}else if currCommand == "XY_SQUARE_ROOT" {
				currTotal = pow(nextNumber,1/currTotal)
			}else if currCommand == "YPOWX" {
				currTotal = pow(currTotal,nextNumber)
			}else if currCommand == "LOGY" {
				currTotal = log(nextNumber)/log(currTotal)
			}
		}
		return currTotal
	}
	
//	func aggregateTotal() -> Float {
//	    let expr : [Token] = operatorPrecedence.build()
//		FELog.d("Expr: \(expr)")
//		FELog.d("ReversePolishNotation: \(reversePolishNotation(expr))")
//	    let result = evalRPN(reversePolishNotation(expr))
//		return result
//	}
	
//	func evalRPN(_ expr: String) -> Float {
//		guard let cleanExpr : String = cleanExpr(expr) else {return 0.0}
//		var stack : LinkedList<Double> = LinkedList<Double>()
//		for token in cleanExpr.components(separatedBy: " ") {
//			FELog.d("\(token)\t")
//			if let tokenNum = token.doubleValue {
//				stack.append(tokenNum)
//			}
//			else if token == OperatorType.divide.description {
//				let secondOperand = stack.removeLast()
//				let firstOperand = stack.removeLast()
//				stack.append(firstOperand / secondOperand)
//			}
//			else if token == OperatorType.multiply.description {
//				let secondOperand = stack.removeLast()
//				let firstOperand = stack.removeLast()
//				stack.append(firstOperand * secondOperand)
//			}
//			else if token == OperatorType.subtract.description {
//				let secondOperand = stack.removeLast()
//				let firstOperand = stack.removeLast()
//				stack.append(firstOperand - secondOperand)
//			}
//			else if token == OperatorType.add.description {
//				let secondOperand = stack.removeLast()
//				let firstOperand = stack.removeLast()
//				stack.append(firstOperand + secondOperand)
//			}
//			else if token == OperatorType.exponent.description {
//				let secondOperand = stack.removeLast()
//				let firstOperand = stack.removeLast()
//				stack.append(pow(firstOperand,secondOperand))
//			}
//			else if token == OperatorType.squareRoot.description {
//				let secondOperand = stack.removeLast()
//				let firstOperand = stack.removeLast()
//				stack.append(pow(firstOperand,1/secondOperand))
//			}
//			else if token == OperatorType.log.description {
//				let secondOperand = stack.removeLast()
//				let firstOperand = stack.removeLast()
//				stack.append(log(firstOperand)/log(secondOperand))
//			}
//		}
//		return Float(stack.removeLast())
//	}
	
//	func cleanExpr(_ expr: String) -> String {
//		let sanitized : String = expr.nsString.replaceAll("[^\\^\\*\\+\\-\\d/\\s\\.?0*$]", withReplacement: "")
//		return sanitized
//	}
	
	func factorial(n: Float) -> Float {
		if n >= 0 {
			return n == 0 ? 1 : n * self.factorial(n: n - 1)
		} else {
			return 0 / 0
		}
	}
	
	// MARK - Event handlers
	func buttonSingleAction(_ resultString: String) {
		var resultString = resultString
		
		if operations.count()%2 != 0 {
			var currOutput:Float = Float(operations.pop())!
			
			switch resultString {
//			case ("1/x"):
//				currOutput = 1/currOutput
			case (CalculatorConstant.XPOWTWO_RAW):
				currOutput = pow(currOutput,2)
			case (CalculatorConstant.XPOWTHREE_RAW):
				currOutput = pow(currOutput,3)
			case (CalculatorConstant.TWO_SQUARE_ROOT_RAW):
				currOutput = pow(currOutput, 1/2)
			case CalculatorConstant.EPOWX_RAW :
				currOutput = pow(Float(M_E),currOutput)
			case (CalculatorConstant.THREE_SQUARE_ROOT_RAW):
				currOutput = pow(currOutput, 1/3)
			case (CalculatorConstant.TENPOWX_RAW):
				currOutput = pow(10, currOutput)
			case (CalculatorConstant.LOG_TEN_RAW):
				currOutput = log10(currOutput)
			case (CalculatorConstant.LN):
				currOutput = log(currOutput)
			case (CalculatorConstant.FACTORIAL):
				currOutput = factorial(n: currOutput)
			case (CalculatorConstant.SIN):
				if radiansFlag {
					currOutput = sin(currOutput)
				}
				else {
					currOutput = sin(currOutput.degreesToRadians)
				}
			case CalculatorConstant.SIN_INVERSE_RAW :
				if radiansFlag {
					currOutput = asin(currOutput)
				}
				else {
					currOutput = asin(currOutput).radiansToDegrees
				}
			case CalculatorConstant.COS_INVERSE_RAW :
				if radiansFlag {
					currOutput = acos(currOutput)
				}
				else {
					currOutput = acos(currOutput).radiansToDegrees
				}
			case CalculatorConstant.TAN_INVERSE_RAW :
				if radiansFlag {
					currOutput = atan(currOutput)
				}
				else {
					currOutput = atan(currOutput).radiansToDegrees
				}
			case (CalculatorConstant.COS):
				if radiansFlag {
					currOutput = cos(currOutput)
				}
				else {
					currOutput = cos(currOutput.degreesToRadians)
				}
			case (CalculatorConstant.TAN):
				if radiansFlag {
					currOutput = tan(currOutput)
				}
				else {
					currOutput = tan(currOutput.degreesToRadians)
				}
			case CalculatorConstant.TWOPOWX_RAW :
				currOutput = pow(2,currOutput)
			case CalculatorConstant.LOGTWO_RAW :
				currOutput = log2(currOutput)
//			case("tanh"):
//				currOutput = atan(currOutput)
//			case("cosh"):
//				currOutput = atan(1/currOutput)
//			case("sinh"):
//				currOutput = Float(M_PI/2) - Float(atan(1/currOutput))
			case(_):
				print("could not find match")
			}
			print(String(currOutput))
			operations.push(item: String(currOutput))
			////operatorPrecedence.addOperand(Double(currOutput))
			resultString = String(currOutput)
		}
		sendStandardizedMathResult(resultString)
	}
	
	func numberButtonAction(_ resultString: String){
		var resultString = resultString
		var oldString:String = ""
		if operations.count()%2 == 0 {
			operations.push(item: resultString)
			//operatorPrecedence.addOperand(Double(resultString)!)
		}else if(decimalFlag){
			oldString = operations.pop()
			let needle:Character = "."
			if let idx = oldString.characters.index(of: needle) {
				resultString = oldString + resultString
			} else {
				resultString = oldString + "." + resultString
			}
			operations.push(item: resultString)
			//operatorPrecedence.addOperand(Double(resultString)!)
		} else {
			oldString = operations.pop()
			resultString = oldString + resultString
//			operatorPrecedence = InfixExpressionBuilder()
			operations.push(item: resultString)
			//operatorPrecedence.addOperand(Double(resultString)!)
		}
		sendStandardizedMathResult(resultString)
	}
	
	func clusterNumberAction(_ clusterString: String) {
		let characters = clusterString.characters.map { String($0) } as! [String]
		for index in 0..<characters.count {
			numberButtonAction(characters[index])
		}
	}
	
	func commandButtonAction(_ resultString: String){
		switch resultString {
		case(CalculatorConstant.AC):
			self.delegate?.displayResult("0")
			decimalFlag = false
			operations = OperationStack()
			operatorPrecedence = InfixExpressionBuilder()
		case CalculatorConstant.LEFT_BRACKET:
			break
//			operatorPrecedenceFlag = true
//			operatorPrecedence.addOpenBracket()
		case CalculatorConstant.TWOPOWND_RAW:
			twoNdFlag = !twoNdFlag
			self.delegateUI?.needRefreshLayout(twoNdFlag)
		case CalculatorConstant.RIGHT_BRACKET:
			decimalFlag = false
			if(operations.count()%2 != 0 && operations.count() > 1){
				guard let total:Float = caculateTotal() else { return }
				operations.push(item: String(total))
				print(total)
				sendStandardizedMathResult(String(total))
			}
			operatorPrecedence.addCloseBracket()
		case(CalculatorConstant.PI):
			if(operations.count()%2 == 0){
				operations.push(item: String(Float.pi))
			}else {
				operations.pop()
				operations.push(item: String(Float.pi))
			}
			//operatorPrecedence.addOperand(Double(Float.pi))
			self.delegate?.displayResult(String(Float.pi))
		case CalculatorConstant.E:
			if(operations.count()%2 == 0){
				operations.push(item: String(M_E))
			}else {
				operations.pop()
				operations.push(item: String(M_E))
			}
			//operatorPrecedence.addOperand(M_E)
			self.delegate?.displayResult(String(M_E))
		case(CalculatorConstant.NEGATIVE_NUMBER):
			if !(self.delegate?.getResultContext().isEmpty)! {
				 if(operations.count()%2 != 0){
					 var lastInt:Float = Float(operations.pop())!
					 lastInt = 0 - lastInt
					 operations.push(item: String(lastInt))
					 //operatorPrecedence.addOperand(Double(lastInt))
					 sendStandardizedMathResult(String(lastInt))
				 }
			}
		case CalculatorConstant.PERCENT :
			if(operations.count()%2 != 0){
				guard let percent : Float = Float(operations.pop())!/100.0 else {return}
				operations.push(item: String(percent))
				self.delegate?.displayResult(String(percent))
			}
			//operatorPrecedence.addOperator(.percent)
		case CalculatorConstant.DELETE :
			self.delegate?.deleteBackWard()
			operations = OperationStack()
			if let contextResult = self.delegate?.getResultContext(),contextResult != "" {
				operations.push(item: contextResult)
				//operatorPrecedence.addOperand(Double(contextResult)!)
			}
			else {
				decimalFlag = false
			}
		case(CalculatorConstant.COMMA):
			decimalFlag = true
		case(CalculatorConstant.DEG):
			radiansFlag = !radiansFlag
			self.delegate?.radiansMode(radiansFlag)
			self.delegateUI?.needChangeRadiansTitle(radiansFlag)
		case(CalculatorConstant.EQUAL):
			decimalFlag = false
			if(operations.count()%2 != 0 && operations.count() > 1){
				guard let total:Float = caculateTotal() else { return }
				operations.push(item: String(total))
				print(total)
				sendStandardizedMathResult(String(total))
			}
			operations = OperationStack()
		case(_):
			if(operations.count()%2 != 0){
				if(resultString == CalculatorConstant.DIVIDE){
					operations.push(item: "DIV")
					//operatorPrecedence.addOperator(.divide)
				}else if(resultString == CalculatorConstant.MULTIPLY){
					operations.push(item: "MUL")
					//operatorPrecedence.addOperator(.multiply)
				}else if(resultString == CalculatorConstant.MINUS){
					operations.push(item: "SUB")
					//operatorPrecedence.addOperator(.subtract)
				}else if(resultString == CalculatorConstant.PLUS){
					operations.push(item: "ADD")
					//operatorPrecedence.addOperator(.add)
				}else if resultString == CalculatorConstant.XPOWY_RAW {
					operations.push(item: "XPOWY")
					//operatorPrecedence.addOperator(.exponent)
				}else if resultString == CalculatorConstant.XY_SQUARE_ROOT_RAW {
					operations.push(item: "XY_SQUARE_ROOT")
					//operatorPrecedence.addOperator(.squareRoot)
				}else if resultString == CalculatorConstant.YPOWX_RAW {
					operations.push(item: "YPOWX")
					//operatorPrecedence.addOperator(.exponent)
				}else if resultString == CalculatorConstant.LOGY_RAW {
					operations.push(item: "LOGY")
					//operatorPrecedence.addOperator(.log)
				}
			}else{
				print("Command key not recognized")
			}
		}
	}
	
	func sendStandardizedMathResult(_ rawResult: String) {
		if let isInteger = Float(rawResult)?.truncatingRemainder(dividingBy: 1),isInteger == 0 {
			self.delegate?.displayResult(String(rawResult).replacingOccurrences(of: ".0",with: ""))
		}
		else {
			self.delegate?.displayResult(String(rawResult))
		}
	}
}
extension BinaryInteger {
	var degreesToRadians: CGFloat { return CGFloat(Int(self)) * .pi / 180 }
}

extension FloatingPoint {
	var degreesToRadians: Self { return self * .pi / 180 }
	var radiansToDegrees: Self { return self * 180 / .pi }
}

