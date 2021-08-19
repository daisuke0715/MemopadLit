//
//  MemoViewController.swift
//  Memopad
//
//  Created by 河村大介 on 2021/08/20.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titileTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    var saveData: UserDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        titileTextField.text = saveData.object(forKey: "title") as? String
        contentTextView.text = saveData.object(forKey: "content") as? String
        
        titileTextField.delegate = self
    }
    
    @IBAction func saveMemo() {
        
        let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { action in
            self.navigationController?.popViewController(animated: true)
                    print("OKボタンが押されました。")
                }
            )
        )
        
        present(alert, animated: true, completion: nil)
        
        saveData.set(titileTextField.text, forKey: "title")
        saveData.set(contentTextView.text, forKey: "content")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
