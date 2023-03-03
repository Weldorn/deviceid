//
//  ViewController.swift
//  WDDeviceID
//
//  Created by Welton Dornelas on 03/03/23.
//

import UIKit
import FirebaseInstallations

class ViewController: UIViewController {
    
    @IBOutlet weak var deviceID: UILabel!
    
    fileprivate func fetchDeviceID() {
        Installations.installations().installationID { (id, error) in
            if let error =  error {
                print("Error fetching id: \(error)")
                return
            }
            guard let id = id else { return }
            print("[DEVICE ID] \(id)")
            self.deviceID.text = id
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDeviceID()
        // Do any additional setup after loading the view.
    }


}

