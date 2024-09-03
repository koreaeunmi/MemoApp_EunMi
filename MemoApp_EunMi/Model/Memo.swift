//
//  Memo.swift
//  MemoApp_EunMi
//
//  Created by Jong Cheol Jeong on 8/29/24.
//

import Foundation

class Memo{
    var content:String
    var inserDate:Date
    
    init(content: String) {
        self.content = content
        self.inserDate = Date()
    }
    
    static var dummyMemoList = [Memo(content: "Hello! Memo App"),Memo(content: "Memo Test1")]
}
