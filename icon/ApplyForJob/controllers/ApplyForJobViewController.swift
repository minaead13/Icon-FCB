//
//  ApplyForJobViewController.swift
//  icon
//
//  Created by WINMAC on 18/06/2023.
//

import UIKit
import MobileCoreServices
import KRProgressHUD

class ApplyForJobViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func DidTappCV(_ sender: Any) {
        let documentPicker = UIDocumentPickerViewController(documentTypes: [kUTTypePlainText as String], in: .import)
        documentPicker.delegate = self
        documentPicker.allowsMultipleSelection = false
        present(documentPicker, animated: true)
        
    }
    
    

}
extension ApplyForJobViewController : UIDocumentPickerDelegate{
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        
        guard let selectedFileURL = urls.first else {
            return
        }
        
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let sandboxFileURL = dir.appendingPathComponent(selectedFileURL.lastPathComponent)
        
        if FileManager.default.fileExists(atPath: sandboxFileURL.path){
            print("already exist")
        } else {
            do {
                try FileManager.default.copyItem(at: selectedFileURL, to: sandboxFileURL)
                
                print("copied file")
            }
            catch {
                print("error: \(error)")
            }
        }
        
    }
}

extension ApplyForJobViewController{
    
    func applyForJob() {
        print(Endpoints.home)
        KRProgressHUD.show()
        NetworkManager.instance.request(Endpoints.home, parameters: nil, method: .post, type: Dataa.self, viewController: self, api_response: { [unowned self] (data) in
            DispatchQueue.main.async {
                KRProgressHUD.dismiss()
                self.success(data: data)
                
            }
            
        })
    }
    
    
    
    private func success(data: BaseModel<Dataa>?) {
        
//        servicesArray = (data?.data?.services)!
//        setDropDown()
        
       
        
    }
}
