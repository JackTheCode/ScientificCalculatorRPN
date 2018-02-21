//
//  CalculatorScienceSpreadsheet.swift
//  CalculatorRPN
//
//  Created by JackTheCode on 2/17/18.
//  Copyright © 2018 phat nguyen. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

class CalculatorScienceSpreadsheet: UIView,UICollectionViewDataSource,UICollectionViewDelegate,RAReorderableLayoutDelegate,RAReorderableLayoutDataSource,CommandRouteUIDelegate {

	@IBOutlet weak var collect_spreadsheet: UICollectionView!
	
	var twoNdModeEnabled : Bool = false
	var radiansMode : Bool = false
	
	override func didMoveToSuperview() {
		super.didMoveToSuperview()
		configureView()
	}
	
	func configureView() {
		collect_spreadsheet.register(UINib.init(nibName: "ScientificCell", bundle: nil), forCellWithReuseIdentifier: "ScientificCell")
		collect_spreadsheet.dataSource = self
		collect_spreadsheet.delegate = self
		collect_spreadsheet.showsVerticalScrollIndicator = false
		collect_spreadsheet.bounces = false
		CommandRoute.sharedInstance.delegateUI = self
	}
	
	//MARK - Collection View Delegate
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return CalculatorButton.getScientificButtonsList().count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell : ScientificCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScientificCell", for: indexPath) as! ScientificCell
		let button = CalculatorButton.getScientificButtonsList()[indexPath.item]
		switch button.type {
		case .DEG:
			if radiansMode {
				cell.singleLabel.text           = button.titleStr
			} else {
				cell.singleLabel.text 			= CalculatorConstant.RAD
			}
			cell.singleLabel.textColor          = UIColor.white
			break
		case .TWOPOWND:
			cell.singleLabel.attributedText     = button.titleAttr
			cell.singleLabel.textColor          = twoNdModeEnabled ? UIColor.primaryColor : UIColor.white
			break
		case .LEFT_BRACKET:
			cell.singleLabel.text               = button.titleStr
			cell.singleLabel.textColor          = UIColor.white
			break
		case .RIGHT_BRACKET:
			cell.singleLabel.text               = button.titleStr
			cell.singleLabel.textColor          = UIColor.white
			break
		case .SIN:
			if !twoNdModeEnabled {
				cell.singleLabel.text           = button.titleStr
			} else {
				cell.singleLabel.attributedText = CalculatorButton.getTwoNdButtonsList()[0].titleAttr
			}
			cell.singleLabel.textColor          = UIColor.white
			break
		case .COS:
			if !twoNdModeEnabled {
				cell.singleLabel.text           = button.titleStr
			} else {
				cell.singleLabel.attributedText = CalculatorButton.getTwoNdButtonsList()[1].titleAttr
			}
			cell.singleLabel.textColor          = UIColor.white
			break
		case .TAN:
			
			if !twoNdModeEnabled {
				cell.singleLabel.text           = button.titleStr
			} else {
				cell.singleLabel.attributedText = CalculatorButton.getTwoNdButtonsList()[2].titleAttr
			}
			cell.singleLabel.textColor          = UIColor.white
			break
		case .EPOWX:
			if !twoNdModeEnabled {
				cell.singleLabel.attributedText = button.titleAttr
			} else {
				cell.singleLabel.attributedText = CalculatorButton.getTwoNdButtonsList()[3].titleAttr
			}
			cell.singleLabel.textColor          = UIColor.white
			break
		case .LN:
			if !twoNdModeEnabled {
				cell.singleLabel.text           = button.titleStr
			} else {
				cell.singleLabel.attributedText = CalculatorButton.getTwoNdButtonsList()[4].titleAttr
			}
			cell.singleLabel.textColor          = UIColor.white
			break
		case .TENPOWX:
			if !twoNdModeEnabled {
				cell.singleLabel.attributedText = button.titleAttr
			} else {
				cell.singleLabel.attributedText = CalculatorButton.getTwoNdButtonsList()[5].titleAttr
			}
			cell.singleLabel.textColor          = UIColor.white
			break
		case .LOG_TEN:
			if !twoNdModeEnabled {
				cell.singleLabel.attributedText = button.titleAttr
			} else {
				cell.singleLabel.attributedText = CalculatorButton.getTwoNdButtonsList()[6].titleAttr
			}
			cell.singleLabel.textColor          = UIColor.white
			break
		case .FACTORIAL:
			cell.singleLabel.text               = button.titleStr
			cell.singleLabel.textColor          = UIColor.white
			break
		case .XPOWTWO:
			cell.singleLabel.attributedText     = button.titleAttr
			cell.singleLabel.textColor          = UIColor.white
			break
		case .XPOWTHREE:
			cell.singleLabel.attributedText     = button.titleAttr
			cell.singleLabel.textColor          = UIColor.white
			break
		case .XPOWY:
			cell.singleLabel.attributedText     = button.titleAttr
			cell.singleLabel.textColor          = UIColor.white
			break
		case .PI:
			cell.singleLabel.text               = button.titleStr
			cell.singleLabel.textColor          = UIColor.white
			break
		case .TWO_SQUARE_ROOT:
			cell.singleLabel.attributedText     = button.titleAttr
			cell.singleLabel.textColor          = UIColor.white
			break
		case .THREE_SQUARE_ROOT:
			cell.singleLabel.attributedText     = button.titleAttr
			cell.singleLabel.textColor          = UIColor.white
			break
		case .XY_SQUARE_ROOT:
			cell.singleLabel.attributedText     = button.titleAttr
			cell.singleLabel.textColor          = UIColor.white
			break
		case .E:
			cell.singleLabel.text               = button.titleStr
			cell.singleLabel.textColor          = UIColor.white
			break
		default: break
		}
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let cell : ScientificCell = collectionView.cellForItem(at: indexPath) as! ScientificCell
		let backgroundView = UIView(frame: CGRect.zero)
		self.loadActionButton(CalculatorButton.getScientificButtonsList()[indexPath.item])
		UIView.animate(withDuration: 0.2,delay: 0, options: UIViewAnimationOptions.beginFromCurrentState, animations: { () -> Void in
			backgroundView.backgroundColor = UIColor.primaryColor
			cell.selectedBackgroundView = backgroundView
		}, completion: { (success:Bool) -> Void in
			backgroundView.backgroundColor = UIColor.clear
			cell.selectedBackgroundView = backgroundView
		})
	}
	
	func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
		
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}
	
	func scrollTrigerPaddingInCollectionView(_ collectionView: UICollectionView) -> UIEdgeInsets {
		return UIEdgeInsetsMake(collectionView.contentInset.top, 0, collectionView.contentInset.bottom, 0)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsetsMake(0, 0, 0, 0)
	}
	
	func collectionView(_ collectionView: UICollectionView, allowMoveAt indexPath: IndexPath) -> Bool {
		return false
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
		UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
		let totalSpace = flowLayout.sectionInset.left
			+ flowLayout.sectionInset.right
			+ (flowLayout.minimumInteritemSpacing * CGFloat(4 - 1))
		let sizeVertical = (collectionView.bounds.size.width - totalSpace) / CGFloat(4)
		let sizeHorizontal = (collectionView.bounds.size.width - totalSpace) / CGFloat(5)
		return CGSize(width: sizeVertical,height: sizeHorizontal)
	}
	
	func needRefreshLayout(_ need: Bool) {
		DispatchQueue.main.async {
			self.twoNdModeEnabled = need
			self.collect_spreadsheet.reloadData()
		}
	}
	
	func needChangeRadiansTitle(_ need: Bool) {
		DispatchQueue.main.async {
			self.radiansMode = need
			self.collect_spreadsheet.reloadData()
		}
	}
	
	func loadActionButton(_ button: CalculatorButton) {
		switch button.type {
		case .DEG :
			CommandRoute.sharedInstance.commandButtonAction(button.titleStr)
			break
		case .TWOPOWND :
			CommandRoute.sharedInstance.commandButtonAction(button.titleStr)
			break
		case .LEFT_BRACKET :
			CommandRoute.sharedInstance.commandButtonAction(button.titleStr)
			break
		case .RIGHT_BRACKET :
			CommandRoute.sharedInstance.commandButtonAction(button.titleStr)
			break
		case .SIN :
			if !twoNdModeEnabled {
				CommandRoute.sharedInstance.buttonSingleAction(button.titleStr)
			} else {
				CommandRoute.sharedInstance.buttonSingleAction(CalculatorButton.getTwoNdButtonsList()[0].titleStr)
			}
			break
		case .COS :
			if !twoNdModeEnabled {
				CommandRoute.sharedInstance.buttonSingleAction(button.titleStr)
			} else {
				CommandRoute.sharedInstance.buttonSingleAction(CalculatorButton.getTwoNdButtonsList()[1].titleStr)
			}
			break
		case .TAN :
			if !twoNdModeEnabled {
				CommandRoute.sharedInstance.buttonSingleAction(button.titleStr)
			} else {
				CommandRoute.sharedInstance.buttonSingleAction(CalculatorButton.getTwoNdButtonsList()[2].titleStr)
			}
			break
		case .EPOWX :
			if !twoNdModeEnabled {
				CommandRoute.sharedInstance.buttonSingleAction(button.titleStr)
			} else {
				CommandRoute.sharedInstance.commandButtonAction(CalculatorButton.getTwoNdButtonsList()[3].titleStr)
			}
			break
		case .LN :
			if !twoNdModeEnabled {
				CommandRoute.sharedInstance.buttonSingleAction(button.titleStr)
			} else {
				CommandRoute.sharedInstance.commandButtonAction(CalculatorButton.getTwoNdButtonsList()[4].titleStr)
			}
			break
		case .TENPOWX :
			if !twoNdModeEnabled {
				CommandRoute.sharedInstance.buttonSingleAction(button.titleStr)
			} else {
				CommandRoute.sharedInstance.buttonSingleAction(CalculatorButton.getTwoNdButtonsList()[5].titleStr)
			}
			break
		case .LOG_TEN:
			if !twoNdModeEnabled {
				CommandRoute.sharedInstance.buttonSingleAction(button.titleStr)
			} else {
				CommandRoute.sharedInstance.buttonSingleAction(CalculatorButton.getTwoNdButtonsList()[6].titleStr)
			}
			break
		case .FACTORIAL :
			CommandRoute.sharedInstance.buttonSingleAction(button.titleStr)
			break
		case .XPOWTWO :
			CommandRoute.sharedInstance.buttonSingleAction(button.titleStr)
			break
		case .XPOWTHREE :
			CommandRoute.sharedInstance.buttonSingleAction(button.titleStr)
			break
		case .XPOWY :
			CommandRoute.sharedInstance.commandButtonAction(button.titleStr)
			break
		case .PI :
			CommandRoute.sharedInstance.commandButtonAction(button.titleStr)
			break
		case .TWO_SQUARE_ROOT :
			CommandRoute.sharedInstance.buttonSingleAction(button.titleStr)
			break
		case .THREE_SQUARE_ROOT :
			CommandRoute.sharedInstance.buttonSingleAction(button.titleStr)
			break
		case .XY_SQUARE_ROOT :
			CommandRoute.sharedInstance.commandButtonAction(button.titleStr)
			break
		case .E :
			CommandRoute.sharedInstance.commandButtonAction(button.titleStr)
			break
		default : break
		}
	}
	
}
