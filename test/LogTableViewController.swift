//
//  LogTableViewController.swift
//  test
//
//  Created by 菊地英治 on 2022/06/14.
//
import Foundation
import UIKit
import Eureka
import ImageRow
import RealmSwift

class Save: Object {
    @objc dynamic var savedate: Date?
    @objc dynamic var saveplace: String? = ""
    @objc dynamic var saveweather : String? = ""
    @objc dynamic var saveaveragewaterdepth = Int()
    @objc dynamic var savemaximumwaterdepth = Int()
    @objc dynamic var savestartpressure = Int()
    @objc dynamic var savefinishpressure = Int()
    @objc dynamic var savetransparency = Int()
    @objc dynamic var saveinstructor : String? = ""
    @objc dynamic var saveBuddy : String? = ""
    @objc dynamic var savemember1 : String? = ""
    @objc dynamic var savemember2 : String? = ""
    @objc dynamic var savemember3 : String? = ""
    @objc dynamic var savemember4 : String? = ""
    @objc dynamic var saveInstructorImage: String?
    @objc dynamic var saveBuddyImage: String?
    @objc dynamic var savemember1Image: String?
    @objc dynamic var savemember2Image: String?
    @objc dynamic var savemember3Image: String?
    @objc dynamic var savemember4Image: String?
}
class LogTableViewController: UITableViewController{
    let realm = try! Realm()
    let df = DateFormatter()
  

    @IBOutlet weak var newForumButton: UIBarButtonItem!
    
    
    var saves = [Save]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getsaveData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getsaveData()
    }
    
    func getsaveData() {
        saves = Array(realm.objects(Save.self)).reversed()
        self.tableView.reloadData()
    }
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.saves.count
    }
    //行を作る
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "logTableViewCell", for: indexPath)
        
        
        
        if let date = saves[indexPath.row] .savedate{
            let df = DateFormatter()
            df.locale = Locale(identifier: "ja_JP")
            df.dateFormat = "MM/dd/yyyy hh:mm:ss a"
            cell.textLabel?.text = df.string(from: date)
        }else{
            cell.textLabel?.text = ""
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
    
    
    func logTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        saves.count
    }
    
    // Cellの中身を設定するデリゲートメソッド
    func logTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "logTableViewCell", for: indexPath)
        guard let saveLabel = cell.viewWithTag(3) as? UILabel,
              let saveImageView = cell.viewWithTag(4) as? UIImageView else { return cell }
        
        let save = saves[indexPath.row]
        saveLabel.text = save.saveplace
        
        
        return cell
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
            // ②Segueの識別子確認
            if segue.identifier == "toLookLog" {
     
                // ③遷移先ViewCntrollerの取得
                let nextView = segue.destination as! LookLogViewController
     
                // ④値の設定
                nextView.argString =
                "test"
            }
        }
    
    
    
    // Cellのサイズを設定するデリゲートメソッド
//    func logTableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let save = saves[indexPath.row]
//
//    }
//    
}






// TableViewが何個のCellを表示するのか設定するデリゲートメソッド




//extension  LogTableViewController: UITableViewDelegate, UITableViewDataSource {
//
//    // TableViewが何個のCellを表示するのか設定するデリゲートメソッド
//    func logtableView(_ logtableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        saves.count
//    }







//取得して使う

/*
 UserDefaults.standard.set(date,forKey:"savedate")
 UserDefaults.standard.set(place,forKey:"saveplace")
 UserDefaults.standard.set(averagewaterdepth,forKey:"saveaveragewaterdepth")
 UserDefaults.standard.set(maximumwaterdepth,forKey:"savemaximumwaterdepth")
 UserDefaults.standard.set(startpressure,forKey:"savestartpressure")
 UserDefaults.standard.set(finishpressure,forKey:"savefinishpressure")
 UserDefaults.standard.set(transparency,forKey:"savetransparency")
 UserDefaults.standard.set(instructor,forKey:"saveinstructor")
 UserDefaults.standard.set(Buddy,forKey:"saveBuddy")
 UserDefaults.standard.set(member1,forKey:"savemember1")
 UserDefaults.standard.set(member2,forKey:"savemember2")
 UserDefaults.standard.set(member3,forKey:"savemember3")
 UserDefaults.standard.set(member4,forKey:"savemember4")
 //後で写真も！！
 */




/*
 extension LogTableViewController: UITableViewDelegate, UITableViewDataSource {
 // TableViewが何個のCellを表示するのか設定するデリゲートメソッド
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 saves.count
 }
 // Cellの中身を設定するデリゲートメソッド
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 let cell = tableView.dequeueReusableCell(withIdentifier: "SaveCell", for: indexPath)
 guard let saveLabel = cell.viewWithTag(3) as? UILabel,
 
 let save = saves[indexPath.row]
 saveLabel.text = save.saveText
 
 // Cellのサイズを設定するデリゲートメソッド
 func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
 let save = saves[indexPath.row]
 }
 
 }
 */

