//
//  PlaySoundViewController.swift
//  Pitch_Perfect
//
//  Created by Julia Debecka on 28/06/2020.
//  Copyright © 2020 Julia Debecka. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {

	var recordedAudioURL: URL!
	@IBOutlet weak var slowButton: UIButton!
	@IBOutlet weak var fastButton: UIButton!
	@IBOutlet weak var highButton: UIButton!
	@IBOutlet weak var lowButton: UIButton!
	@IBOutlet weak var echoButton: UIButton!
	@IBOutlet weak var reverbButton: UIButton!
	@IBOutlet weak var stopButton: UIButton!
	
	var audioFile:AVAudioFile!
	var audioEngine:AVAudioEngine!
	var audioPlayerNode: AVAudioPlayerNode!
	var stopTimer: Timer!

	enum ButtonType: Int {
		case slow = 0, fast, chipmunk, vader, echo, reverb
	}
	
	override func viewWillAppear(_ animated: Bool) {
		configureUI(.notPlaying)
	}
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setupAudio()
        // Do any additional setup after loading the view.
    }
	
	
	
	@IBAction func playSoundForButton(_ sender: UIButton) {
		switch(ButtonType(rawValue: sender.tag)!) {
		case .slow:
			playSound(rate: 0.5)
		case .fast:
			playSound(rate: 1.5)
		case .chipmunk:
			playSound(pitch: 1000)
		case .vader:
			playSound(pitch: -1000)
		case .echo:
			playSound(echo: true)
		case .reverb:
			playSound(reverb: true)
		}

		configureUI(.playing)
	}
	@IBAction func stopTapped(_ sender: Any) {
		stopAudio()
	}
}
