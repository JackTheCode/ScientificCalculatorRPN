//
//  NoActionTextField.swift
//  rtCPMS
//
//  Created by phat nguyen on 12/26/17.
//  Copyright © 2017 RTA. All rights reserved.
//

import Foundation
import UIKit

class NoActionTextField: UITextField {
	override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
		if  action == #selector(copy(_:)) ||
			action == #selector(paste(_:)) ||
			action == #selector(select(_:)) ||
			action == #selector(selectAll(_:)) ||
			action == #selector(cut(_:)) ||
			action == Selector(("_share:"))
		{
			return false
		}
		return super.canPerformAction(action, withSender: sender)
	}
}
