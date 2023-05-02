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
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCellTVC") as? VideoCellTVC else {
            return UITableViewCell()
        }
        
        cell.videoPlayerView.layer.cornerRadius = 12
        cell.videoPlayerView.layer.masksToBounds = true
        //
        let videoURLString = "" // Enter video url here
        guard let videoURL = URL(string: videoURLString) else { return cell }
        cell.videoPlayerView.configure(with: videoURL)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
}
