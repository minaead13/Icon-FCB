//
//  MyProfileViewController.swift
//  icon
//
//  Created by WINMAC on 20/06/2023.
//

import UIKit
import DropDown
import KRProgressHUD

class MyProfileViewController: UIViewController {

    
    @IBOutlet weak var birthdayField: UITextField!
    @IBOutlet weak var joinField: UITextField!
    @IBOutlet weak var genderDropDown: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var middleNameTxt: UITextField!
    @IBOutlet weak var lastNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var nationalityTxt: UITextField!
    @IBOutlet weak var phoneTxt: UITextField!
    @IBOutlet weak var countryTxt: UITextField!
    @IBOutlet weak var cityTxt: UITextField!
    @IBOutlet weak var address1Txt: UITextField!
    @IBOutlet weak var address2Txt: UITextField!
    @IBOutlet weak var employerName: UITextField!
    @IBOutlet weak var jobTitleTxt: UITextField!
    @IBOutlet weak var monthlyTxt: UITextField!
    
    
    
    let datePicker = UIDatePicker()
    let dropDown = DropDown()
    let dropDownCountry = DropDown()
    let dropDownNationality = DropDown()
    let dropDownCity = DropDown()
    var countriesArray = [countries]()
    var cities = [countries]()
    
    
    var nation : Int?
    var city : Int?
    var urlID : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCountries()
        didSelectCountry()
        didSelectNationality()
        didSelectCity()
        createDatepicker()
        createJoinDatePicker()
        textDropDown()
        didSelectGender()
        setUserDefaults()
    }
    
    private func setUserDefaults(){
        firstName.text = UserDefaults.standard.string(forKey: "firstName")
        middleNameTxt.text = UserDefaults.standard.string(forKey: "middleName")
        lastNameTxt.text = UserDefaults.standard.string(forKey: "lastName")
        phoneTxt.text = UserDefaults.standard.string(forKey: "phone")
        emailTxt.text = UserDefaults.standard.string(forKey: "email")
        
        genderDropDown.text = UserDefaults.standard.string(forKey: "gender")
        birthdayField.text = UserDefaults.standard.string(forKey: "birth")
        nationalityTxt.text = UserDefaults.standard.string(forKey: "nation")
        countryTxt.text = UserDefaults.standard.string(forKey: "country")
        cityTxt.text = UserDefaults.standard.string(forKey: "city")
        address1Txt.text = UserDefaults.standard.string(forKey: "address1")
        address2Txt.text = UserDefaults.standard.string(forKey: "address2")
        employerName.text = UserDefaults.standard.string(forKey: "empname")
        joinField.text = UserDefaults.standard.string(forKey: "join")
        jobTitleTxt.text = UserDefaults.standard.string(forKey: "title")
        monthlyTxt.text = UserDefaults.standard.string(forKey: "salary")
    }
    
    private func addUserDefaults(){
        UserDefaults.standard.set(genderDropDown.text, forKey: "gender")
        UserDefaults.standard.set(birthdayField.text, forKey: "birth")
        UserDefaults.standard.set(nationalityTxt.text, forKey: "nation")
        UserDefaults.standard.set(countryTxt.text, forKey: "country")
        UserDefaults.standard.set(cityTxt.text, forKey: "city")
        UserDefaults.standard.set(address1Txt.text, forKey: "address1")
        UserDefaults.standard.set(address2Txt.text, forKey: "address2")
        UserDefaults.standard.set(employerName.text, forKey: "empname")
        UserDefaults.standard.set(joinField.text, forKey: "join")
        UserDefaults.standard.set(jobTitleTxt.text, forKey: "title")
        UserDefaults.standard.set(monthlyTxt.text, forKey: "salary")
    }
    
    
    @IBAction func didTapUpdate(_ sender: Any) {
        update(first_name: firstName.text.orEmpty, middle_name: middleNameTxt.text.orEmpty, last_name: lastNameTxt.text.orEmpty, gender: genderDropDown.text.orEmpty, email: emailTxt.text.orEmpty, birth_day: birthdayField.text.orEmpty, phone: phoneTxt.text.orEmpty, nationality_id: nation.orEmpty, country_id: urlID.orEmpty, city_id: city.orEmpty, address1: address1Txt.text.orEmpty, address2: address2Txt.text.orEmpty, emp_name: employerName.text.orEmpty, job_title: jobTitleTxt.text.orEmpty, job_date: joinField.text.orEmpty , salary: monthlyTxt.text.orEmpty, country: countryTxt.text.orEmpty
               , city: cityTxt.text.orEmpty, nationality: nationalityTxt.text.orEmpty)
        addUserDefaults()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    private func textDropDown(){
        let GenderArray = ["Male", "Female"]
        
        dropDown.anchorView = genderDropDown
        dropDown.dataSource = GenderArray
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.selectionAction = { [unowned self]
            (index: Int, item: String) in
            self.genderDropDown.text = GenderArray[index]
        }
    }
    
    private func setNationalityDropDown(){
        
        var titles = [String]()
        for champion in countriesArray {
            titles.append(champion.name)
            
        }
        
        dropDownNationality.anchorView = nationalityTxt
        dropDownNationality.dataSource = titles
        
        dropDownNationality.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDownNationality.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        dropDownNationality.selectionAction = { [unowned self]
            (index: Int, item: String) in
            self.nationalityTxt.text = countriesArray[index].name
            nation = countriesArray[index].id
            
        }
    }
    
    private func setCountriesDropDown(){
        
        var titles = [String]()
        for champion in countriesArray {
            titles.append(champion.name)
            
        }
        
        dropDownCountry.anchorView = countryTxt
        dropDownCountry.dataSource = titles
        
        dropDownCountry.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDownCountry.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        dropDownCountry.selectionAction = { [unowned self]
            (index: Int, item: String) in
            self.countryTxt.text = countriesArray[index].name
            urlID = countriesArray[index].id
            getCities(id: urlID.orEmpty)
        }
    }
    
    private func setCitiesDropDown(){
        
        var titles = [String]()
        for champion in cities {
            titles.append(champion.name)
            
        }
        
        dropDownCity.anchorView = cityTxt
        dropDownCity.dataSource = titles
        
        dropDownCity.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDownCity.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        dropDownCity.selectionAction = { [unowned self]
            (index: Int, item: String) in
            self.cityTxt.text = cities[index].name
            city = cities[index].id
        }
    }
    
    private func didSelectGender(){
        let tapGestureRecoginizer = UITapGestureRecognizer(target: self, action: #selector(textTapped(tapGestureRecoginzer:)))
        genderDropDown.isUserInteractionEnabled = true
        genderDropDown.addGestureRecognizer(tapGestureRecoginizer)
    }
    
    @objc private func textTapped(tapGestureRecoginzer: UITapGestureRecognizer) {
            dropDown.show()
    }
    
    func didSelectNationality() {
        let tapGestureRecoginizer = UITapGestureRecognizer(target: self, action: #selector(nationalityTapped(tapGestureRecoginzer:)))
        nationalityTxt.isUserInteractionEnabled = true
        nationalityTxt.addGestureRecognizer(tapGestureRecoginizer)
    }
    
    @objc private func nationalityTapped(tapGestureRecoginzer: UITapGestureRecognizer) {
        dropDownNationality.show()
    }
    
    func didSelectCountry() {
        let tapGestureRecoginizer = UITapGestureRecognizer(target: self, action: #selector(countryTapped(tapGestureRecoginzer:)))
        countryTxt.isUserInteractionEnabled = true
        countryTxt.addGestureRecognizer(tapGestureRecoginizer)
    }
    
    @objc private func countryTapped(tapGestureRecoginzer: UITapGestureRecognizer) {
        dropDownCountry.show()
    }
    
    func didSelectCity() {
        let tapGestureRecoginizer = UITapGestureRecognizer(target: self, action: #selector(cityTapped(tapGestureRecoginzer:)))
        cityTxt.isUserInteractionEnabled = true
        cityTxt.addGestureRecognizer(tapGestureRecoginizer)
    }
    
    @objc private func cityTapped(tapGestureRecoginzer: UITapGestureRecognizer) {
        dropDownCity.show()
    }
    
    func createToolbar() -> UIToolbar{
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        return toolbar
        
    }
    
    func createJoinToolbar() -> UIToolbar{
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed2))
        toolbar.setItems([doneBtn], animated: true)
        
        return toolbar
        
    }
    
    func createDatepicker(){
        datePicker.preferredDatePickerStyle = .inline
        datePicker.datePickerMode = .date
        birthdayField.inputView = datePicker
        birthdayField.inputAccessoryView = createToolbar()
        
    }
    
    func createJoinDatePicker(){
        datePicker.preferredDatePickerStyle = .inline
        datePicker.datePickerMode = .date
        joinField.inputView = datePicker
        joinField.inputAccessoryView = createJoinToolbar()
    }
    
    
    @objc func donePressed(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        self.birthdayField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func donePressed2(){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        self.joinField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    


}

extension MyProfileViewController{
    
    func getCountries() {
        print(Endpoints.home)
        KRProgressHUD.show()
        NetworkManager.instance.request(Endpoints.countries, parameters: nil, method: .get, type: [countries].self, viewController: self, api_response: { [unowned self] (data) in
            DispatchQueue.main.async {
                KRProgressHUD.dismiss()
                self.success(data: data)
                
            }
            
        })
    }
    
    
    
    private func success(data: BaseModel<[countries]>?) {
        
        countriesArray = data?.data ?? []
        setNationalityDropDown()
        setCountriesDropDown()
        
    }
}

extension MyProfileViewController{
    
    func getCities(id : Int) {
        print(Endpoints.home)
        let url = "http://drcodingsystem.com/iconapp/public/api/cities/\(id)"
        KRProgressHUD.show()
        NetworkManager.instance.request(url, parameters: nil, method: .get, type: [countries].self, viewController: self, api_response: { [unowned self] (data) in
            DispatchQueue.main.async {
                KRProgressHUD.dismiss()
                self.successs(data: data)
                
            }
            
        })
    }
    
    
    
    private func successs(data: BaseModel<[countries]>?) {
        
        cities = data?.data ?? []
        setCitiesDropDown()
        
    }
}

extension MyProfileViewController{
    
    private func update (first_name: String?, middle_name:String?, last_name:String?, gender: String?, email: String?, birth_day: String?, phone: String?, nationality_id:Int?, country_id: Int?, city_id:Int?, address1 : String?, address2:String? , emp_name: String? , job_title : String?, job_date : String? , salary : String? , country : String?, city: String?, nationality: String?){
        let parameters = [
            "first_name": first_name,
            "middle_name" : middle_name,
            "last_name" : last_name,
            "gender" : gender,
            "birth_day" : birth_day,
            "phone" : phone,
            "nationality_id" : nationality_id,
            "country_id" : country_id,
            "city_id" : city_id,
            "emp_name" : emp_name,
            "job_title" : job_title,
            "job_date" : job_date,
            "salary" : salary,
            "city" : city,
            "country" : country,
            "email": email,
            "nationality": nationality,
            "address1" : address1,
            "address2" : address2
        ] as [String : Any]
        KRProgressHUD.show()
        NetworkManager.instance.request(Endpoints.updateMyProfile, parameters: parameters, method: .post, type: UpdateProfile.self, viewController: self, api_response: {
            [weak self] (data) in
            self?.success(data: data)
            KRProgressHUD.dismiss()
        })
        }
    
    private func success(data: BaseModel<UpdateProfile>?) {
        
       let message = data?.message
       // let id = data?.data?.id
        
    }
}
