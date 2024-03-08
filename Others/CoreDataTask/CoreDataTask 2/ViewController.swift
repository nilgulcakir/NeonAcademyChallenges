//
//  ViewController.swift
//  CoreDataTask
//
//  Created by Nilgul Cakir on 4.01.2024.
//

import UIKit
import SnapKit
import CoreData

class ViewController: UIViewController {
    
    let nameTextField = UITextField()
    let surnameTextField = UITextField()
    let emailTextField = UITextField()
    let ageTextField = UITextField()
    let saveButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    func createUI(){
        view.backgroundColor = .white
        
        nameTextField.placeholder = "isim"
        nameTextField.borderStyle = .roundedRect
        nameTextField.layer.borderWidth = 2.0
        view.addSubview(nameTextField)
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
        
        surnameTextField.placeholder = "soyisim"
        surnameTextField.borderStyle = .roundedRect
        surnameTextField.layer.borderWidth = 2.0
        view.addSubview(surnameTextField)
        
        surnameTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(20)
            make.leading.trailing.height.equalTo(nameTextField)
        }

        emailTextField.placeholder = "email"
        emailTextField.borderStyle = .roundedRect
        emailTextField.layer.borderWidth = 2.0
        view.addSubview(emailTextField)
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(surnameTextField.snp.bottom).offset(20)
            make.leading.trailing.height.equalTo(surnameTextField)
        }
        
        ageTextField.placeholder = "yaş"
        ageTextField.borderStyle = .roundedRect
        ageTextField.layer.borderWidth = 2.0
        view.addSubview(ageTextField)
        
        ageTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.leading.trailing.height.equalTo(emailTextField)
        }
        
        saveButton.setTitle("Save", for: .normal)
        saveButton.backgroundColor = .blue
        saveButton.setTitleColor(UIColor.white, for: .normal)
        saveButton.layer.cornerRadius = 10
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        view.addSubview(saveButton)
        
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(ageTextField.snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(150)
        }
    }
    
    @objc func saveButtonTapped(){

        saveData()

        let secondVC = SecondVC()
        navigationController?.pushViewController(secondVC, animated: true)
                
        
    }
    
    func saveData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
        
        let user = NSManagedObject(entity: entity, insertInto: managedContext)
        
        user.setValue(nameTextField.text, forKey: "name")
        user.setValue(surnameTextField.text, forKey: "surname")
        user.setValue(emailTextField.text, forKey: "email")
        user.setValue(Int(ageTextField.text ?? "0"), forKey: "age")
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
            
    }
    
    


}

