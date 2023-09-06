//
//  MoreViewController.swift
//  icon
//
//  Created by WINMAC on 11/06/2023.
//

import UIKit
import SafariServices
class MoreViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        switch indexPath.row {
        case 0 :
            cell.textLabel?.text = "Credit score"
            cell.imageView?.image = UIImage(systemName: "list.bullet.rectangle")
            
        case 1 :
            cell.textLabel?.text = "My profile"
            cell.imageView?.image = UIImage(systemName: "person")
            
        case 2 :
            cell.textLabel?.text = "About"
            cell.imageView?.image = UIImage(systemName:  "exclamationmark.circle")
            
        case 3 :
            cell.textLabel?.text = "Book online consultation"
            cell.imageView?.image = UIImage(systemName: "list.bullet.clipboard")
            
        case 4 :
            cell.textLabel?.text = "Our Partners"
            cell.imageView?.image = UIImage(systemName: "person.line.dotted.person")
            
        case 5 :
            cell.textLabel?.text = "Latest News"
            cell.imageView?.image = UIImage(systemName: "newspaper")
            
        case 6 :
            cell.textLabel?.text = "Payments"
            cell.imageView?.image = UIImage(systemName: "creditcard")
            
        case 7 :
            cell.textLabel?.text = "Our team"
            cell.imageView?.image = UIImage(systemName: "person.3.sequence")
            
        case 8 :
            cell.textLabel?.text = "Available Jobs"
            cell.imageView?.image = UIImage(systemName: "magnifyingglass")
            
        case 9 :
            cell.textLabel?.text = "Notifications"
            cell.imageView?.image = UIImage(systemName: "bell")
            
        case 10 :
            
            cell.textLabel?.text = "Settings"
            cell.imageView?.image = UIImage(systemName:  "gearshape")
            
        case 11 :
            cell.textLabel?.text = "Rate App"
            cell.imageView?.image = UIImage(systemName:  "star")
            
        case 12 :
            cell.textLabel?.text = "Share App"
            cell.imageView?.image = UIImage(systemName:  "link")
            
        case 13 :
            cell.textLabel?.text = "Contact Us"
            cell.imageView?.image = UIImage(systemName:  "phone")
            
        case 14 :
            cell.textLabel?.text = "Sign out"
            cell.imageView?.image = UIImage(systemName:  "door.left.hand.open")
            
        default:
            break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0 :
            if let url = URL(string: "https://www.google.com") {
                let svc = SFSafariViewController(url: url)
                self.present(svc, animated: true)
            }
            
        case 1 :
            
            let vc = (self.storyboard?.instantiateViewController(withIdentifier: "MyProfileViewController") as? MyProfileViewController)!
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 2 :
            let vc = (self.storyboard?.instantiateViewController(withIdentifier: "AboutViewController") as? AboutViewController)!
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 3 :
            let alert = UIAlertController(title: "Meeting request", message: "Sure you want to schedule meeting with us ?!", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Yes confirm", style: .default){(_) in
                
                let second = UIAlertController(title: "Meeting request", message: "we will contact you as soon as possible to alarm you with meeting time", preferredStyle: .alert)
                
                let okAction = UIAlertAction(title: "OKEY", style: .default)
                second.addAction(okAction)
                self.present(second, animated: true)
                
            })
            present(alert, animated: true)
            
        case 4 :
            let vc = (self.storyboard?.instantiateViewController(withIdentifier: "OurPartnersCollectionViewController") as? OurPartnersCollectionViewController)!
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 5 :
            let vc = (self.storyboard?.instantiateViewController(withIdentifier: "LatestNewsTableViewController") as? LatestNewsTableViewController)!
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 6 :
            let vc = (self.storyboard?.instantiateViewController(withIdentifier: "paymentViewController") )!
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 7 :
            let vc = (self.storyboard?.instantiateViewController(withIdentifier: "OurTeamCollectionViewController") as? OurTeamCollectionViewController)!
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 8 :
            let vc = (self.storyboard?.instantiateViewController(withIdentifier: "AvailableJobsTableViewController") as? AvailableJobsTableViewController)!
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 9 :
            let vc = (self.storyboard?.instantiateViewController(withIdentifier: "NotificationsTableViewController") as? NotificationsTableViewController)!
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 10 :
            
            let vc = (self.storyboard?.instantiateViewController(withIdentifier: "settingsViewController") as? settingsViewController)!
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 11 :
            
            if let url = URL(string: "https://www.google.com") {
                let svc = SFSafariViewController(url: url)
                self.present(svc, animated: true)
            }
            
        case 12 :
            DispatchQueue.main.async {
                guard let url = URL(string: "https://www.google.com") else {
                    return
                }

                let shareSheetVC = UIActivityViewController(activityItems: [url], applicationActivities: nil)

                self.present(shareSheetVC, animated: true)
            }
            
        case 13 :
            let vc = (self.storyboard?.instantiateViewController(withIdentifier: "ContactViewController") as? ContactViewController)!
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 14 :
            let vc = (self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController)!
            self.navigationController?.pushViewController(vc, animated: true)
            
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    

    

}
