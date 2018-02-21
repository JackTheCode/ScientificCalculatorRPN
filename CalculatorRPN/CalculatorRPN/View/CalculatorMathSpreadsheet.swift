//
//  CalculatorMathSpreadsheet.swift
//  CalculatorRPN
//
//  Created by JackTheCode on 2/17/18.
//  Copyright © 2018 phat nguyen. All rights reserved.
//

import Foundation
import UIKit
import CoreGraphics

class CalculatorMathSpreadsheet : UIView,UICollectionViewDataSource,UICollectionViewDelegate,RAReorderableLayoutDelegate,RAReorderableLayoutDataSource {
	
	@IBOutlet weak var collect_spreadsheet : UICollectionView!
	
	override func didMoveToSuperview() {
		super.didMoveToSuperview()
		configureView()
	}
	
	func configureView() {
		collect_spreadsheet.register(UINib.init(nibName: "MathCell", bundle: nil), forCellWithReuseIdentifier: "MathCell")
		collect_spreadsheet.dataSource = self
		collect_spreadsheet.delegate = self
		collect_spreadsheet.showsVerticalScrollIndicator = false
		collect_spreadsheet.bounces = false
	}
	
	//MARK - Collection View Delegate
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return CalculatorButton.getMathButtonsList().count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell : MathCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MathCell", for: indexPath) as! MathCell
		if indexPath.item == 3 {
			let delImgView = UIImageView(frame: CGRect(x: 0,y: 0,width: cell.frame.size.width,height: cell.frame.size.height))
			delImgView.image = UIImage(named: CalculatorButton.getMathButtonsList()[indexPath.item].titleStr)
			delImgView.contentMode = .center
			cell.contentView.addSubview(delImgView)
			cell.contentView.contentMode = .center
			cell.singleLabel.isHidden = true
		}
		else {
			cell.singleLabel.isHidden = false
			cell.singleLabel.text = CalculatorButton.getMathButtonsList()[indexPath.item].titleStr
		}
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let cell : MathCell = collectionView.cellForItem(at: indexPath) as! MathCell
		let backgroundView = UIView(frame: CGRect.zero)
		self.loadActionButton(CalculatorButton.getMathButtonsList()[indexPath.item])
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
	
	func loadActionButton(_ button: CalculatorButton) {
		switch button.type {
		case .AC :
			CommandRoute.sharedInstance.commandButtonAction(button.titleStr)
			break
		case .NEGATIVE_NUMBER :
			CommandRoute.sharedInstance.commandButtonAction(button.titleStr)
			break
		case .PERCENT :
			CommandRoute.sharedInstance.commandButtonAction(button.titleStr)
			break
		case .DELETE :
			CommandRoute.sharedInstance.commandButtonAction(button.titleStr)
			break
		case .SEVEN :
			CommandRoute.sharedInstance.numberButtonAction(button.titleStr)
			break
		case .EIGHT :
			CommandRoute.sharedInstance.numberButtonAction(button.titleStr)
			break
		case .NINE :
			CommandRoute.sharedInstance.numberButtonAction(button.titleStr)
			break
		case .DIVIDE :
			CommandRoute.sharedInstance.commandButtonAction(button.titleStr)
			break
		case .FOUR :
			CommandRoute.sharedInstance.numberButtonAction(button.titleStr)
			break
		case .FIVE :
			CommandRoute.sharedInstance.numberButtonAction(button.titleStr)
			break
		case .SIX :
			CommandRoute.sharedInstance.numberButtonAction(button.titleStr)
			break
		case .MULTIPLY :
			CommandRoute.sharedInstance.commandButtonAction(button.titleStr)
			break
		case .ONE :
			CommandRoute.sharedInstance.numberButtonAction(button.titleStr)
			break
		case .TWO :
			CommandRoute.sharedInstance.numberButtonAction(button.titleStr)
			break
		case .THREE :
			CommandRoute.sharedInstance.numberButtonAction(button.titleStr)
			break
		case .MINUS :
			CommandRoute.sharedInstance.commandButtonAction(button.titleStr)
			break
		case .ZERO :
			CommandRoute.sharedInstance.numberButtonAction(button.titleStr)
			break
		case .COMMA :
			CommandRoute.sharedInstance.commandButtonAction(button.titleStr)
			break
		case .EQUAL :
			CommandRoute.sharedInstance.commandButtonAction(button.titleStr)
			break
		case .PLUS :
			CommandRoute.sharedInstance.commandButtonAction(button.titleStr)
			break
		default: break
		}
	}
	
}
