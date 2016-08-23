//
//  SerieTableViewCell.swift
//  RichmondCatalog
//
//  Created by Yanku on 08/08/16.
//  Copyright © 2016 Yanku. All rights reserved.
//

import UIKit

class SerieTableViewCell: UITableViewCell {
    @IBOutlet weak var imgSerie: UIImageView!
    @IBOutlet weak var lblSerieTitle: UILabel!
    @IBOutlet weak var lblDesSerie: UILabel!
    @IBOutlet weak var imgFlechaSerie: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
