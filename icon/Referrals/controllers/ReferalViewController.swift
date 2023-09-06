//
//  ReferalViewController.swift
//  icon
//
//  Created by WINMAC on 11/06/2023.
//

import UIKit

class ReferalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib = UINib(nibName: "ReferalTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "cell")
       
        
    }
    
    @IBAction func didTappAddReferal(_ sender: Any) {
        let vc = (self.storyboard?.instantiateViewController(withIdentifier: "AddReferalViewController"))!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    //MARK: - Tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ReferalTableViewCell
        //cell.configure()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    

    

}
