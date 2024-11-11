//
//  NewMemoViewController.swift
//  MemoApp_EunMi
//
//  Created by Jong Cheol Jeong on 9/19/24.
//

import UIKit

class NewMemoViewController: UIViewController {

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
        
        //calendarnotificationtrigger
//        var dateComponents = DateComponents()
//        dateComponents.calendar = Calendar.current
//        
//        dateComponents.weekday = 4 //Tuesday
//        dateComponents.hour = 11
//        
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats:true)
//        
//        let uuidString = UUID().uuidString
//        let request = UNNotificationRequest(identifier:uuidString, content: content, trigger: trigger)
//        
//        notificationCenter.add(request){(error) in
//            if error != nil{
//                //handle any errors
//            }
//        }
        
        guard let memo = memoTextView.text, memo.count > 0 else{
            alert(message: "There are no text");
            return
        }
//        let newMemo = Memo(content: memo)
//        Memo.dummyMemoList.append(newMemo)
        DataManager.shared.saveMemo(memo)
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var memoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("1.viewDidLoad")
        print("===================")
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("2.viewWillAppear")
        print("===================")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("3.viewDidAppear")
        print("===================")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("4.viewDidAppear")
        print("===================")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("5.viewDidDisappear")
        print("===================")
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
