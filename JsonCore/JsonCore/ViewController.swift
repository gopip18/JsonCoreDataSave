//
//  ViewController.swift
//  JsonCore
//
//  Created by Greeens5 on 24/01/20.
//  Copyright © 2020 Greens. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var displayDatasssss = [displyDataClass]()
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hai")
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayDatasssss.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "samTableViewCell") as! samTableViewCell
        
        
        
        
        
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        cell.label.text = displayDatasssss[indexPath.row].title
        let saveImage = displayDatasssss[indexPath.row].image
        let urlimg = URL(string: saveImage)
        let dataSt = try! Data(contentsOf: urlimg!)
         let conimg = UIImage(data: dataSt)
        cell.DisplyImga.image = conimg
        
        
        cell.viewFirst.layer.cornerRadius = 25
        cell.DisplyImga.layer.borderWidth = 3.0
        cell.DisplyImga.layer.masksToBounds = false
        cell.DisplyImga.layer.borderColor = UIColor.white.cgColor
        cell.DisplyImga.layer.cornerRadius = (cell.DisplyImga.frame.size.width) / 2
        cell.DisplyImga.clipsToBounds = true
        
        let _:AppDelegate = (UIApplication.shared.delegate as! AppDelegate)
        let context:NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as NSManagedObject
        newUser.setValue(displayDatasssss[indexPath.row].title, forKey: "title")

        
        newUser.setValue(displayDatasssss[indexPath.row].image, forKey: "image")
        
        do {
            try context.save()
        } catch {}
        print(newUser)
        print("Object Saved.")
        
        
//        let myStringValue = cell.label.text
////        let myyearValue = cell.DisplyImga.image
//        request.predicate = NSPredicate (format: "title == %@", myStringValue!)
////        request.predicate = NSPredicate (format: "image == %@", myyearValue!)
//        do
//        {
//            let result = try context.fetch(request)
//            if result.count > 0
//            {
//                let nameData = (result[0] as AnyObject).value(forKey: "title") as! String
////                let namereleaseYear = (result[0] as AnyObject).value(forKey: "image") as! String
////                print(namereleaseYear)
////                print(nameData)
//
//            }
//        }
//        catch {
//            //handle error
//            print(error)
//        }
        
        return cell
    }
    
    @IBAction func secondView(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "secSeg") as! secondViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)

    }
    @IBAction func tap(_ sender: Any) {
        let url = "https://api.androidhive.info/json/movies.json"
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request){(data, response,error)in
            if (error != nil){
                print("Error")
            }
            else{
                do{
                    // Array of Data
                    let fetchData = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSArray
                    
                    for eachData in fetchData {
                        
                        let eachdataitem = eachData as! [String : Any]
                        let title = eachdataitem["title"] as! String
                        let image = eachdataitem["image"] as! String
//                        let username = eachdataitem["username"]as! String
//
//                        let email = eachdataitem["email"]as! String
                        self.displayDatasssss.append(displyDataClass(title : title, image : image))
                    }
                    self.tableView.reloadData()
                }
                catch{
                    print("Error 2")
                }
                
            }
        }
        task.resume()
        
    }
}



class displyDataClass {
    var title : String
    var image : String
//    var email : String
    
    init(title : String, image : String) {
        self.title = title
        self.image = image
//        self.email = email
    }
}
