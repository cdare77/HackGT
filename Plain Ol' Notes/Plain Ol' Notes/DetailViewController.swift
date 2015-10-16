//
//  DetailViewController.swift
//  Plain Ol' Notes
//
//  Created by Chris Dare on 10/1/15.
//  Copyright © 2015 Chris Dare. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UITextView!


    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        if objects.count == 0 {
            return
        }
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = objects[currentIndex]
                if label.text == BLANK_NOTE {
                    label.text = ""
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        detailViewController = self
        detailViewController?.becomeFirstResponder()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveAndUpdate() {
        masterView?.save()
        masterView?.tableView.reloadData()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        if objects.count == 0 {
            return
        }
        objects[currentIndex] = detailDescriptionLabel.text
        
        if detailDescriptionLabel.text == "" {
            objects[currentIndex] = BLANK_NOTE
        }
        saveAndUpdate()
    }


}

