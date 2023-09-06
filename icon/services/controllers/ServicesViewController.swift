//
//  ServicesViewController.swift
//  icon
//
//  Created by WINMAC on 11/06/2023.
//

import UIKit

class ServicesViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{

    @IBOutlet weak var collectionView: UICollectionView!
    
    var ServiceArray : [ServiceModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: "ServiceCollectionViewCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "cell")
        
        ServiceArray = [ServiceModel(image: UIImage(named: "ic_loan")!, title: "Credit Cards"), ServiceModel(image: UIImage(named: "ic_loan")!, title: "Personal Loans") , ServiceModel(image: UIImage(named: "ic_loan")!, title: "Mortagage Loans"), ServiceModel(image: UIImage(named: "ic_loan")!, title: "Business Loans"), ServiceModel(image: UIImage(named: "ic_loan")!, title: "Debt Consolidation"), ServiceModel(image: UIImage(named: "ic_loan")!, title: "Bank accounts"), ServiceModel(image: UIImage(named: "ic_loan")!, title: "Underwriting") ]
        
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
    
    
    
    @IBAction func DidTappedLoanCalc(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LoanCalculatorViewController")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    //MARK: - CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ServiceArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ServiceCollectionViewCell
        cell.configure(ServiceArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.47, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 0.2)
    }
}
