//
//  CollectionViewCell.swift
//  jsonPlceholderUserAPI
//
//  Created by Mac on 02/04/23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var idlbl: UILabel!
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var emaillbl: UILabel!
    @IBOutlet weak var phonelbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
