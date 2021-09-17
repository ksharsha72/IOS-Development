//
//  ViewController.swift
//  AudioRecorder
//
//  Created by Sriharsha on 20/08/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioRecorderDelegate,AVAudioPlayerDelegate {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet var controls: [UIButton]!
    
    var audioRecorder: AVAudioRecorder?
    
    var audioPlayer : AVAudioPlayer?
    
    var recordSetting = [String:Any]()
    
    var timer: Timer?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in controls
        {
            button.layer.cornerRadius = 35
            button.layer.borderWidth = 5
            button.layer.borderColor = UIColor.black.cgColor
            button.clipsToBounds = true
        }
        // Do any additional setup after loading the view.
        titleLabel.text = UserDefaults.standard.object(forKey: "Title") as? String ?? ""
        
        progressView.progress = 0
        recordSetting = [AVEncoderAudioQualityKey:AVAudioQuality.min.rawValue,AVEncoderBitRateKey:16,AVNumberOfChannelsKey:2,AVSampleRateKey:44100.0]
        
        let audioSession = AVAudioSession.sharedInstance()
        
        try? audioSession.setCategory(AVAudioSession.Category.playAndRecord)
        try? audioSession.overrideOutputAudioPort(.speaker)
    }

    @IBAction func play(_ sender: Any) {
        
        if audioRecorder?.isRecording == true
        {
            audioRecorder?.stop()
        }
        
        try? audioPlayer = AVAudioPlayer(contentsOf: getPath())
        audioPlayer?.delegate = self
        audioPlayer?.prepareToPlay()
        audioPlayer?.play()
        
        progressView.progress = 0
        startTimer()
    }
    
    func getPath() -> URL
    {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        let directory = path[0]
        
        let soundPath = directory.appendingPathComponent("sound.caf")
        
        return soundPath
    }
    
    
    @IBAction func record(_ sender: Any)
    {
        let alert = UIAlertController(title: "Recording Title", message: "Please Enter a name for recording", preferredStyle: .alert)
        
        alert.addTextField {(nameTextfield: UITextField) in
        nameTextfield.textAlignment = .center
            nameTextfield.placeholder = "Reading name"
             nameTextfield.keyboardAppearance = UIKeyboardAppearance.dark
        }
        
        let OkAction = UIAlertAction(title: "Ok", style: .default, handler: {(action:UIAlertAction!)-> Void in
            
            let textfield = alert.textFields![0] as UITextField
            
            self.titleLabel.text = textfield.text
            UserDefaults.standard.setValue(textfield.text, forKey: "Title")
            
            try? self.audioRecorder =  AVAudioRecorder(url: self.getPath(), settings: self.recordSetting)
            
            self.audioRecorder?.delegate = self
            
            self.audioRecorder?.prepareToRecord()
            self.progressView.progress = 0
            
            self.audioRecorder?.record()
            
            self.startTimer()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        alert.addAction(cancelAction)
        alert.addAction(OkAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print(recorder.url)
        print(flag)
        if timer != nil
        {
            timer?.invalidate()
            timer = nil
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        if timer != nil
        {
            timer?.invalidate()
            timer = nil
        }
    }
    
    @IBAction func stop(_ sender: Any) {
        
        if audioRecorder?.isRecording == true
        {
            audioRecorder?.stop()
        }
        else{
            audioPlayer?.stop()
        }
        
        if timer != nil
        {
            timer?.invalidate()
            timer = nil
        }
    }
    
    func startTimer()
    {
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.increaseProgress), userInfo: nil, repeats: true)
    }
    
    @objc func increaseProgress()
    {
        progressView.progress = progressView.progress + 0.1
        timerLabel.text = "\(Int(progressView.progress * 10))s"
    }
    
    
}

