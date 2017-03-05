//
//  BandMembersTableViewController.swift
//  29Pair
//
//  Created by Andrew Drechsel on 3/4/17.
//  Copyright © 2017 Andrew Drechsel. All rights reserved.
//

import UIKit
import GameKit

class BandMembersTableViewController: UITableViewController {
    
    var rows = BandMembersController.shared.members.count
    var sectionCount = 1
    
    @IBAction func addButtonTapped(_ sender: Any) {
        
        let alert = UIAlertController(title: "Super Duo!", message: "Add an amazing musician", preferredStyle: UIAlertControllerStyle.alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { (action: UIAlertAction) -> Void  in
        
            guard let newBandMember = alert.textFields?.first?.text else { return }
            
//            let newBandMember = alert.textFields?.first?.text
            BandMembersController.shared.add(name: newBandMember)
            
            self.tableView.reloadData()
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action: UIAlertAction) -> Void in }
        
        alert.addTextField { (textField: UITextField) -> Void in }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)

        
    }
    
    @IBAction func randomizeButtonTapped(_ sender: Any) {
        
        //GKRandomSource in GameKit
        BandMembersController.shared.members.shuffle()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.reloadData()
        
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        if rows <= 2 {
            sectionCount = 1
        } else  {
            sectionCount += 1
        }
        
        return self.sectionCount
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return BandMembersController.shared.members.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bandMemberCell", for: indexPath)

        let bandMember = BandMembersController.shared.members[indexPath.row]
        cell.textLabel?.text = bandMember.name

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 

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

    
    // MARK: - Navigation

//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }

}


extension Array {
    
    mutating func shuffle() {
        
        for _ in 0..<10 {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}




