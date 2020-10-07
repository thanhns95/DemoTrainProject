//
//  InfoTableViewCell.swift
//  DemoTrain
//
//  Created by Nguyễn Thành on 10/5/20.
//  Copyright © 2020 TrungNguyen. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var addressLb: UILabel!
    @IBOutlet weak var maleLb: UILabel!
    @IBOutlet weak var positionLb: UILabel!
    
    var deleteAction: (() -> Void)?
    var editInfoAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func bindData(_ data: EmployeeBO) {
        nameLb.text = data.name
        addressLb.text = data.address
        maleLb.text = data.isMale ? "Nam" : "Nữ"
        positionLb.text = data.level?.rawValue
    }
    @IBAction func deleteOnclick(_ sender: Any) {
        deleteAction?()
    }
    
    @IBAction func editOnclick(_ sender: Any) {
        editInfoAction?()
    }
}
