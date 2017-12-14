//
//  MovieCollectorViewController.swift
//  Movie Collector
//
//  Created by Brent Scarbrough on 12/13/17.
//  Copyright © 2017 Brent Scarbrough. All rights reserved.
//

import UIKit

class MovieCollectorViewController:  UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageBox: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        
    }
 
    @IBAction func photosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: Any) {
    }
    @IBAction func addImageTapped(_ sender: Any) {
    }
    
}
