//
//  EmotionButtonViewController.swift
//  SeSACEmotionDiary
//
//  Created by bro on 2022/04/30.
//

import UIKit

class EmotionButtonViewController: UIViewController {

    @IBOutlet var emotionBtn1: UIButton!
    @IBOutlet var emotionBtn2: UIButton!
    @IBOutlet var emotionBtn3: UIButton!
    @IBOutlet var emotionBtn4: UIButton!
    @IBOutlet var emotionBtn5: UIButton!
    @IBOutlet var emotionBtn6: UIButton!
    @IBOutlet var emotionBtn7: UIButton!
    @IBOutlet var emotionBtn8: UIButton!
    @IBOutlet var emotionBtn9: UIButton!
    
    
    @IBOutlet var resultLabel1: UILabel!
    @IBOutlet var resultLabel2: UILabel!
    @IBOutlet var resultLabel3: UILabel!
    @IBOutlet var resultLabel4: UILabel!
    @IBOutlet var resultLabel5: UILabel!
    @IBOutlet var resultLabel6: UILabel!
    @IBOutlet var resultLabel7: UILabel!
    @IBOutlet var resultLabel8: UILabel!
    @IBOutlet var resultLabel9: UILabel!
    
    
    let emotionDictionary : Dictionary<Int, String> = [1 : "행복해", 2 : "사랑해", 3:"좋아해", 4:"당황해", 5:"속상해", 6:"졸려해", 7:"심심해", 8:"우울해", 9:"슬퍼해"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        updateLabelUI()
    }
    

    @IBAction func emtionBtnClicked(_ sender: UIButton) {
        saveEmotion(sender)
        updateLabelUI()
    }
    
    func updateLabelUI() {
        resultLabel1.text = "\(emotionDictionary[1]!) : \(UserDefaults.standard.integer(forKey: "emotion1"))"
        resultLabel2.text = "\(emotionDictionary[2]!) : \(UserDefaults.standard.integer(forKey: "emotion2"))"
        resultLabel3.text = "\(emotionDictionary[3]!) : \(UserDefaults.standard.integer(forKey: "emotion3"))"
        resultLabel4.text = "\(emotionDictionary[4]!) : \(UserDefaults.standard.integer(forKey: "emotion4"))"
        resultLabel5.text = "\(emotionDictionary[5]!) : \(UserDefaults.standard.integer(forKey: "emotion5"))"
        resultLabel6.text = "\(emotionDictionary[6]!) : \(UserDefaults.standard.integer(forKey: "emotion6"))"
        resultLabel7.text = "\(emotionDictionary[7]!) : \(UserDefaults.standard.integer(forKey: "emotion7"))"
        resultLabel8.text = "\(emotionDictionary[8]!) : \(UserDefaults.standard.integer(forKey: "emotion8"))"
        resultLabel9.text = "\(emotionDictionary[9]!) : \(UserDefaults.standard.integer(forKey: "emotion9"))"
    }
    
    func saveEmotion(_ btn : UIButton) {
        let emotionCount = UserDefaults.standard.integer(forKey: "emotion\(btn.tag)")
        UserDefaults.standard.set(emotionCount + 1, forKey: "emotion\(btn.tag)")
    }
    
    func resetEmotion() {
        for emotionNum in 1...9 {
            UserDefaults.standard.removeObject(forKey: "emotion\(emotionNum)")
        }
        updateLabelUI()
    }
        
    @IBAction func resetBtnClicked(_ sender: UIButton) {
        resetEmotion()
    }
}
