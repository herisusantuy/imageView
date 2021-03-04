//
//  ViewController.swift
//  ImageViewApp
//
//  Created by Heri Susanto on 03/03/21.
//  Copyright © 2021 Heri Susanto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var textView: UITextView!
    @IBOutlet var buttonObject: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.isUserInteractionEnabled = true
        textView.isEditable = false
        textView.dataDetectorTypes = UIDataDetectorTypes.link
        textView.isSelectable = true
        textView.text = "Here's I am www.google.com"
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if touch?.view == imageView {
            print("Touched")
        } else {
            print("Nothing")
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification){
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification){
        if ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.view.frame.origin.y != 0 {
                self.view.frame.origin.y = 0
            }
        }
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if textView.isEditable == true {
            textView.isEditable = false
            textView.backgroundColor = .yellow
            textView.textColor = .blue
            textView.font = UIFont(name: "Courier", size: 24)
        } else {
            textView.isEditable = true
            textView.backgroundColor = .blue
            textView.textColor = .white
            textView.font = UIFont(name: "Ariel", size: 10)
        }
    }
    


}

