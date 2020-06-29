//
//  DiceViewController.swift
//  Dice Incomplete
//
//  Created by Julia Debecka on 29/06/2020.
//  Copyright © 2020 Julia Debecka. All rights reserved.
//

import UIKit

class DiceViewController: UIViewController {


	@IBOutlet weak var topDiceIV: UIImageView!
	@IBOutlet weak var bottomDiceIV: UIImageView!
	
	var fistDice: Int!
	var secondDice: Int!
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		if let firstImage = fistDice {
			topDiceIV.image = UIImage(named: "d\(firstImage)")
		}
		if let secondImage = secondDice {
			bottomDiceIV.image = UIImage(named: "d\(secondImage)")
		}
	}
	@IBAction func okTapped(_ sender: Any) {
		dismiss(animated: true, completion: nil)
	}
}
