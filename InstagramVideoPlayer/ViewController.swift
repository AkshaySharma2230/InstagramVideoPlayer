//
//  ViewController.swift
//  InstagramVideoPlayer
//
//  Created by Akshay Kumar on 28/04/23.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Cell Outlets
    @IBOutlet weak var videoTableView: UITableView!
    
    
    //MARK: Define Variable
    var heartValue: Bool = false
    
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Adding Delegate & DataSource of TableView
        videoTableView.delegate = self
        videoTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

}


//MARK: UITableView Delegate & DataSource Methods
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCellTVC") as? VideoCellTVC else {
            return UITableViewCell()
        }
        
        cell.videoPlayerView.layer.cornerRadius = 12
        cell.videoPlayerView.layer.masksToBounds = true
        
        let videoURLString = "https://test-videos.co.uk/vids/bigbuckbunny/mp4/h264/720/Big_Buck_Bunny_720_10s_5MB.mp4" // Enter video url here
        guard let videoURL = URL(string: videoURLString) else { return cell }
        cell.videoPlayerView.configure(with: videoURL)
        
        
        cell.heartBtn.tag = indexPath.row
        cell.heartBtn.addTarget(self, action: #selector(ViewController.heartBtnTappedAction(_:)), for: .touchUpInside)
        
        
        if heartValue == false {
            cell.heartImageView.image = UIImage(named: "heart")
        }
        else{
            cell.heartImageView.image = UIImage(named: "heart_fill")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var cell = tableView.cellForRow(at: indexPath)
        return UITableView.automaticDimension//cell?.frame.height ?? 450
    }
    
    
    @objc func heartBtnTappedAction(_ sender: UIButton){
        if heartValue == false {
            heartValue = true
        }
        else{
            heartValue = false
        }
        videoTableView.reloadData()
    }
}
