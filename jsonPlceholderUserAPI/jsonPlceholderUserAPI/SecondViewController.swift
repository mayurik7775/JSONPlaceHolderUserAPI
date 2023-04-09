//
//  SecondViewController.swift
//  jsonPlceholderUserAPI
//
//  Created by Mac on 02/04/23.
//

import UIKit

class SecondViewController: UIViewController {

    
    
    @IBOutlet weak var idlabel: UILabel!
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var emaillabel: UILabel!
    @IBOutlet weak var phonelabel: UILabel!
    @IBOutlet weak var websitelabel: UILabel!
    @IBOutlet weak var addresslbl: UILabel!
    
    
    var user : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        idlabel.text = "\(user!.id)"
        namelabel.text = user!.name
        emaillabel.text = user!.email
        websitelabel.text = user!.website
        addresslbl.text = "\(user!.address)"
    }
}
