//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Maher Al-Bunni on 4/16/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var model = Model()
    var videos = [Video]()
    	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Set itself as the data source and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        model.delegate = self
        
        model.getVideos()
    }
    // MARK: - Model Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        // Set the returned videos to our video property
        self.videos = videos
        // Refresh the table view
        tableView.reloadData()
    }
    
    
    // MARK: - TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        // Configure the cell with the data
        let title = self.videos[indexPath.row].title
        
        cell.textLabel?.text = title
        // Return The Cell
        return cell
    }
}

