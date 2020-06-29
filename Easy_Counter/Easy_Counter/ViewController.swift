//
//  ViewController.swift
//  Easy_Counter
//
//  Created by Julia Debecka on 29/06/2020.
//  Copyright © 2020 Julia Debecka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	enum SwichType: Int {
		case red = 0, green, blue
	}
	@IBOutlet weak var redSlide: UISlider!
	@IBOutlet weak var greenSlide: UISlider!
	@IBOutlet weak var blueSlide: UISlider!
	@IBOutlet weak var colorView: UIView!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		colorView.layer.borderColor = UIColor.white.cgColor
		colorView.layer.borderWidth = 2.0
		colorView.backgroundColor = .black
	}
	
	@IBAction func colorChanged(_ sender: Any) {
		let r: CGFloat = CGFloat(self.redSlide.value)
		let b: CGFloat = CGFloat(self.blueSlide.value)
		let g: CGFloat = CGFloat(self.greenSlide.value)
		
		colorView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1.0)
	}
	

	
	
	//MARK: View from code
//	var count = 0
//	var label: UILabel!
//	var button: UIButton!
//
//	override func viewDidLoad() {
//		super.viewDidLoad()
//
//		label = UILabel()
//		label.frame = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY - 200, width: 60, height: 60)
//
//		label.text = "\(self.count)"
//		view.addSubview(label)
//
//		button = UIButton()
//		button.frame = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY - 100, width: 60, height: 60)
//		button.setTitle("Click", for: .normal)
//		button.setTitleColor(.black, for: .selected)
//		button.setTitleColor(.blue, for: .normal)
//		view.addSubview(button)
//
//		button.addTarget(self, action: #selector(ViewController.incrementCount), for: .touchUpInside)
//		// Do any additional setup after loading the view.
//	}
//
//	@objc func incrementCount() {
//		self.count += 1
//		setLabel()
//	}
//
//	func setLabel() {
//		self.label.text = "\(self.count)"
//	}

}
