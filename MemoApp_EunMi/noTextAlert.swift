//
//  noTextAlert.swift
//  MemoApp_EunMi
//
//  Created by Jong Cheol Jeong on 9/24/24.
//

import UIKit

extension UIViewController{

    func alert(title:String = "NOTICE",message:String){
        let DlgAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OkAction = UIAlertAction(title: "CONFIRM", style: .default, handler: nil)
        DlgAlert.addAction(OkAction)
        
        present(DlgAlert, animated: true, completion: nil)
    }
    
}
