//
//  VoiceRecorderViewController.swift
//  Pitch_Perfect
//
//  Created by Julia Debecka on 21/06/2020.
//  Copyright © 2020 Julia Debecka. All rights reserved.
//

import UIKit
import AVFoundation

//MARK: Constant IDs
let stoppedRecordingIdentifier = "stopRecording"
class VoiceRecorderViewController: UIViewController {
	
	//MARK: IBOutlets
	@IBOutlet weak var recordingLabel: UILabel!
	@IBOutlet weak var recordButton: UIButton!
	@IBOutlet weak var stopRecording: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	//MARK: Properties
	var audioRecorder: AVAudioRecorder!
	
	//MARK: Observable property
	var isRecording: Bool! {
		didSet {
			if isRecording {
				stopRecording.isEnabled = true
				recordButton.isEnabled = false
				recordingLabel.text = "Recording in progress"
				
				let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
				let recordingName = "recordedVoice.wav"
				let pathArray = [dirPath, recordingName]
				let filePath = URL(string: pathArray.joined(separator: "/"))
				
				let session = AVAudioSession.sharedInstance()
				try! session.setCategory(.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
				
				try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
				audioRecorder.delegate = self
				audioRecorder.isMeteringEnabled = true
				audioRecorder.prepareToRecord()
				audioRecorder.record()
			}else {
				recordingLabel.text = "Tap To Record"
				stopRecording.isEnabled = false
				recordButton.isEnabled = true
				
				audioRecorder.stop()
				let audioSession = AVAudioSession.sharedInstance()
				try! audioSession.setActive(false)
			}
		}
	}
	
	//MARK: IBActions for buttons
	@IBAction func recordTaapped(_ sender: Any) {
		isRecording = true
	}
	
	@IBAction func stopRecordingTapped(_ sender: Any) {
		isRecording = false
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier ==  stoppedRecordingIdentifier{
			let playSoundVC = segue.destination as! PlaySoundViewController
			let recordedAudioURL = sender as! URL
			playSoundVC.recordedAudioURL = recordedAudioURL
		}
	}
}

extension VoiceRecorderViewController: AVAudioRecorderDelegate {
	func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
		performSegue(withIdentifier: stoppedRecordingIdentifier, sender: audioRecorder.url)
	}
}
