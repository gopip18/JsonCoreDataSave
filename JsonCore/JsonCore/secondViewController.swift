//
//  secondViewController.swift
//  JsonCore
//
//  Created by Greeens5 on 25/01/20.
//  Copyright © 2020 Greens. All rights reserved.
//

import UIKit
import CoreData

class secondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UINavigationControllerDelegate {
var RegList: [NSManagedObject] = []
    
    @IBOutlet weak var sectableview: UITableView!
    func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    func fetchRecord()
    {
        
        let context = getContext()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do{
            RegList = try context.fetch(fetchRequest) as! [NSManagedObject]
        }catch{
            print("error")
        }
        DispatchQueue.main.async {
            self.sectableview.reloadData()
        }
    }
//    override func viewWillAppear(_ animated: Bool) {
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
fetchRecord()
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RegList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "secTableViewCell", for: indexPath) as! secTableViewCell
        
        let regis = RegList[indexPath.row]
        cell.distitleLbl.text = regis.value(forKeyPath: "title") as? String
        let saveImages = regis.value(forKeyPath: "image") as? String
        let urlimgs = URL(string: saveImages!)
        let dataSts = try! Data(contentsOf: urlimgs!)
        let conimgs = UIImage(data: dataSts)
        cell.disImage.image = conimgs
        
//        cell.viewSecond.layer.cornerRadius = 25
        cell.disImage.layer.borderWidth = 3.0
        cell.disImage.layer.masksToBounds = false
        cell.disImage.layer.borderColor = UIColor.red.cgColor
        cell.disImage.layer.cornerRadius = (cell.disImage.frame.size.width) / 2    
        cell.disImage.clipsToBounds = true
        
//        cell.lblEmail.text = regis.value(forKeyPath: "email") as? String
//        cell.lblMobile.text = regis.value(forKeyPath: "mobile") as? String
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
