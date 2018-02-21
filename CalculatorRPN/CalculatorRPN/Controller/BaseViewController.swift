//
//  BaseViewController.swift
//  CalculatorRPN
//
//  Created by JackTheCode on 2/17/18.
//  Copyright © 2018 phat nguyen. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		let calculatorView = Bundle.main.loadNibNamed("BaseCalculatorView", owner: self, options: nil)![0] as! CalculatorView
		self.view.addSubview(calculatorView)
        // Do any additional setup after loading the view.
    }
	
	override func viewWillAppear(_ animated: Bool) {
		UIApplication.shared.statusBarStyle = .lightContent
		super.viewWillAppear(animated)
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
