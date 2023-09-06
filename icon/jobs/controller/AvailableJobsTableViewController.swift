//
//  AvailableJobsTableViewController.swift
//  icon
//
//  Created by WINMAC on 18/06/2023.
//

import UIKit

class AvailableJobsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "AvailableJobsTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "cell")
        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AvailableJobsTableViewCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = (self.storyboard?.instantiateViewController(withIdentifier: "JobDetailsViewController") as? JobDetailsViewController)!
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
