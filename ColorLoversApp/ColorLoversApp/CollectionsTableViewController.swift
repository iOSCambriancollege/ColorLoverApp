//
//  CollectionsTableViewController.swift
//  ColorLoversApp
//
//  Created by Shaik Mathar Syed on 13/12/23.
//

import UIKit
import CoreData

class CollectionsTableViewController: UITableViewController {

    var paletteHistory: [MagicGenViewController.Color] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPalettes()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    func fetchPalettes() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Palette")

        do {
            let palettes = try context.fetch(fetchRequest)
            for palette in palettes {
                if let colors = palette.value(forKey: "palettes") as? [MagicGenViewController.Color] {
                    paletteHistory.append(colors[0])
                    print(paletteHistory)
                }
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return paletteHistory.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "collectionCell", for: indexPath) as! CollectionsTableViewCell

        let color = paletteHistory[indexPath.row]
        print(color)

        // Configure the cell...
        cell.colorLabel1.text = "#" + color.color1Hex
        cell.colorLabel1.backgroundColor = UIColor(hex: "\(color.color1Hex)")
        cell.colorLabel2.text = "#" + color.color2Hex
        cell.colorLabel2.backgroundColor = UIColor(hex: "\(color.color2Hex)")
        cell.colorLabel3.text = "#" + color.color3Hex
        cell.colorLabel3.backgroundColor = UIColor(hex: "\(color.color3Hex)")
        cell.colorLabel4.text = "#" + color.color4Hex
        cell.colorLabel4.backgroundColor = UIColor(hex: "\(color.color4Hex)")
        cell.colorLabel5.text = "#" + color.color5Hex
        cell.colorLabel5.backgroundColor = UIColor(hex: "\(color.color5Hex)")

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
