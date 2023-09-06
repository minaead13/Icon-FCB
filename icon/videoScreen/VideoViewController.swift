//
//  VideoViewController.swift
//  icon
//
//  Created by WINMAC on 10/06/2023.
//

import UIKit
import Lottie
import AVFoundation
import AVKit
class VideoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playVideo()
        goToSign()
    }
    func playVideo(){
        guard let path = Bundle.main.path(forResource: "video2", ofType: "mp4") else {
            print("is not found")
            return
        }
        let player = AVPlayer.init(url: URL(filePath: path))

        var playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        playerLayer.videoGravity = .resizeAspect
        self.view.layer.addSublayer(playerLayer)
        player.play()
    }
    
    func goToSign(){
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(10)) {
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController else {
                return
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    

}
