//
//  HomeViewController.swift
//  icon
//
//  Created by WINMAC on 11/06/2023.
//

import UIKit
import Alamofire
import KRProgressHUD

class HomeViewController: UIViewController, UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    @IBOutlet weak var onlineCollectionView: UICollectionView!
    @IBOutlet weak var OurServicesCollectionView: UICollectionView!
    @IBOutlet weak var offersCollectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var clientImage: UIImageView!
    
   
    var timer : Timer?
    var currentCellIndex = 0
    private var isGoingForward = true
    
    private var adsArray : [adsData]?
    private var servicesArray   : [iconData]?
    private var offersArray  : [iconData]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        getHomeCollection()
        startTimer()
         pageController.numberOfPages = adsArray?.count ?? 1
        let cellNib = UINib(nibName: "OurServicesCollectionViewCell", bundle: nil)
        OurServicesCollectionView.register(cellNib, forCellWithReuseIdentifier: "cell2")
        let cellNib2 = UINib(nibName: "OffersCollectionViewCell", bundle: nil)
        offersCollectionView.register(cellNib2, forCellWithReuseIdentifier: "cell3")
        
        
        didSelect()
        
        
        
    }
    
    private func didSelect(){
        let tapGestureRecoginizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecoginzer:)))
        clientImage.isUserInteractionEnabled = true
        clientImage.addGestureRecognizer(tapGestureRecoginizer)
    }
    
    @objc private func imageTapped(tapGestureRecoginzer: UITapGestureRecognizer) {
            
        let alert = UIAlertController(title: "take photo from", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Camera", style: .default , handler: { action in
            self.getPhoto(type: .camera)
        }))
        
        alert.addAction(UIAlertAction(title: "Photo Library", style: .default , handler: { action in
            self.getPhoto(type: .photoLibrary)
        }))
        
        present(alert, animated: true)
        
    }
    
    func getPhoto(type: UIImagePickerController.SourceType){
        let picker  = UIImagePickerController()
        picker.sourceType = type
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true)
        guard let image = info[.originalImage] as? UIImage else {
            print("image not found")
            return
        }
        clientImage.image = image
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    private func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
    }
    
    @objc func moveToNextIndex(){
        
        if currentCellIndex == (adsArray?.count).orEmpty - 1 {
            isGoingForward = false
        }else if currentCellIndex == 0{
            isGoingForward = true
            
        }
        
        if isGoingForward{
            currentCellIndex += 1
            
        }else{
            currentCellIndex -= 1
            
        }
        
        pageController.currentPage = currentCellIndex
        onlineCollectionView.scrollToItem(at: IndexPath(row: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        
    }
    
    
    @IBAction func didTapBook(_ sender: Any) {
        let alert = UIAlertController(title: "Meeting request", message: "Sure you want to schedule meeting with us ?!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes confirm", style: .default){(_) in
            
            let second = UIAlertController(title: "Meeting request", message: "we will contact you as soon as possible to alarm you with meeting time", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OKEY", style: .default)
            second.addAction(okAction)
            self.present(second, animated: true)
            
        })
        present(alert, animated: true)
    }
    
    @IBAction func didTapNotifications(_ sender: Any) {
        let vc = (self.storyboard?.instantiateViewController(withIdentifier: "NotificationsTableViewController") as? NotificationsTableViewController)!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func didTapSettings(_ sender: Any) {
    let vc = (self.storyboard?.instantiateViewController(withIdentifier: "settingsViewController") as? settingsViewController)!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if (collectionView == OurServicesCollectionView) {
            return servicesArray?.count ?? 1
        } else if collectionView == onlineCollectionView {
            return adsArray?.count ?? 1
        } else {
            return offersArray?.count ?? 1
        }
            
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == OurServicesCollectionView {
            
            let cell2 = OurServicesCollectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! OurServicesCollectionViewCell
            if let item = servicesArray?[indexPath.row] {
                cell2.setUp(services: item)
            }
            
            return cell2
            
        } else if collectionView == onlineCollectionView {
            
            let cell1 = onlineCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! onlineCollectionViewCell
            if let item = adsArray?[indexPath.row] {
                cell1.setUp(online: item)
            }
            
            return cell1
        } else {
            
            let cell3 = offersCollectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! OffersCollectionViewCell
            if let item = offersArray?[indexPath.row]{
                cell3.setUp(offers: item)
            }
            
            return cell3
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == onlineCollectionView {
            print("k")
        } else if collectionView == OurServicesCollectionView {
            
            let serviceDetails = servicesArray?[indexPath.row]
            let vc = (self.storyboard?.instantiateViewController(withIdentifier: "ServicesDetailsViewController") as? ServicesDetailsViewController)!
            vc.servicesId = serviceDetails
            self.navigationController?.pushViewController(vc, animated: true)
            
            
        } else {
            let serviceDetails = offersArray?[indexPath.row]
            let vc = (self.storyboard?.instantiateViewController(withIdentifier: "ServicesDetailsViewController") as? ServicesDetailsViewController)!
            vc.servicesId = serviceDetails
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == onlineCollectionView {
            return CGSize(width: onlineCollectionView.frame.width , height: onlineCollectionView.frame.height)
        } else if collectionView == OurServicesCollectionView {
            return CGSize(width: OurServicesCollectionView.frame.width * 0.325,  height: OurServicesCollectionView.frame.height / 2.4 )
        } else {
            return CGSize(width: offersCollectionView.frame.width , height: offersCollectionView.frame.height)
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == OurServicesCollectionView {
            return 0.1
        } else if collectionView == onlineCollectionView {
            return 10
        } else {
            return 10
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == OurServicesCollectionView {
            return 4
        } else if collectionView == onlineCollectionView {
            return 10
        } else {
            return 0
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == OurServicesCollectionView {
            return UIEdgeInsets(top: 1, left: 2, bottom: 1, right: 2)
        } else if collectionView == onlineCollectionView{
            return UIEdgeInsets(top: 2, left: 2, bottom: 5, right: 0.2)
        } else {
            return UIEdgeInsets(top: 2, left: 2, bottom: 5, right: 0.2)
        }

    }

}


extension HomeViewController{
    
    func getHomeCollection() {
        print(Endpoints.home)
        KRProgressHUD.show()
        NetworkManager.instance.request(Endpoints.home, parameters: nil, method: .get, type: Dataa.self, viewController: self, api_response: { [unowned self] (data) in
            DispatchQueue.main.async {
                KRProgressHUD.dismiss()
                self.success(data: data)
                
            }
            
        })
    }
    
    
    
    private func success(data: BaseModel<Dataa>?) {
        adsArray = data?.data?.ads
        onlineCollectionView.reloadData()
        servicesArray = data?.data?.services
        OurServicesCollectionView.reloadData()
        offersArray = data?.data?.offers
        offersCollectionView.reloadData()
        
    }
}
