//
//  MovieCollectorViewController.swift
//  Movie Collector
//
//  Created by Brent Scarbrough on 12/13/17.
//  Copyright © 2017 Brent Scarbrough. All rights reserved.
//

import UIKit

class MovieCollectorViewController:  UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var deleteTapped: UIButton!
    @IBOutlet weak var addUpdateButton: UIButton!
    @IBOutlet weak var imageBox: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
    
    var imagePicker = UIImagePickerController()
        var movie  : Movie? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        
        if movie != nil {
            imageBox.image = UIImage(data: movie!.image as! Data)
            titleTextField.text = movie!.title
            addUpdateButton.setTitle("Update", for: .normal)
            deleteTapped.setTitle("Delete", for: .normal)
            
            
            
        } else {
            deleteTapped.isHidden = true
        }
        
        
    }
 
    @IBAction func photosTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageBox.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func cameraTapped(_ sender: Any) {
        
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func addImageTapped(_ sender: Any)  { if movie != nil {
        
        movie!.title = titleTextField.text
        movie!.image = UIImagePNGRepresentation(imageBox.image!)
       
        
        
    } else {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let movie = Movie(context: context)
    movie.title = titleTextField.text
    movie.image = UIImagePNGRepresentation(imageBox.image!)

    
    }
        
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
    
    
    @IBAction func deleteTap(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(movie!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
        
    }
    
}
