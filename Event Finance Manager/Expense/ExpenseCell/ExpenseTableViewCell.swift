//
//  ExpenseTableViewCell.swift
//  Event Finance Manager
//
//  Created by Saikiran Panuganti on 14/04/22.
//

import UIKit

class ExpenseTableViewCell: UITableViewCell {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var expenseTitle: UILabel!
    @IBOutlet weak var expenseTotal: UILabel!
    @IBOutlet weak var expenseAdvance: UILabel!
    @IBOutlet weak var expenseBalance: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setUpUI()
    }
    
    func setUpUI() {
        topView.layer.cornerRadius = 10.0
        topView.clipsToBounds = true
        topView.layer.borderColor = UIColor.red.cgColor
        topView.layer.borderWidth = 1.5
    }

    func configureUI() {
        
    }
    
}
