//
//  ViewController.swift
//  Dice Incomplete
//
//  Created by Julia Debecka on 29/06/2020.
//  Copyright © 2020 Julia Debecka. All rights reserved.
//

import UIKit

class RollViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}

	@IBAction func rollDiceTapped(_ sender: Any) {
		let diceVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "diceVC") as! DiceViewController
		diceVC.fistDice = getRandom()
		diceVC.secondDice = getRandom()
		
		present(diceVC, animated: true, completion: nil)
	}
	
	func getRandom() -> Int {
		return Int.random(in: 1...6)
	}
}

