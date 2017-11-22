//
//  ShowImageViewController.swift
//  DontMissMe
//
//  Created by Michael Sanchez on 11/15/17.
//  Copyright © 2017 Michael Sanchez. All rights reserved.
//

import UIKit

class ShowImageViewController: UIViewController {

    @IBOutlet weak var theImage: UIImageView!
    var selectedImage: UIImage?
    
    var viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.theImage.image = selectedImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeImage() {
         selectedImage = viewModel.showImage(numberImages: 9)
         self.theImage.image = selectedImage
    }
    
    // MARK: - Navigation

  
    @IBAction func changeImage(_ sender: Any) {
        changeImage()
       
    }
    

}
