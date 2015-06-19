//
//  MasterViewController.swift
//  AnimalBrowser
//
//  Created by Oliver Foggin on 12/06/2015.
//  Copyright © 2015 Oliver Foggin. All rights reserved.
//

import UIKit

class AnimalListViewController: UITableViewController, UISplitViewControllerDelegate {

    var collapseSplitView = true
    let animalData = AnimalDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.estimatedRowHeight = 80
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        guard let controller = segue.destinationViewController as? UINavigationController,
            detailController = controller.topViewController as? AnimalViewController,
            indexPath = tableView.indexPathForSelectedRow,
            animal: Animal = animalData.animals[indexPath.row]
            else {fatalError("No animal at the index of the cell!")}
        
        detailController.animal = animal
    }

    // MARK: - Table View
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animalData.animals.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: AnimalCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! AnimalCell

        let animal = animalData.animals[indexPath.row]
        cell.nameLabel.text = animal.name
        cell.latinNameLabel.text = animal.latinName
        
        if let imageName = animal.imageName {
            cell.animalImageView.image = UIImage(named: imageName)
        } else {
            cell.animalImageView.image = nil
            cell.animalImageView.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        collapseSplitView = false
    }
    
    // MARK: - Split view
    
    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController:UIViewController, ontoPrimaryViewController primaryViewController:UIViewController) -> Bool {
        return collapseSplitView
    }
}

