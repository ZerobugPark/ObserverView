//
//  WordCounterViewController.swift
//  SeSACSevenWeek
//
//  Created by Jack on 2/5/25.
//

import UIKit
import SnapKit
 
class WordCounterViewController: UIViewController {
    
  
    private var wordView = WordCounterView()
    
    // 소멸하기 위해서는 무조건 옵셔널 타입으로해야 nil이 할당됨.
    // let은 옵셔널을 못받으니 애초에 불가능
    // view가 사라지는경우에는?. 테스트 해볼 것
    //private var outputText: WordCounterViewModel? = WordCounterViewModel()
    private var wordModel = WordCounterViewModel()
    
    
    
    override func loadView() {
        view = wordView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextView()
        
        wordModel.outputText.bind { count in
            self.wordView.countLabel.text = "현재까지 \(count)글자 작성중"
        }
    }
     


    
    private func setupTextView() {
        
        wordView.textView.delegate = self
    }
     
    private func updateCharacterCount() {
        wordModel.inputText.value = wordView.textView.text.count
        
    }
}
 
extension WordCounterViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        updateCharacterCount()
    }
}
