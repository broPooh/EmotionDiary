//
//  EmtionViewController.swift
//  SeSACEmotionDiary
//
//  Created by bro on 2022/04/30.
//

import UIKit

class EmtionViewController: UIViewController {
    
    
    @IBOutlet var emotion1: UIImageView!
    @IBOutlet var emotion2: UIImageView!
    @IBOutlet var emotion3: UIImageView!
    @IBOutlet var emotion4: UIImageView!
    @IBOutlet var emotion5: UIImageView!
    @IBOutlet var emotion6: UIImageView!
    @IBOutlet var emotion7: UIImageView!
    @IBOutlet var emotion8: UIImageView!
    @IBOutlet var emotion9: UIImageView!
    
    @IBOutlet var emotionLabel1: UILabel!
    @IBOutlet var emotionLabel2: UILabel!
    @IBOutlet var emotionLabel3: UILabel!
    @IBOutlet var emotionLabel4: UILabel!
    @IBOutlet var emotionLabel5: UILabel!
    @IBOutlet var emotionLabel6: UILabel!
    @IBOutlet var emotionLabel7: UILabel!
    @IBOutlet var emotionLabel8: UILabel!
    @IBOutlet var emotionLabel9: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        initEmotionData()
        addImageViewClickedEvent()
    }
    
    func addImageViewClickedEvent() {
        addUITapGestuerToImageView(emotion1, UITapGestureRecognizer(target: self, action: #selector(emotionImg1Clciked)))
        addUITapGestuerToImageView(emotion2, UITapGestureRecognizer(target: self, action: #selector(emotionImg2Clciked)))
        addUITapGestuerToImageView(emotion3, UITapGestureRecognizer(target: self, action: #selector(emotionImg3Clciked)))
        addUITapGestuerToImageView(emotion4, UITapGestureRecognizer(target: self, action: #selector(emotionImg4Clciked)))
        addUITapGestuerToImageView(emotion5, UITapGestureRecognizer(target: self, action: #selector(emotionImg5Clciked)))
        addUITapGestuerToImageView(emotion6, UITapGestureRecognizer(target: self, action: #selector(emotionImg6Clciked)))
        addUITapGestuerToImageView(emotion7, UITapGestureRecognizer(target: self, action: #selector(emotionImg7Clciked)))
        addUITapGestuerToImageView(emotion8, UITapGestureRecognizer(target: self, action: #selector(emotionImg8Clciked)))
        addUITapGestuerToImageView(emotion9, UITapGestureRecognizer(target: self, action: #selector(emotionImg9Clciked)))
    }
    
    
    func addClcikedEventToImageView(_ imageView : UIImageView) {
        imageView.isUserInteractionEnabled = true
        let event = UITapGestureRecognizer(target: self, action: #selector(emotionImg1Clciked))
        imageView.addGestureRecognizer(event)
    }
    
    func addUITapGestuerToImageView(_ imageView : UIImageView, _ event : UITapGestureRecognizer) {
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(event)
    }
    
    @objc func emotionImg1Clciked() {
        saveEmotion(emotion1)
    }
    
    @objc func emotionImg2Clciked() {
        saveEmotion(emotion2)
    }
    
    @objc func emotionImg3Clciked() {
        saveEmotion(emotion3)
    }

    @objc func emotionImg4Clciked() {
        saveEmotion(emotion4)
    }
    
    @objc func emotionImg5Clciked() {
        saveEmotion(emotion5)
    }
    
    @objc func emotionImg6Clciked() {
        saveEmotion(emotion6)
    }
    
    @objc func emotionImg7Clciked() {
        saveEmotion(emotion7)
    }
    
    @objc func emotionImg8Clciked() {
        saveEmotion(emotion8)
    }
    
    @objc func emotionImg9Clciked() {
        saveEmotion(emotion9)
    }
    
    @objc func saveEmotion(_ imageView : UIImageView) {
        let emotionCount = UserDefaults.standard.integer(forKey: getUserDefaultKey(imageView))
        UserDefaults.standard.set(emotionCount + 1, forKey: getUserDefaultKey(imageView))
        setEotionCountToLabel(imageView, getEmotionImageToLabel(imageView))
    }
    
    func setEotionCountToLabel(_ imageView : UIImageView, _ label : UILabel) {
        let emotionCount = UserDefaults.standard.integer(forKey: getUserDefaultKey(imageView))
        label.text = "\(getUserDefaultKey(imageView)) : \(emotionCount)"
    }
    
    func getUserDefaultKey(_ imageView : UIImageView) -> String {
        switch (imageView) {
        case emotion1 : return "행복해"
        case emotion2 : return "사랑해"
        case emotion3 : return "좋아해"
        case emotion4 : return "당황해"
        case emotion5 : return "속상해"
        case emotion6 : return "졸려해"
        case emotion7 : return "심심해"
        case emotion8 : return "우울해"
        case emotion9 : return "슬퍼해"
        default:
            return "행복해"
        }
    }
    
    func getEmotionImageToLabel(_ imageView : UIImageView) -> UILabel {
        switch (imageView) {
        case emotion1 : return emotionLabel1
        case emotion2 : return emotionLabel2
        case emotion3 : return emotionLabel3
        case emotion4 : return emotionLabel4
        case emotion5 : return emotionLabel5
        case emotion6 : return emotionLabel6
        case emotion7 : return emotionLabel7
        case emotion8 : return emotionLabel8
        case emotion9 : return emotionLabel9
        default:
            return emotionLabel1
        }
    }
    
    func initEmotionData() {
        setEotionCountToLabel(emotion1, getEmotionImageToLabel(emotion1))
        setEotionCountToLabel(emotion2, getEmotionImageToLabel(emotion2))
        setEotionCountToLabel(emotion3, getEmotionImageToLabel(emotion3))
        setEotionCountToLabel(emotion4, getEmotionImageToLabel(emotion4))
        setEotionCountToLabel(emotion5, getEmotionImageToLabel(emotion5))
        setEotionCountToLabel(emotion6, getEmotionImageToLabel(emotion6))
        setEotionCountToLabel(emotion7, getEmotionImageToLabel(emotion7))
        setEotionCountToLabel(emotion8, getEmotionImageToLabel(emotion8))
        setEotionCountToLabel(emotion9, getEmotionImageToLabel(emotion9))
    }
    
    func resetEmotion() {
        UserDefaults.standard.removeObject(forKey: getUserDefaultKey(emotion1))
        UserDefaults.standard.removeObject(forKey: getUserDefaultKey(emotion2))
        UserDefaults.standard.removeObject(forKey: getUserDefaultKey(emotion3))
        UserDefaults.standard.removeObject(forKey: getUserDefaultKey(emotion4))
        UserDefaults.standard.removeObject(forKey: getUserDefaultKey(emotion5))
        UserDefaults.standard.removeObject(forKey: getUserDefaultKey(emotion6))
        UserDefaults.standard.removeObject(forKey: getUserDefaultKey(emotion7))
        UserDefaults.standard.removeObject(forKey: getUserDefaultKey(emotion8))
        UserDefaults.standard.removeObject(forKey: getUserDefaultKey(emotion9))
    }
    
    func setDefaultLabel() {
        emotionLabel1.text = getUserDefaultKey(emotion1)
        emotionLabel2.text = getUserDefaultKey(emotion2)
        emotionLabel3.text = getUserDefaultKey(emotion3)
        emotionLabel4.text = getUserDefaultKey(emotion4)
        emotionLabel5.text = getUserDefaultKey(emotion5)
        emotionLabel6.text = getUserDefaultKey(emotion6)
        emotionLabel7.text = getUserDefaultKey(emotion7)
        emotionLabel8.text = getUserDefaultKey(emotion8)
        emotionLabel9.text = getUserDefaultKey(emotion9)
    }
    
    @IBAction func resetBtnClicked(_ sender: UIBarButtonItem) {
        resetEmotion()
        setDefaultLabel()
    }
    
}
