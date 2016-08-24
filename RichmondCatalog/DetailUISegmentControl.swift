//
//  DetailUISegmentControl.swift
//  RichmondCatalog
//
//  Created by Yanku on 23/08/16.
//  Copyright © 2016 Yanku. All rights reserved.
//

import UIKit

class DetailUISegmentControl : UIViewController{
    
    var viaSegueSerie : Int!
    
    @IBOutlet weak var SegmentDetail: UISegmentedControl!
    @IBOutlet weak var VistaUno: UIView!
    @IBOutlet weak var VistaDos: UIView!
    @IBOutlet weak var lblUuno: UILabel!
    @IBOutlet weak var lblDos: UILabel!
    
    override func viewDidLoad() {
        
        let logo = UIImage(named: "logoRichmondC")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        VistaUno.hidden = false
        VistaDos.hidden = true
        
        SegmentDetail.backgroundColor = UIColor(red: 0.9255, green: 0.7804, blue: 0.5608, alpha: 1.0)
        SegmentDetail.tintColor = UIColor(red: 0.9882, green: 0.9882, blue: 0.9882, alpha: 1.0)
    }
    
    @IBAction func indexChanged(sender: UISegmentedControl) {
        
        switch SegmentDetail.selectedSegmentIndex {
            
        case 0:
            VistaUno.hidden = false
            VistaDos.hidden = true
        case 1:
            VistaUno.hidden = false
            VistaDos.hidden = true
        case 2:
            VistaUno.hidden = false
            VistaDos.hidden = true
        case 3:
            VistaUno.hidden = true
            VistaDos.hidden = false
            
        default:
            break;
        }
    }
    

}