//
//  SecondViewController.swift
//  FacebookLoginLesson2
//
//  Created by 寺島 洋平 on 2019/03/15.
//  Copyright © 2019年 YoheiTerashima. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class SecondViewController: UIViewController {

    @IBOutlet weak var currentUserName: UILabel!
    
    func returnUserDate() {
        let graphPath = "me"
        let parameters = ["fields": "id, name"]
        let graphRequest = FBSDKGraphRequest(graphPath: graphPath, parameters: parameters)
        
        let connection = FBSDKGraphRequestConnection()
        connection.add(graphRequest, completionHandler: { (connection, result, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("エラーなし")
                if let result = result {
                    print(result)
                }
            }
        })
        connection.start()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("画面遷移しました")
        returnUserDate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
