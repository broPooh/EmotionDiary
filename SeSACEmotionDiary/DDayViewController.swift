//
//  DDayViewController.swift
//  SeSACEmotionDiary
//
//  Created by bro on 2022/04/30.
//

import UIKit

class DDayViewController: UIViewController {

    @IBOutlet var datePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //버전별 분기 처리.
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        }

    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        
        print(datePicker.date)
        print(sender.date)
        
        //DateFormatter
        //1. 원하는 형태로 날자를 표현할 수 있다. DateFormat
        //2. 원하는 시간대로 표현가능,(한국)
        
        let format = DateFormatter()
        format.dateFormat = "yy년 M월 d일" // 21/10/20
        
        let value = format.string(from: sender.date)
        print(value)
        
        //date 계산하기 : TimeInterval을 사용할 것
        let afterDate = Date(timeInterval: 86400 * 100, since: sender.date)
        print(afterDate)
        
    }
    
}
