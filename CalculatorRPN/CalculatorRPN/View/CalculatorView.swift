//
//  BaseCalculatorView.swift
//  CalculatorRPN
//
//  Created by JackTheCode on 2/17/18.
//  Copyright © 2018 phat nguyen. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

class CalculatorView : UIView, UIScrollViewDelegate, CommandRouteDelegate {
	@IBOutlet weak var boundView: UIView!
	@IBOutlet weak var swapButton: UIButton!
	@IBOutlet weak var mathResult: NoActionTextField!
	@IBOutlet weak var calStatus: UILabel!
	@IBOutlet weak var viewTitle: UILabel!
	@IBOutlet weak var spreadsheetViewContainer: UIView!
	@IBOutlet weak var scrollViewContainer: UIScrollView!
	@IBOutlet weak var pageControl: UIPageControl!
	
	let totalPages = 2
	var stackSpreadSheet : [UIView] = {
		var stackOfView = [UIView]()
		let mathSpreadSheet = Bundle.main.loadNibNamed("CalculatorMathSpreadsheet", owner: self, options: nil)![0] as! CalculatorMathSpreadsheet
		let scientificSpreadSheet = Bundle.main.loadNibNamed("CalculatorScienceSpreadsheet", owner: self, options: nil)![0] as! CalculatorScienceSpreadsheet
		stackOfView.append(mathSpreadSheet)
		stackOfView.append(scientificSpreadSheet)
		return stackOfView
	}()
	
	override func willMove(toSuperview newSuperview: UIView?) {
		super.willMove(toSuperview: newSuperview)
		configureNoKeyBoardTextField()
	}
	
	override func didMoveToSuperview() {
		super.didMoveToSuperview()
		configureView()
		configureScrollView()
		configurePageControl()
	}
	
	@IBAction func swapAction(_ sender: UIButton) {
		
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
	}
	
	func configureView() {
		self.backgroundColor = UIColor(red:0,green:0,blue:0,alpha:0.0)
		boundView.backgroundColor = UIColor(red:0,green:0,blue:0,alpha:0.8)
		boundView.layer.masksToBounds = false
		CommandRoute.sharedInstance.delegate = self
	}
	
	func configureNoKeyBoardTextField() {
		mathResult.keyboardType = .numberPad
		mathResult.inputView = UIView()
		mathResult.becomeFirstResponder()
	}
	
	func configureScrollView() {
		scrollViewContainer.isPagingEnabled = true
		scrollViewContainer.showsHorizontalScrollIndicator = false
		scrollViewContainer.showsVerticalScrollIndicator = false
		scrollViewContainer.scrollsToTop = false
		scrollViewContainer.contentSize = CGSize(width: scrollViewContainer.frame.size.width * CGFloat(totalPages), height: scrollViewContainer.frame.size.height)
		scrollViewContainer.delegate = self
		for index in 0..<totalPages {
			let spreadsheet  = stackSpreadSheet[index]
			spreadsheet.frame = CGRect(x: CGFloat(index) * scrollViewContainer.frame.size.width,y: scrollViewContainer.frame.origin.y, width: scrollViewContainer.frame.size.width,height: scrollViewContainer.frame.size.height)
			scrollViewContainer.addSubview(spreadsheet)
		}
	}
	
	func configurePageControl() {
		pageControl.numberOfPages = totalPages
		pageControl.currentPage = 0
		pageControl.currentPageIndicatorTintColor = UIColor(hexString:"#ff9800")
	}
	
	// MARK: UIScrollViewDelegate method implementation
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		let currentPage = floor(scrollViewContainer.contentOffset.x / self.frame.size.width);
		pageControl.currentPage = Int(currentPage)
	}
	
	// MARK: IBAction method implementation
	
	@IBAction func changePage(_ sender: AnyObject) {
		var newFrame = scrollViewContainer.frame
		newFrame.origin.x = newFrame.size.width * CGFloat(pageControl.currentPage)
		scrollViewContainer.scrollRectToVisible(newFrame, animated: true)
	}
	
	func displayResult(_ resultString: String) {
		mathResult.text = resultString
	}
	
	func deleteBackWard() {
		mathResult.deleteBackward()
	}
	
	func getResultContext() -> String {
		return mathResult.text!
	}
	
	func radiansMode(_ radians: Bool) {
		if radians {
			calStatus.text = "R"
		}
		else {
			calStatus.text = "D"
		}
	}
	
}
