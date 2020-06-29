//
//  ViewController.swift
//  Image_Picker
//
//  Created by Julia Debecka on 29/06/2020.
//  Copyright © 2020 Julia Debecka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
	@IBAction func chooseImageTapped(_ sender: Any) {
		let imagePicker = UIImagePickerController()
		present(imagePicker, animated: true, completion: nil)
	}
	

}

