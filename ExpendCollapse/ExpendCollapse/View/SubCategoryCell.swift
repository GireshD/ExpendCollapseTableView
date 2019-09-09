//
//  SubCategoryCell.swift
//  ExpendCollapse
//
//  Created by Giresh Dora on 28/08/19.
//  Copyright © 2019 Giresh Dora. All rights reserved.
//

import UIKit

class SubCategoryCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var displayNameLbl: UILabel!
    
    var subCategory :SubCategory = SubCategory(name: "", displayName: ""){
        didSet{
            self.nameLbl.text = subCategory.name?.capitalized
            self.displayNameLbl.text = subCategory.displayName?.capitalized
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
