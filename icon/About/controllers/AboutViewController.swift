//
//  AboutViewController.swift
//  icon
//
//  Created by WINMAC on 19/06/2023.
//

import UIKit

class AboutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var mainLblArr = [" About Icon", " Our Vision", " Our Mission", " Our Values", " Why Icon"]
    var downLblArr = ["labellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabel", "labellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabel", "labellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabel", "labellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabel", "labellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabellabel"]
    var SelectedIndex = -1
    var isCollapse = false
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = 240
        tableView.rowHeight = UITableView.automaticDimension
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return mainLblArr.count
    }

    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AboutTableViewCell

        cell.mainTxt.text = mainLblArr[indexPath.row]
        cell.downLabel.text = downLblArr[indexPath.row]

        return cell
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.SelectedIndex == indexPath.row && isCollapse == true {
            return 240
        } else {
            return 70
        }
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if SelectedIndex == indexPath.row {
            if self.isCollapse == false {
                self.isCollapse = true
                
            } else {
                self.isCollapse = false
            }
        } else {
            self.isCollapse = true
        }
        self.SelectedIndex = indexPath.row
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }

    
}
