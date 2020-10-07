//
//  ViewController.swift
//  DemoTrain
//
//  Created by Nguyễn Thành on 10/2/20.
//  Copyright © 2020 TrungNguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, InfoViewControllerDelegate {
    
    @IBOutlet weak var infotbv: UITableView!
    let baseCallApi = CallBaseApi.sharedInstance
    var listEmployee = [EmployeeBO]()
    override func viewDidLoad() {
        super.viewDidLoad()
        infotbv.register(UINib(nibName: "InfoTableViewCell", bundle: nil), forCellReuseIdentifier: "InfoTableViewCell")
        getDataApi()
        // Do any additional setup after loading the view.
    }

    func getDataApi() {
        self.listEmployee.removeAll()
        baseCallApi.getEmployees { (response: EmployeeObject) in
            self.listEmployee = response.employees ?? [EmployeeBO]()
            DispatchQueue.main.async {
                self.infotbv.reloadData()
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listEmployee.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell", for: indexPath) as! InfoTableViewCell
        let data = self.listEmployee[indexPath.row]
        cell.bindData(data)
        cell.deleteAction = {
            self.listEmployee.remove(at: indexPath.row)
            tableView.reloadData()
        }
        cell.editInfoAction = {
            let vc = InfoViewController(nibName: "InfoViewController", bundle: nil)
            vc.info = self.listEmployee[indexPath.row]
            vc.delegate = self
            self.present(vc, animated: true, completion: nil)
        }
        return cell
    }
    
    func editSuccess(_ data: EmployeeBO) {
        infotbv.reloadData()
    }
}

