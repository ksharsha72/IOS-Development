//
//  ViewController.swift
//  VideoArchive
//
//  Created by Sriharsha on 20/08/21.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var videoArray = [String]()

    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var videoTableView: UITableView!
    
    let videoVC = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        videoTableView.backgroundColor = .black
        
        videoTableView.delegate = self
        videoTableView.dataSource = self
        
        videoView.addSubview(videoVC.view)
        videoVC.view.frame = videoView.frame
        
        
        let filemanager = FileManager.default
        let path = Bundle.main.resourcePath
        
        let allItems = try? filemanager.contentsOfDirectory(atPath: path ?? "")
        
        for singleItem in allItems!
        {
            if singleItem.hasSuffix(".mp4")
            {
                videoArray.append(singleItem)
            }
        }
        
        
        if videoArray.count>0
        {
           playtopVideo(value: 0)
        }
    }
    
    func playtopVideo(value:Int)
    {
        let nameComponent = videoArray[value].components(separatedBy: ".")
        let name = nameComponent[0]
        
        let path = Bundle.main.path(forResource: name, ofType: "mp4")
        let url = URL(fileURLWithPath: path!)
//        videoVC.showsPlaybackControls = false
        videoVC.player = AVPlayer(url: url)
//
//        videoView.addSubview(videoVC.view)
//        videoVC.view.frame = videoView.frame
        
        videoVC.player?.play()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "Play Video", message: "ow do you want to play this video", preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: "Play at the top", style: .default) {(action) in
            
            self.playtopVideo(value: indexPath.row)
            
            
        }
        
        let action2 = UIAlertAction(title: "Play in FULL Screen", style: .default) {(action) in
            
            let playerVC = self.storyboard?.instantiateViewController(identifier: "player") as! AVPlayerViewController
           
            let videoName = self.videoArray[indexPath.row]
           let nameComponents = videoName.components(separatedBy: ".")
           
           let path = Bundle.main.path(forResource: nameComponents[0], ofType: "mp4")
           
           if let path = path
           {
               let url  = URL(fileURLWithPath: path)
               playerVC.player = AVPlayer(url: url)
               playerVC.player?.play()
           }
           
            self.present(playerVC, animated: true)
            
        }
        
        let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(cancel)
        
        present(alert, animated: true)
       /*
         let playerVC = storyboard?.instantiateViewController(identifier: "player") as! AVPlayerViewController
        
        let videoName = videoArray[indexPath.row]
        let nameComponents = videoName.components(separatedBy: ".")
        
        let path = Bundle.main.path(forResource: nameComponents[0], ofType: "mp4")
        
        if let path = path
        {
            let url  = URL(fileURLWithPath: path)
            playerVC.player = AVPlayer(url: url)
            playerVC.player?.play()
        }
        
        present(playerVC, animated: true)
         */
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "videoCell", for: indexPath)
        
        let videoName = videoArray[indexPath.row]
        let nameComponents = videoName.components(separatedBy: "-")
        cell.textLabel?.text = nameComponents[0]
        cell.textLabel?.textColor = .yellow
        cell.backgroundColor = .black
        cell.textLabel?.font = UIFont(name: "Futura-Medium", size: 30)
        
        cell.imageView?.image = UIImage(named: "play-button")
        cell.imageView?.contentMode = .scaleAspectFit
        
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        videoArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let labelView = UILabel(frame: CGRect(x: tableView.frame.origin.x, y: tableView.frame.origin.y, width: tableView.frame.size.width, height: 50))
        
        labelView.text = "My Video Archive"
        labelView.textAlignment = .center
        labelView.textColor = .yellow
        labelView.font = UIFont(name: "Futura-Bold", size: 32)
        return labelView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    


}

