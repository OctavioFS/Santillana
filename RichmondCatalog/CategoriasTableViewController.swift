//
//  CategoriasTableViewController.swift
//  RichmondCatalog
//
//  Created by Yanku on 08/08/16.
//  Copyright © 2016 Yanku. All rights reserved.
//

import UIKit

class CategoriasTableViewController: UITableViewController {   
    
    //MARK: -valores iniciales para la categoria
    
    var categorias : [String] =  ["PRESCHOOL","PRIMARY","SECONDARY","YOUNG ADULTS","SUPPLEMENTARY","EXAMS","DIGITAL","READERS"]
    
    var colors = [
        UIColor(red:0.965,  green:0.585,  blue:0.116, alpha:1),
        UIColor(red:0.090,  green:0.677,  blue:0.753, alpha:1),
        UIColor(red:0.565,  green:0.255,  blue:0.580, alpha:1),
        UIColor(red:0.097,  green:0.706,  blue:0.580, alpha:1),
        UIColor(red:0.928,  green:0.331,  blue:0.345, alpha:1),
        UIColor(red:0.893,  green:0.718,  blue:0.035, alpha:1),
        UIColor(red:0.820,  green:0.885,  blue:0.208, alpha:1),
        UIColor(red:0.274,  green:0.507,  blue:0.710, alpha:1)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableViewAutomaticDimension
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func viewDidAppear(animated: Bool) {
        
      
        navigationController?.navigationBar.translucent = true
        navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.blackColor()]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return categorias.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("categoriaCell", forIndexPath: indexPath) as! CategoriasTableViewCell
        
        cell.labelCategoria?.text        = categorias[indexPath.section]
        cell.backgroundColor            = colors[indexPath.section]
        //cell.imgFlechaCategoria.image   = UIImage(named: "feclaCategoria")

        // Configure the cell...

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        navigationController?.navigationBar.translucent = false
        navigationController?.navigationBar.barTintColor = colors[indexPath.section]
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
    
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


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let path = self.tableView.indexPathForSelectedRow
        var indiceCategoria : Int = 0
        
        switch categorias[(path?.section)!] {
            
        case "PRESCHOOL":
            indiceCategoria = 1
            break
        case "PRIMARY":
            indiceCategoria = 2
            break
        case "SECONDARY":
            indiceCategoria = 3
            break
        case "YOUNG ADULTS":
            indiceCategoria = 4
            break
        case "SUPPLEMENTARY":
            indiceCategoria = 5
            break
        case "EXAMS":
            indiceCategoria = 6
            break
        case "DIGITAL":
            indiceCategoria = 7
            break
        case "READERS":
            indiceCategoria = 8
            break
        default:
            indiceCategoria = 0
            break
        }
        
        print("inidice de la categoria: \(indiceCategoria)")
        
        if segue.identifier == "segeSeries" {
            
            if let destinationVC = segue.destinationViewController as? SeriesTableViewController {
                destinationVC.viacategoria = indiceCategoria
            }
        }
    }

}
