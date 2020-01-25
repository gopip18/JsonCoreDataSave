//
//  samTableViewCell.swift
//  JsonCore
//
//  Created by Greeens5 on 24/01/20.
//  Copyright © 2020 Greens. All rights reserved.
//

import UIKit

class samTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var DisplyImga: UIImageView!
    @IBOutlet weak var disImg: UIView!
    @IBOutlet weak var yearLbl: UILabel!
    
    @IBOutlet weak var viewFirst: UIView!
    
//    var getImg:UIImage
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        DisplyImga.image = getImg
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
