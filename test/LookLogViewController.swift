//
//  LookLogViewController.swift
//  test
//
//  Created by 菊地英治 on 2022/06/30.
//

import UIKit
import Eureka
import ImageRow
import RealmSwift


class LookLogViewController: FormViewController {
    
    
    var argSave = Save()
    var Lookdate: Date?
    var Lookplace : String? = ""
    var Lookweather : String? = ""
    var Lookaveragewaterdepth :Int?
    var Lookmaximumwaterdepth :Int?
    var Lookstartpressure :Int?
    var Lookfinishpressure :Int?
    var Looktransparency:Int?
    var Lookinstructor : String? = ""
    var LookBuddy : String? = ""
    var Lookmember1 : String? = ""
    var Lookmember2 : String? = ""
    var Lookmember3 : String? = ""
    var Lookmember4 : String? = ""
    var LookInstructorImage:UIImage? = UIImage()
    var LookBuddyImage:UIImage? = UIImage()
    var Lookmember1Image:UIImage? = UIImage()
    var Lookmember2Image:UIImage? = UIImage()
    var Lookmember3Image:UIImage? = UIImage()
    var Lookmember4Image:UIImage? = UIImage()
    
    
    
    func getImageURL(fileName: String) -> URL {
            let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            return docDir.appendingPathComponent(fileName)
        }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        var InstructorImage: UIImage?
        var buddyImage: UIImage?
        var member1Image: UIImage?
        var member2Image: UIImage?
        var member3Image: UIImage?
        var member4Image: UIImage?
        
       
        if let imageFileName = argSave.saveBuddyImage {
            let path = getImageURL(fileName: imageFileName).path // 画像のパスを取得
            if FileManager.default.fileExists(atPath: path) { // pathにファイルが存在しているかチェック
                if let imageData = UIImage(contentsOfFile: path) { // pathに保存されている画像を取得
                    buddyImage = imageData
                } else {
                    print("Failed to load the image. path = ", path)
                }
            } else {
                print("Image file not found. path = ", path)
            }
        }
        if let imageFileName = argSave.saveInstructorImage {
            let path = getImageURL(fileName: imageFileName).path // 画像のパスを取得
            if FileManager.default.fileExists(atPath: path) { // pathにファイルが存在しているかチェック
                if let imageData = UIImage(contentsOfFile: path) { // pathに保存されている画像を取得
                    InstructorImage = imageData
                } else {
                    print("Failed to load the image. path = ", path)
                }
            } else {
                print("Image file not found. path = ", path)
            }
        }
        
        if let imageFileName = argSave.savemember1Image {
            let path = getImageURL(fileName: imageFileName).path // 画像のパスを取得
            if FileManager.default.fileExists(atPath: path) { // pathにファイルが存在しているかチェック
                if let imageData = UIImage(contentsOfFile: path) { // pathに保存されている画像を取得
                    member1Image = imageData
                } else {
                    print("Failed to load the image. path = ", path)
                }
            } else {
                print("Image file not found. path = ", path)
            }
        }
        if let imageFileName = argSave.savemember2Image {
            let path = getImageURL(fileName: imageFileName).path // 画像のパスを取得
            if FileManager.default.fileExists(atPath: path) { // pathにファイルが存在しているかチェック
                if let imageData = UIImage(contentsOfFile: path) { // pathに保存されている画像を取得
                    member2Image = imageData
                } else {
                    print("Failed to load the image. path = ", path)
                }
            } else {
                print("Image file not found. path = ", path)
            }
        }
        if let imageFileName = argSave.savemember3Image {
            let path = getImageURL(fileName: imageFileName).path // 画像のパスを取得
            if FileManager.default.fileExists(atPath: path) { // pathにファイルが存在しているかチェック
                if let imageData = UIImage(contentsOfFile: path) { // pathに保存されている画像を取得
                    member3Image = imageData
                } else {
                    print("Failed to load the image. path = ", path)
                }
            } else {
                print("Image file not found. path = ", path)
            }
        }
        if let imageFileName = argSave.savemember4Image {
            let path = getImageURL(fileName: imageFileName).path // 画像のパスを取得
            if FileManager.default.fileExists(atPath: path) { // pathにファイルが存在しているかチェック
                if let imageData = UIImage(contentsOfFile: path) { // pathに保存されている画像を取得
                    member4Image = imageData
                } else {
                    print("Failed to load the image. path = ", path)
                }
            } else {
                print("Image file not found. path = ", path)
            }
        }
        
        
        
        form +++ Section("日時")
        <<< LabelRow(){
            
            if let watchDate = argSave.savedate{
                let df = DateFormatter()
                df.dateFormat = "MM/dd/yyyy hh:mm:ss a"
                $0.title = String(df.string(from: watchDate))
            }else{
                $0.title = ""
            }
            
        }
        <<< LabelRow(){
            $0.title = argSave.saveplace
        }
        <<< LabelRow(){
            $0.title = argSave.saveweather
        }
        
        form +++ Section("水深")
        <<< LabelRow(){
            let ave : String = String(argSave.saveaveragewaterdepth )
            $0.title = "平均\(ave)m"
        }
        <<< LabelRow(){
            let Max : String = String(argSave.savemaximumwaterdepth )
            $0.title = "最大\(Max)m"
        }
        
        form +++ Section("圧力")
        <<< LabelRow(){
            let start : String = String(argSave.savestartpressure )
            $0.title = "開始\(start)"
        }
        <<< LabelRow(){
            let finish : String = String(argSave.savefinishpressure)
            $0.title = "終了\(finish)"
        }
        
        form +++ Section("海の状態")
        <<< LabelRow(){
            let transparency : String = String(argSave.savetransparency)
            $0.title = "終了\(transparency)"
        }
        
        form +++ Section("コメント")
        <<< LabelRow(){
            $0.title = argSave.saveinstructor
        }
        <<< ImageViewRow(){
            $0.title = "A"
            $0.cell.commentImageView.image  = InstructorImage ?? UIImage()
        }
        <<< LabelRow(){
            $0.title = argSave.saveBuddy
        }
        <<< ImageViewRow(){
            $0.cell.commentImageView.image  = buddyImage ?? UIImage()
        }
        <<< LabelRow(){
            $0.title = argSave.savemember1
        }
        <<< ImageViewRow(){
            $0.cell.commentImageView.image  = member1Image ?? UIImage()
        }
        <<< LabelRow(){
            $0.title = argSave.savemember2
        }
        <<< ImageViewRow(){
            $0.cell.commentImageView.image  = member2Image ?? UIImage()
        }
        <<< LabelRow(){
            $0.title = argSave.savemember3
        }
        <<< ImageViewRow(){
            $0.cell.commentImageView.image  = member3Image ?? UIImage()
        }
        <<< LabelRow(){
            $0.title = argSave.savemember4
        }
        <<< ImageViewRow(){
            $0.cell.commentImageView.image  = member4Image ?? UIImage()
        }
        
        
        
        
        
        
        
        
    }
    
    
}











    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


