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
    //alias de una tuplapara guardar series
    typealias tuplaSeries = (nombreSerie:String,descripcionSerie:String,imagenSerie:String)
    // MARK: - funcion para obtener series
    func obtenerSerie(idCategora: Int) -> [tuplaSeries]{
        
        let path: String = NSBundle.mainBundle().pathForResource("series", ofType: "json")as String!
        let jsonData = NSData(contentsOfFile: path)!
        let readableJSON = JSON(data: jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil)
        
        var contenidoSerie : [tuplaSeries] = []
        
        if let items = readableJSON.array {
            for item in items {
                if let _ = item["name"].string where item["category_idCategory"].intValue == idCategora{
                    
                    let nombreSerie         :String     = item["name"].stringValue
                    let descripcionSerie    :String     = item["description"].stringValue
                    let imagenSerie         :String     = item["imagePathA"].stringValue
                    
                    contenidoSerie.append((nombreSerie:nombreSerie,descripcionSerie:descripcionSerie,imagenSerie:imagenSerie))
                }
            }
        }
        return contenidoSerie
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableViewAutomaticDimension

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
        cell.imgSerie.image         = UIImage(named: arraySerie[indexPath.section].imagenSerie)
        cell.lblDesSerie.text       = arraySerie[indexPath.section].descripcionSerie
        
        return cell
    }

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
