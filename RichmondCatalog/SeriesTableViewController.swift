//
//  SeriesTableViewController.swift
//  RichmondCatalog
//
//  Created by Yanku on 08/08/16.
//  Copyright © 2016 Yanku. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class SeriesTableViewController: UITableViewController {
    //MARK: - carga de valores para las series.
    
    // sege de la categoria
    
    var viacategoria : Int!
    
    //alias de una tupla para guardar series
    
    typealias tuplaSeries = (idSeries:Int,
                            category_idCategory: Int,
                            nombreSerie:String,
                            descripcionSerie:String,
                            imagePathA:String,
                            imagePathB: String,
                            CEFR: Bool,
                            CLIL: Bool,
                            announced: Bool,
                            app: Bool,
                            audio: Bool,
                            british: Bool,
                            digitalBook: Bool,
                            digitalResources: Bool,
                            dvd: Bool,
                            examFriendly: Bool,
                            hours: String,
                            iBook: Bool,
                            learning: Bool,
                            levels: Int,
                            microsite: Bool,
                            new: Bool,
                            solution: Bool,
                            spiral: Bool,
                            videos: Bool)
    
    // MARK: - funcion para obtener series
    
    func obtenerSerie(idCategora: Int) -> [tuplaSeries]{
        
        let path: String = NSBundle.mainBundle().pathForResource("series", ofType: "json")as String!
        let jsonData = NSData(contentsOfFile: path)!
        let readableJSON = JSON(data: jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil)
        
        var contenidoSerie : [tuplaSeries] = []
        
        if let items = readableJSON.array {
            for item in items {
                if let _ = item["name"].string where item["category_idCategory"].intValue == idCategora{
                    
                    let idSerie             :Int        = item["idSerie"].intValue
                    let category_idCategory :Int        = item["category_idCategory"].intValue
                    let nombreSerie         :String     = item["name"].stringValue
                    let descripcionSerie    :String     = item["description"].stringValue
                    let imagePathA          :String     = item["imagePathA"].stringValue
                    let imagePathB          :String     = item["imagePathB"].stringValue
                    let CEFR                :Bool       = item["CEFR"].boolValue
                    let CLIL                :Bool       = item["CLIL"].boolValue
                    let announced           :Bool       = item["announced"].boolValue
                    let app                 :Bool       = item["app"].boolValue
                    let audio               :Bool       = item["audio"].boolValue
                    let british             :Bool       = item["british"].boolValue
                    let digitalBook         :Bool       = item["digitalBook"].boolValue
                    let digitalResources    :Bool       = item["digitalResources"].boolValue
                    let dvd                 :Bool       = item["dvd"].boolValue
                    let examFriendly        :Bool       = item["examFriendly"].boolValue
                    let hours               :String     = item["hours"].stringValue
                    let iBook               :Bool       = item["iBook"].boolValue
                    let learning            :Bool       = item["learning"].boolValue
                    let levels              :Int        = item["levels"].intValue
                    let microsite           :Bool       = item["microsite"].boolValue
                    let new                 :Bool       = item["new"].boolValue
                    let solution            :Bool       = item["solution"].boolValue
                    let spiral              :Bool       = item["spiral"].boolValue
                    let videos              :Bool       = item["videos"].boolValue
                    
                    contenidoSerie.append((idSeries:idSerie,category_idCategory: category_idCategory,nombreSerie:nombreSerie,
                        descripcionSerie:descripcionSerie,imagePathA:imagePathA,imagePathB: imagePathB,CEFR: CEFR,CLIL: CLIL,announced: announced,app: app,audio: audio,british: british,digitalBook: digitalBook,digitalResources: digitalResources,dvd: dvd,examFriendly: examFriendly,hours: hours,iBook: iBook,learning: learning,levels: levels,microsite: microsite,new: new,solution: solution,spiral: spiral,videos: videos))
                }
            }
        }
        return contenidoSerie
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.estimatedRowHeight = 150
        //tableView.rowHeight = UITableViewAutomaticDimension
        
        let logo = UIImage(named: "logoRichmondC")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        let nombreSeries = obtenerSerie(viacategoria)
        return nombreSeries.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("seriesCell", forIndexPath: indexPath) as! SerieTableViewCell
        
        let arraySerie = obtenerSerie(viacategoria)
        
        cell.lblSerieTitle.text     = arraySerie[indexPath.section].nombreSerie
        cell.imgSerie.image         = UIImage(named: arraySerie[indexPath.section].imagePathA)
        cell.lblDesSerie.text       = arraySerie[indexPath.section].descripcionSerie
        
        return cell
    }
    /*
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let arraySerie = obtenerSerie(viacategoria)
        
    }
    */
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.+
        
        let path        = self.tableView.indexPathForSelectedRow
        var arraySerie  = obtenerSerie(viacategoria)
        
        //print(arraySerie)
        
        if segue.identifier == "segueDetailSerie"{
            if let destinationVC = segue.destinationViewController as? DetailUISegmentControl{
                
                destinationVC.viaSegueCategoria         = viacategoria
                destinationVC.viaSegueSerie             = arraySerie[(path?.section)!].idSeries
                destinationVC.viaNombreSerie            = arraySerie[(path?.section)!].nombreSerie
                destinationVC.viaDescripcionSerie       = arraySerie[(path?.section)!].descripcionSerie
                destinationVC.viaImagePathA             = arraySerie[(path?.section)!].imagePathA
                destinationVC.viaImagePathB             = arraySerie[(path?.section)!].imagePathB
                destinationVC.viaCEFR                   = arraySerie[(path?.section)!].CEFR
                destinationVC.viaCLIL                   = arraySerie[(path?.section)!].CLIL
                destinationVC.viaAnounced               = arraySerie[(path?.section)!].announced
                destinationVC.viaApp                    = arraySerie[(path?.section)!].app
                destinationVC.viaAudio                  = arraySerie[(path?.section)!].audio
                destinationVC.viaBritish                = arraySerie[(path?.section)!].british
                destinationVC.viaDigitalBook            = arraySerie[(path?.section)!].digitalBook
                destinationVC.viaDigitalResources       = arraySerie[(path?.section)!].digitalResources
                destinationVC.viaDvd                    = arraySerie[(path?.section)!].dvd
                destinationVC.viaExamFriendly           = arraySerie[(path?.section)!].examFriendly
                destinationVC.viaHours                  = arraySerie[(path?.section)!].hours
                destinationVC.viaIbook                  = arraySerie[(path?.section)!].iBook
                destinationVC.viaLearning               = arraySerie[(path?.section)!].learning
                destinationVC.viaLevels                 = arraySerie[(path?.section)!].levels
                destinationVC.viaMicrosite              = arraySerie[(path?.section)!].microsite
                destinationVC.viaNew                    = arraySerie[(path?.section)!].new
                destinationVC.viaSolution                = arraySerie[(path?.section)!].solution
                destinationVC.viaSpiral                 = arraySerie[(path?.section)!].spiral
                destinationVC.viaVideos                 = arraySerie[(path?.section)!].videos

             }
        }
    }

}
