//
//  ViewController.swift
//  CoreDataBase
//
//  Created by Bhautik Rajodiya on 17/03/23.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var idTextFiled: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func dataCreatButton(_ sender: UIButton) {
        addData(id: Int(idTextFiled.text ?? "") ?? 0, name: nameTextField.text ?? "")
    }
    
    @IBAction func retrievDataButton(_ sender: UIButton) {
        retrievData()
    }
    
    @IBAction func deleteDataButton(_ sender: UIButton) {
        deleteData(id: Int(idTextFiled.text ?? "") ?? 0)
    }
    
    @IBAction func updateDataButton(_ sender: UIButton) {
        updateData(name: nameTextField.text ?? "", id: Int(idTextFiled.text ?? "") ?? 0)
    }
    
    func getRandomName() -> String {
        var name = ""
        let size = (4...6).randomElement()!
        for i in 0..<size {
            name += String(i%2==0 ? "BDFGHJKLMNPRSTV".randomElement()! : "AEIOU".randomElement()!)
        }
        
        return name
    }
    
    
    @IBAction func Data(_ sender: UIButton) {
        
        for _ in 1...50 {
            let id = (100...999).randomElement()!
            let name = getRandomName()
            addData(id: id, name: name)
        }
    }
    
    func addData(id: Int,name: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContex = appDelegate.persistentContainer.viewContext
        
        let userEntity = NSEntityDescription.entity(forEntityName: "Student", in: managedContex)!
        
        let user = NSManagedObject(entity: userEntity, insertInto: managedContex)
        //        user.setValue(name, forKeyPath: "name")
        user.setValue(name, forKey: "name")
        user.setValue(id, forKey: "id")
        print(user)
        appDelegate.saveContext()
    }
    
    func retrievData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContex = appDelegate.persistentContainer.viewContext
//        let fetchRequest = Student.fetchRequest()
        let fetchRequest = Student.fetchRequest()
        
        do
        {
            let result = try managedContex.fetch(fetchRequest)
            for data in result {
                //                print(data.value(forKey: "name") as! String, data.id)
                print(data.name as! String,data.id)
            }
            print("Data Get\n")
        }
        catch {
            print("could not save.")
        }
        neviget()
    }
    
    func updateData(name: String,id: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContex = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Student")
        fetchRequest.predicate = NSPredicate(format: "id = %d", id)
        
        do
        {
            let fetchRequest = Student.fetchRequest()
            let test = try managedContex.fetch(fetchRequest)
            
            let objToDelete = test[0] as! NSManagedObject
            objToDelete.setValue(name, forKey: "name")
            for i in test {
                let objToDelete = i as! Student
                i.name = objToDelete.name
                i.id = objToDelete.id
                print(objToDelete)
            }
            appDelegate.saveContext()
            print("Data Updet\n")
        }
        catch {
            print(error)
        }
    }
    
    
    func deleteData(id: Int) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContex = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        fetchRequest.predicate = NSPredicate(format: "id = %d", id)
        do
        {
            let test = try managedContex.fetch(fetchRequest)
            let objToDelete = test[0] as! NSManagedObject
            managedContex.delete(objToDelete)
            appDelegate.saveContext()
            print("Data Delete\n")
        }
        catch {
            print(error)
        }
    }
    
    
    
    func neviget() {
        let n = storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
        navigationController?.pushViewController(n, animated: true)
    }
}

