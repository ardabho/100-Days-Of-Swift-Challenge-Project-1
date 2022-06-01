//
//  ViewController.swift
//  100 Days Of Swift-Challenge Project 1
//
//  Created by Arda Büyükhatipoğlu on 1.06.2022.
//

import UIKit

class ViewController: UITableViewController {
    
    var imageNameArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Flags"
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("3x.png"){
                imageNameArray.append(item)
            }
        }
        
    }
    
    //MARK: - TableView Data Source Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        imageNameArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath)
        cell.textLabel?.text = imageNameArray[indexPath.row].replacingOccurrences(of: "@3x.png", with: "").uppercased()
        cell.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
    
        return cell
    }

    
    //MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.imageName = imageNameArray[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

