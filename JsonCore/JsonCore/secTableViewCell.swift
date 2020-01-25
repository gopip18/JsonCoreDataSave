//
//  secTableViewCell.swift
//  JsonCore
//
//  Created by Greeens5 on 25/01/20.
//  Copyright © 2020 Greens. All rights reserved.
//

import UIKit

class secTableViewCell: UITableViewCell {
    
    @IBOutlet weak var distitleLbl: UILabel!
    @IBOutlet weak var disImage: UIImageView!
//    @IBOutlet weak var viewSecond: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
