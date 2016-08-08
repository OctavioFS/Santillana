//
//  CategoriasTableViewCell.swift
//  RichmondCatalog
//
//  Created by Yanku on 08/08/16.
//  Copyright © 2016 Yanku. All rights reserved.
//

import UIKit

class CategoriasTableViewCell: UITableViewCell {
    @IBOutlet weak var imgLogoCategoria: UIImageView!

    @IBOutlet weak var imgFlechaCategoria: UIImageView!
    @IBOutlet weak var labelCategoria: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
