//
//  DetailUISegmentControl.swift
//  RichmondCatalog
//
//  Created by Yanku on 23/08/16.
//  Copyright © 2016 Yanku. All rights reserved.
//

import UIKit

class DetailUISegmentControl : UIViewController{
    
    //MARK: - carga de valores para las El detalle de la series.
    
    var viaSegueCategoria   :Int!
    var viaSegueSerie       :Int!
    var viaNombreSerie      :String!
    var viaDescripcionSerie :String!
    var viaImagePathA       :String!
    var viaImagePathB       :String!
    var viaCEFR             :Bool!
    var viaCLIL             :Bool!
    var viaAnounced         :Bool!
    var viaApp              :Bool!
    var viaAudio            :Bool!
    var viaBritish          :Bool!
    var viaDigitalBook      :Bool!
    var viaDigitalResources :Bool!
    var viaDvd              :Bool!
    var viaExamFriendly     :Bool!
    var viaHours            :String!
    var viaIbook            :Bool!
    var viaLearning         :Bool!
    var viaLevels           :Int!
    var viaMicrosite        :Bool!
    var viaNew              :Bool!
    var viaSolution         :Bool!
    var viaSpiral           :Bool!
    var viaVideos           :Bool!
    
  // OUTLETS
    @IBOutlet weak var SegmentDetail: UISegmentedControl!
    @IBOutlet weak var VistaUno: UIView!
    @IBOutlet weak var VistaDos: UIView!
    @IBOutlet weak var lblTitleDetail: UILabel!
    @IBOutlet weak var lblSubtitleDetail: UILabel!
    @IBOutlet weak var imgDetail: UIImageView!
    @IBOutlet weak var txtDescriptionDetail: UITextView!
    
    var colorsSegments = [
        UIColor(red:0.965,  green:0.585,  blue:0.116, alpha:0.5),
        UIColor(red:0.090,  green:0.677,  blue:0.753, alpha:0.5),
        UIColor(red:0.565,  green:0.255,  blue:0.580, alpha:0.5),
        UIColor(red:0.097,  green:0.706,  blue:0.580, alpha:0.5),
        UIColor(red:0.928,  green:0.331,  blue:0.345, alpha:0.5),
        UIColor(red:0.893,  green:0.718,  blue:0.035, alpha:0.5),
        UIColor(red:0.820,  green:0.885,  blue:0.208, alpha:0.5),
        UIColor(red:0.274,  green:0.507,  blue:0.710, alpha:0.5)
    ]
    var colorsSeriesSolid = [
        UIColor(red:0.965,  green:0.585,  blue:0.116, alpha:1),
        UIColor(red:0.090,  green:0.677,  blue:0.753, alpha:1),
        UIColor(red:0.565,  green:0.255,  blue:0.580, alpha:1),
        UIColor(red:0.097,  green:0.706,  blue:0.580, alpha:1),
        UIColor(red:0.928,  green:0.331,  blue:0.345, alpha:1),
        UIColor(red:0.893,  green:0.718,  blue:0.035, alpha:1),
        UIColor(red:0.820,  green:0.885,  blue:0.208, alpha:1),
        UIColor(red:0.274,  green:0.507,  blue:0.710, alpha:1)
    ]
    
    //MARK: - ViewDidLoad Detalles
    
    override func viewDidLoad() {
        // logo de richsmond en el Navigation Bar
        let logo = UIImage(named: "logoRichmondC")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        // carga de colores dinamicos deacuerdo a su categoria
        
        SegmentDetail.tintColor = UIColor(red: 0.9882, green: 0.9882, blue: 0.9882, alpha: 1.0)
        
        switch viaSegueCategoria {
        case 1:
            let color       = viaSegueCategoria - 1
            let colorSolid  = viaSegueCategoria - 1
            lblTitleDetail.textColor = colorsSeriesSolid[colorSolid]
            SegmentDetail.backgroundColor = colorsSegments[color]
        case 2:
            let color = viaSegueCategoria - 1
            let colorSolid  = viaSegueCategoria - 1
            lblTitleDetail.textColor = colorsSeriesSolid[colorSolid]
            SegmentDetail.backgroundColor = colorsSegments[color]
        case 3:
            let color = viaSegueCategoria - 1
            let colorSolid  = viaSegueCategoria - 1
            lblTitleDetail.textColor = colorsSeriesSolid[colorSolid]
            SegmentDetail.backgroundColor = colorsSegments[color]
        case 4:
            let color = viaSegueCategoria - 1
            let colorSolid  = viaSegueCategoria - 1
            lblTitleDetail.textColor = colorsSeriesSolid[colorSolid]
            SegmentDetail.backgroundColor = colorsSegments[color]
        case 5:
            let color = viaSegueCategoria - 1
            let colorSolid  = viaSegueCategoria - 1
            lblTitleDetail.textColor = colorsSeriesSolid[colorSolid]
            SegmentDetail.backgroundColor = colorsSegments[color]
        case 6:
            let color = viaSegueCategoria - 1
            let colorSolid  = viaSegueCategoria - 1
            lblTitleDetail.textColor = colorsSeriesSolid[colorSolid]
            SegmentDetail.backgroundColor = colorsSegments[color]
        case 7:
            let color = viaSegueCategoria - 1
            let colorSolid  = viaSegueCategoria - 1
            lblTitleDetail.textColor = colorsSeriesSolid[colorSolid]
            SegmentDetail.backgroundColor = colorsSegments[color]
        case 8:
            let color = viaSegueCategoria - 1
            let colorSolid  = viaSegueCategoria - 1
            lblTitleDetail.textColor = colorsSeriesSolid[colorSolid]
            SegmentDetail.backgroundColor = colorsSegments[color]
        default:
            "Error: no se econtro el color"
        }
        // MARK: - carga inicial de vistas del UISegmentedControl
        VistaUno.hidden = false
        VistaDos.hidden = true
        
        // preuba 
        imgDetail.image = UIImage(named: viaImagePathB)
        lblTitleDetail.text = viaNombreSerie
        txtDescriptionDetail.text = viaDescripcionSerie

    }
    
    // MARK: - Swich de vistas del UISegmentedControl
    
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