//
//  VideoCellTVC.swift
//  InstagramVideoPlayer
//
//  Created by Akshay Kumar on 28/04/23.
//

import UIKit

class VideoCellTVC: UITableViewCell {

    //MARK: Cell Outlets
    @IBOutlet weak var videoPlayerCell: UIView!
    @IBOutlet weak var videoPlayerView: VideoPlayerView!
    
    
    //MARK: awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    //MARK: SetSelected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
