//
//  InfoViewController.swift
//  DemoTrain
//
//  Created by Nguyễn Thành on 10/6/20.
//  Copyright © 2020 TrungNguyen. All rights reserved.
//

import UIKit

protocol InfoViewControllerDelegate {
    func editSuccess(_ data: EmployeeBO)
}

class InfoViewController: UIViewController {

    @IBOutlet weak var nameTf: UITextField!
    @IBOutlet weak var addressTf: UITextField!
    @IBOutlet weak var maleLb: UILabel!
    @IBOutlet weak var switchBtn: UISwitch!
    var isOn: Bool = false
    var info = EmployeeBO()
    var delegate: InfoViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isOn = info.isMale
        switchBtn.setOn(self.isOn, animated: false)
        maleLb.text = changeMale()
        nameTf.text = info.name
        addressTf.text = info.address
        // Do any additional setup after loading the view.
    }

    @IBAction func switchOnclick(_ sender: Any) {
        self.isOn = !self.isOn
        switchBtn.setOn(self.isOn, animated: false)
        maleLb.text = changeMale()
    }
    
    @IBAction func popBackOnclick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func editOnclick(_ sender: Any) {
        info.name = nameTf.text
        info.address = addressTf.text
        info.isMale = isOn
        delegate?.editSuccess(info)
        self.dismiss(animated: true, completion: nil)
    }
    
    func changeMale() -> String {
        if isOn {
            return "Giới tính là Nam"
        } else {
            return "Giới tính là nữ"
        }
    }
}
