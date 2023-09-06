//
//  MyRequestViewController.swift
//  icon
//
//  Created by WINMAC on 11/06/2023.
//

import UIKit
import KRProgressHUD

class MyRequestViewController: UIViewController {
    
    @IBOutlet weak var tableVieww: UITableView!
    var reqArray : [MyRequests]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRequests()
        let cellNib = UINib(nibName: "MyReqsTableViewCell", bundle: nil)
        tableVieww.register(cellNib, forCellReuseIdentifier: "cell")
        tableVieww.frame = view.bounds
        
    }
}

extension MyRequestViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (reqArray?.count).orEmpty
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyReqsTableViewCell
        if let item = reqArray?[indexPath.row] {
            cell.setUp(model: item)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}

extension MyRequestViewController{
    
    func getRequests() {
        print(Endpoints.home)
        KRProgressHUD.show()
        NetworkManager.instance.request(Endpoints.myReqs, parameters: nil, method: .get, type: [MyRequests].self, viewController: self, api_response: { [unowned self] (data) in
            DispatchQueue.main.async {
                KRProgressHUD.dismiss()
                self.success(data: data)
                
            }
            
        })
    }
    
    
    
    private func success(data: BaseModel<[MyRequests]>?) {
        reqArray = data?.data
        tableVieww.reloadData()
        
        
    }
}
