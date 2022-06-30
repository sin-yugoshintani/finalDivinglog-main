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
    
    
    var argString = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        form +++ Section("日時")
        <<< LabelRow(){
            $0.title = "s"
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


