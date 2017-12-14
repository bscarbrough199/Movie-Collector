//
//  ViewController.swift
//  Movie Collector
//
//  Created by Brent Scarbrough on 12/12/17.
//  Copyright © 2017 Brent Scarbrough. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var movies : [Movie] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
         let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
       movies = try context.fetch(Movie.fetchRequest())
            tableView.reloadData()
        } catch {
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let movie = movies[indexPath.row]
        cell.textLabel?.text = movie.title
        cell.imageView?.image = UIImage(data: movie.image as! Data)
        return cell
        

        
    }


}

