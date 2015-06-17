//
//  DetailViewController.swift
//  AnimalBrowser
//
//  Created by Oliver Foggin on 12/06/2015.
//  Copyright © 2015 Oliver Foggin. All rights reserved.
//

import UIKit

class AnimalViewController: UIViewController {

    var animal: Animal = {
        return AnimalDataSource().animals[0]
    }()
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var latinNameLabel: UILabel!
    @IBOutlet weak var animalImageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var authorNameLabel: UILabel!
    @IBOutlet weak var authorImageView: UIImageView!
    
    func configureView() {
        // Update the user interface for the detail item.
        title = animal.name
        nameLabel.text = animal.name
        latinNameLabel.text = animal.latinName
        textView.text = animal.text
        authorNameLabel.text = animal.authorName
        authorImageView.image = UIImage(named: animal.authorPhotoName)
        
        if let imageName = animal.imageName {
            animalImageView.hidden = false
            animalImageView.image = UIImage(named: imageName)
        } else {
            animalImageView.hidden = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
        navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem()
        navigationItem.leftItemsSupplementBackButton = true
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        view.layoutIfNeeded()
    }
}

