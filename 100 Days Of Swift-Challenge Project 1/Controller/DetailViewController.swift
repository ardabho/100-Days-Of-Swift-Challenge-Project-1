//
//  DetailViewController.swift
//  100 Days Of Swift-Challenge Project 1
//
//  Created by Arda Büyükhatipoğlu on 1.06.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var imageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(buttonTapped))
        
        if let image = imageName {
            imageView.image = UIImage(named: image)
        }
        
    }
    
    func setupUI() {
        navigationItem.largeTitleDisplayMode = .never
        title = imageName?.replacingOccurrences(of: "@3x.png", with: "").uppercased()
        view.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        imageView.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
    }
    
    @objc func buttonTapped() {
        guard let image = imageView.image else {
            print("No Image Data Found")
            return
        }
        
    let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    
    
}
