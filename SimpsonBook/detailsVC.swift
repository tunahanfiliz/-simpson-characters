//
//  detailsVC.swift
//  SimpsonBook
//
//  Created by Ios Developer on 1.10.2022.
//

import UIKit

class detailsVC: UIViewController {

    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var secilenSimpson : Simpson?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = secilenSimpson?.name
        jobLabel.text = secilenSimpson?.job
        imageView.image = secilenSimpson?.image
        
    }
    

}
