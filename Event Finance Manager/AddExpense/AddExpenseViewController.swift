//
//  AddExpenseViewController.swift
//  Event Finance Manager
//
//  Created by Saikiran Panuganti on 14/04/22.
//

import UIKit

class AddExpenseViewController: UIViewController {
    @IBOutlet weak var expenseTitle: UITextField!
    @IBOutlet weak var total: UITextField!
    @IBOutlet weak var advance: UITextField!
    @IBOutlet weak var balance: UITextField!
    @IBOutlet weak var comment: UITextView!
    @IBOutlet weak var image1Label: UILabel!
    @IBOutlet weak var image2Label: UILabel!
    @IBOutlet weak var image3Label: UILabel!
    @IBOutlet weak var image1DeleteBtn: UIButton!
    @IBOutlet weak var image2DeleteBtn: UIButton!
    @IBOutlet weak var image3DeleteBtn: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var imagePicker: ImagePicker!
    var selectedImageButton: Int = 1
    var image1: UIImage? = nil
    var image2: UIImage? = nil
    var image3: UIImage? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        saveButton.layer.cornerRadius = 10.0
        
        comment.text = "Add a comment"
        comment.delegate = self
        comment.textColor = UIColor.lightGray
        
        expenseTitle.layer.borderWidth = 1.5
        expenseTitle.layer.borderColor = UIColor.lightGray.cgColor
        total.layer.borderWidth = 1.5
        total.layer.borderColor = UIColor.lightGray.cgColor
        advance.layer.borderWidth = 1.5
        advance.layer.borderColor = UIColor.lightGray.cgColor
        balance.layer.borderWidth = 1.5
        balance.layer.borderColor = UIColor.lightGray.cgColor
        comment.layer.borderWidth = 1.5
        comment.layer.borderColor = UIColor.lightGray.cgColor
        
        image1DeleteBtn.isHidden = true
        image2DeleteBtn.isHidden = true
        image3DeleteBtn.isHidden = true
        
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureRecognised(_:)))
        tapGesture.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapGestureRecognised(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func image1Tapped(_ sender: UIButton) {
        selectedImageButton = 1
        self.imagePicker.present(from: sender)
    }
    @IBAction func image2Tapped(_ sender: UIButton) {
        selectedImageButton = 2
        self.imagePicker.present(from: sender)
    }
    @IBAction func image3Tapped(_ sender: UIButton) {
        selectedImageButton = 3
        self.imagePicker.present(from: sender)
    }
    
    @IBAction func image1DeleteTapped(_ sender: UIButton) {
        image1 = nil
        image1Label.text = ""
        image1DeleteBtn.isHidden = true
    }
    @IBAction func image2DeleteTapped(_ sender: UIButton) {
        image2 = nil
        image2Label.text = ""
        image2DeleteBtn.isHidden = true
    }
    @IBAction func image3DeleteTapped(_ sender: UIButton) {
        image3 = nil
        image3Label.text = ""
        image3DeleteBtn.isHidden = true
    }
    
    @IBAction func saveTapped() {
        CoreDataManager.addExpenseToFolder(title: expenseTitle.text ?? "", balance: Int(balance.text ?? "0") ?? 0, advance: Int(advance.text ?? "0") ?? 0, total: Int(total.text ?? "0") ?? 0, comment: comment.text ?? "", image1: image1, image2: image2, image3: image3)
    }
}

extension AddExpenseViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        if selectedImageButton == 1 {
            if let image = image {
                image1 = image
                image1Label.text = "img1"
                image1DeleteBtn.isHidden = false
            }
        }else if selectedImageButton == 2 {
            if let image = image {
                image2 = image
                image2Label.text = "img2"
                image2DeleteBtn.isHidden = false
            }
        }else if selectedImageButton == 3 {
            if let image = image {
                image3 = image
                image3Label.text = "img3"
                image3DeleteBtn.isHidden = false
            }
        }
    }
}

extension AddExpenseViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Add a comment"
            textView.textColor = UIColor.lightGray
        }
    }
}
