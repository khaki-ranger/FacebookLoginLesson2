//
//  ViewController.swift
//  FacebookLoginLesson2
//
//  Created by 寺島 洋平 on 2019/03/13.
//  Copyright © 2019年 YoheiTerashima. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // 画面遷移
    func segueToSeccondViewController() {
        self.performSegue(withIdentifier: "toSecondViewController", sender: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // ログイン済みかチェック
        if let _ = FBSDKAccessToken.current() {
            // 画面遷移
            // performSegue(withIdentifier: "modalTop", sender: self)
            print("ログインしてます")
            segueToSeccondViewController()
        } else {
            // FBログインボタンを設置
            let fbLoginBtn = FBSDKLoginButton()
            fbLoginBtn.readPermissions = ["public_profile", "email"]
            fbLoginBtn.center = self.view.center
            fbLoginBtn.delegate = self
            self.view.addSubview(fbLoginBtn)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // ログインのコールバック
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        // エラーチェック
        if error == nil {
            // キャンセルしたかどうか
            if result.isCancelled {
                print("キャンセル")
            } else {
                // 画面遷移
                // performSegue(withIdentifier: "modalTop", sender: self)
                print("ログインしました")
                segueToSeccondViewController()
            }
        } else {
            print("エラー")
        }
    }
    
    // ログアウトのコールバック
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }

}

