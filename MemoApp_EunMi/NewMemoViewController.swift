//
//  NewMemoViewController.swift
//  MemoApp_EunMi
//
//  Created by Jong Cheol Jeong on 9/19/24.
//

import UIKit

class NewMemoViewController: UIViewController {

    var editTarget:Memo?
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
  
    @IBAction func save(_ sender: Any) {
                
        let notificationCenter = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "User Notification"
        content.subtitle = "CSC308"
        content.body = "Body:iOS App Development"
        content.badge = 0
        
        //timeintervaltrigger
        let TimeIntervalTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.2, repeats: false)
        
        //requestion notification
        let request = UNNotificationRequest(identifier: "timerdone", content: content, trigger: TimeIntervalTrigger)
        
        //add requestion
        notificationCenter.add(request, withCompletionHandler: nil)
        
        guard let memo = memoTextView.text, memo.count > 0 else{
            alert(message: "There are no text");
            return
        }
//        let newMemo = Memo(content: memo)
//        Memo.dummyMemoList.append(newMemo)
        
        if let target = editTarget{
            target.content = memo
            DataManager.shared.saveContext()
            NotificationCenter.default.post(name: NewMemoViewController.memo_Change, object: self)
        }else{
            DataManager.shared.saveMemo(memo)
            NotificationCenter.default.post(name: NewMemoViewController.newMemo_Insert, object: self)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var memoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let memo = editTarget{
            navigationItem.title = "Edit Memo"
            memoTextView.text = memo.content
        }else{
            navigationItem.title = "New Memo"
            memoTextView.text = ""
        }
    }
    
}

extension NewMemoViewController{
    static let newMemo_Insert = Notification.Name(rawValue:"newValue_Insert")
    static let memo_Change = Notification.Name(rawValue:"memo_Change")
}
