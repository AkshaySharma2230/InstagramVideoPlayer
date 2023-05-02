//
//  VIdeoPlayerView.swift
//  InstagramVideoPlayer
//
//  Created by Akshay Kumar on 30/04/23.
//


import UIKit
import UIKit
import AVFoundation

class VideoPlayerView: UIView {
    // Properties
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    
    @IBOutlet private weak var contentButton: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPlayerLayer()
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupPlayerLayer()
        setupSubviews()
    }
    
    // Methods
    func configure(with videoURL: URL) {
        // Create an AVPlayerItem with the given video URL
        let playerItem = AVPlayerItem(url: videoURL)
        
        // Create an AVPlayer with the player item
        player = AVPlayer(playerItem: playerItem)
        
        // Create an AVPlayerLayer to display the video
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.frame = bounds
        playerLayer?.videoGravity = .resizeAspectFill
        
        // Add the player layer to the view's layer
        layer.addSublayer(playerLayer!)
        
        // Start playing the video
        player?.play()
        
        // Store a reference to the player layer so it can be updated later
        
    }
    
    
    private lazy var playPauseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "Play"), for: .normal)
        button.addTarget(self, action: #selector(playPauseButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    @objc private func playPauseButtonTapped() {
        if player?.timeControlStatus == .playing {
            player?.pause()
            playPauseButton.setImage(UIImage(systemName: "Play"), for: .normal)
        } else {
            player?.play()
            playPauseButton.setImage(UIImage(systemName: "pause"), for: .normal)
        }
    }
    
    private func setupPlayerLayer() {
        guard let playerLayer = playerLayer else { return }
        layer.addSublayer(playerLayer)
        playerLayer.videoGravity = .resizeAspectFill
        
        addSubview(playPauseButton)
        playPauseButton.center = center
        playPauseButton.layer.zPosition = 1
    }
    
    private func setupSubviews() {
        // Add the play/pause button as a subview of the video player view
        addSubview(playPauseButton)
        bringSubviewToFront(playPauseButton)
        
        // Set the button's frame to be centered in the video player view
        playPauseButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            playPauseButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            playPauseButton.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // Update the player layer frame to match the bounds of the view
        playerLayer?.frame = bounds
    }
    
    func pause() {
        player?.pause()
    }
    
    func resume() {
        player?.play()
    }
    
    func stop() {
        player?.pause()
        player?.seek(to: CMTime.zero)
    }
}
