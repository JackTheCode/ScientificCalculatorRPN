//
//  CommandRoute_newUpgrade.swift
//  rtCPMS
//
//  Created by JackTheCode on 4/16/18.
//  Copyright © 2018 RTA. All rights reserved.
//

import Foundation
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
     var didEndCompute : Bool = false
     var operatorPrecedenceFlag : Bool = false
     var didEndSession : Bool = false

     static let sharedInstance : CommandRoute = {
          let command = CommandRoute()
          return command
     }()

     var delegate : CommandRouteDelegate?
     var delegateUI : CommandRouteUIDelegate?
     var stack : LinkedList<Double>!

     var operatorPrecedence = InfixExpressionBuilder.sharedInstance

     func caculateTotal() -> Double? {
          let expr : [Token] = operatorPrecedence.build()
          print("Expr: \(expr)")
          print("ReversePolishNotation: \(reversePolishNotation(expr))")
          let postFix = reversePolishNotation(expr)
          let result = evalRPN(postFix)
          return result
     }

     func evalRPN(_ expr: String) -> Double {
          guard let cleanExpr : String = cleanExpr(expr) else {return 0.0}
          print("Cleaned expr : \(cleanExpr)")
          stack = LinkedList<Double>()
          for token in cleanExpr.components(separatedBy: " ") {
               print("\(token)\t")
			   if let tokenNum : Double = token.doubleValue {
					stack.append(tokenNum)
               }
               else if token == OperatorType.divide.description {
                    let secondOperand = stack.removeLast()
                    let firstOperand = stack.removeLast()
                    stack.append(firstOperand / secondOperand)
               }
               else if token == OperatorType.multiply.description {
                    let secondOperand = stack.removeLast()
                    let firstOperand = stack.removeLast()
                    stack.append(firstOperand * secondOperand)
               }
               else if token == OperatorType.subtract.description {
                    let secondOperand = stack.removeLast()
                    let firstOperand = stack.removeLast()
                    stack.append(firstOperand - secondOperand)
               }
               else if token == OperatorType.add.description {
                    let secondOperand = stack.removeLast()
                    let firstOperand = stack.removeLast()
                    stack.append(firstOperand + secondOperand)
               }
               else if token == OperatorType.exponent.description {
                    let secondOperand = stack.removeLast()
                    let firstOperand = stack.removeLast()
                    stack.append(pow(firstOperand,secondOperand))
               }
               else if token == OperatorType.exponent_inverse.description {
                    let secondOperand = stack.removeLast()
                    let firstOperand = stack.removeLast()
                    stack.append(pow(secondOperand,firstOperand))
               }
               else if token == OperatorType.squareRoot.description {
                    let secondOperand = stack.removeLast()
                    let firstOperand = stack.removeLast()
                    stack.append(pow(firstOperand,1/secondOperand))
               }
               else if token == OperatorType.log.description {
                    let secondOperand = stack.removeLast()
                    let firstOperand = stack.removeLast()
                    stack.append(log(firstOperand)/log(secondOperand))
               }
          }
          return stack.removeLast()
     }

     func cleanExpr(_ expr: String) -> String? {
		var expr = expr
          //remove all non-operators, non-whitespace, trailing-zero, and non digit chars
		expr.removingRegexMatches(pattern: "[^\\^\\*\\+\\-\\d/\\s\\.?0*$]", replaceWith: "")
		expr.removingRegexMatches(pattern: "(?<=^\\d+)\\.0*$", replaceWith: "")
		return expr
     }

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

          if operatorPrecedence.expression.count % 2 != 0 {
               let lastOutputElement = removeTruncatingRemainer((operatorPrecedence.expression.popLast()?.description)!)
               var currOutput:Float = Float(lastOutputElement)!

               switch resultString {
                    //               case ("1/x"):
               //                    currOutput = 1/currOutput
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
                    //               case("tanh"):
                    //                    currOutput = atan(currOutput)
                    //               case("cosh"):
                    //                    currOutput = atan(1/currOutput)
                    //               case("sinh"):
               //                    currOutput = Float(M_PI/2) - Float(atan(1/currOutput))
               case(_):
                    print("could not find match")
               }
               print(String(currOutput))
               _  = operatorPrecedence.addOperand(Double(currOutput))
               resultString = String(currOutput)
          }
          sendStandardizedMathResult(resultString)
     }

     func numberButtonAction(_ resultString: String){
          var resultString = resultString
          var oldString:String = ""
          if didEndCompute {
               operatorPrecedence = InfixExpressionBuilder()
               didEndCompute = false
          }
          if operatorPrecedence.expression.count % 2 == 0 {
               _ = operatorPrecedence.addOperand(Double(resultString)!)
          } else if(decimalFlag){
               oldString = removeTruncatingRemainer((operatorPrecedence.expression.popLast()?.description)!)
               let needle:Character = "."
               if let _ = oldString.index(of: needle) {
                    resultString = oldString + resultString
               } else {
                    resultString = oldString + "." + resultString
               }
               _ = operatorPrecedence.addOperand(Double(resultString)!)
          } else {
               oldString = removeTruncatingRemainer((operatorPrecedence.expression.popLast()?.description)!)
               resultString = oldString + resultString
               _ = operatorPrecedence.addOperand(Double(resultString)!)
          }
          sendStandardizedMathResult(resultString)
     }

     func clusterNumberAction(_ clusterString: String) {
          let characters = clusterString.map { String($0) }
          for index in 0..<characters.count {
               numberButtonAction(characters[index])
          }
     }

     func commandButtonAction(_ resultString: String){
          switch resultString {
          case(CalculatorConstant.AC):
               self.delegate?.displayResult("0")
               decimalFlag = false
               operatorPrecedence = InfixExpressionBuilder()
          case CalculatorConstant.LEFT_BRACKET:
//			   _ = operatorPrecedence.addOpenBracket()
               break
          case CalculatorConstant.TWOPOWND_RAW:
               twoNdFlag = !twoNdFlag
               self.delegateUI?.needRefreshLayout(twoNdFlag)
          case CalculatorConstant.RIGHT_BRACKET:
//               decimalFlag = false
//               didEndCompute = false
//               _ = operatorPrecedence.addCloseBracket()
//               if(operatorPrecedence.expression.count % 2 != 0 && operatorPrecedence.expression.count > 1){
//                    guard let total:Double = caculateTotal() else { return }
//                    _ = operatorPrecedence.addOperand(total)
//                    print(total)
//                    sendStandardizedMathResult(String(total))
//               }
			break
          case(CalculatorConstant.PI):
               if(operatorPrecedence.expression.count % 2 == 0){
                    _ = operatorPrecedence.addOperand(Double.pi)
               }else {
                    _ = operatorPrecedence.expression.popLast()
                    _ = operatorPrecedence.addOperand(Double.pi)
               }
               self.delegate?.displayResult(String(Float.pi))
          case CalculatorConstant.E:
               if(operatorPrecedence.expression.count % 2 == 0){
                    _ = operatorPrecedence.addOperand(Double(M_E))
               }else {
                    _ = operatorPrecedence.expression.popLast()
                    _ = operatorPrecedence.addOperand(Double(M_E))
               }
               self.delegate?.displayResult(String(M_E))
          case(CalculatorConstant.NEGATIVE_NUMBER):
			if (self.delegate?.getResultContext() != "") {
                    if(operatorPrecedence.expression.count % 2 != 0){
                         let lastElement = removeTruncatingRemainer((operatorPrecedence.expression.popLast()?.description)!)
                         var lastInt: Float = Float(lastElement)!
                         lastInt = 0 - lastInt
                         _ = operatorPrecedence.addOperand(Double(lastInt))
                         sendStandardizedMathResult(String(lastInt))
                    }
               }
          case CalculatorConstant.PERCENT :
               if(operatorPrecedence.expression.count % 2 != 0){
                    let lastElement = removeTruncatingRemainer((operatorPrecedence.expression.popLast()?.description)!)
                    guard let percent : Float = Float(lastElement)! / 100.0 else {return}
                    _ = operatorPrecedence.addOperand(Double(percent))
                    self.delegate?.displayResult(String(percent))
               }
          case CalculatorConstant.DELETE :
               self.delegate?.deleteBackWard()
               if let contextResult = self.delegate?.getResultContext(),contextResult != "" {
                    _ = operatorPrecedence.addOperand(Double(contextResult)!)
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
               didEndCompute = true
               if(operatorPrecedence.expression.count % 2 != 0 && operatorPrecedence.expression.count > 1){
                    guard let total:Double = caculateTotal() else { return }
                    _ = operatorPrecedence.addOperand(total)
                    print(total)
                    sendStandardizedMathResult(String(total))
               }
          case(_):
               if(operatorPrecedence.expression.count % 2 != 0){
                    if(resultString == CalculatorConstant.DIVIDE){
                         didEndCompute = false
                         _ = operatorPrecedence.addOperator(.divide)
                    }else if(resultString == CalculatorConstant.MULTIPLY){
                         didEndCompute = false
                         _ = operatorPrecedence.addOperator(.multiply)
                    }else if(resultString == CalculatorConstant.MINUS){
                         didEndCompute = false
                         _ = operatorPrecedence.addOperator(.subtract)
                    }else if(resultString == CalculatorConstant.PLUS){
                         didEndCompute = false
                         _ = operatorPrecedence.addOperator(.add)
                    }else if resultString == CalculatorConstant.XPOWY_RAW {
                         didEndCompute = false
                         _ = operatorPrecedence.addOperator(.exponent)
                    }else if resultString == CalculatorConstant.XY_SQUARE_ROOT_RAW {
                         didEndCompute = false
                         _ = operatorPrecedence.addOperator(.squareRoot)
                    }else if resultString == CalculatorConstant.YPOWX_RAW {
                         didEndCompute = false
                         _ = operatorPrecedence.addOperator(.exponent_inverse)
                    }else if resultString == CalculatorConstant.LOGY_RAW {
                         didEndCompute = false
                         _ = operatorPrecedence.addOperator(.log)
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

     func removeTruncatingRemainer(_ valueStr: String) -> String {
          if let isInteger = Float(valueStr)?.truncatingRemainder(dividingBy: 1),isInteger == 0 {
               return String(valueStr).replacingOccurrences(of: ".0",with: "")
          }
          return valueStr
     }
}
extension BinaryInteger {
     var degreesToRadians: CGFloat { return CGFloat(Int(self)) * .pi / 180 }
}

extension FloatingPoint {
     var degreesToRadians: Self { return self * .pi / 180 }
     var radiansToDegrees: Self { return self * 180 / .pi }
}


