//
//  MainTableViewController.swift
//  DontMissMe
//
//  Created by Michael Sanchez on 11/15/17.
//  Copyright © 2017 Michael Sanchez. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var viewModel = MainViewModel()
    var theImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        sleep(3)
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            print("sound")
            viewModel.playSound(numberSounds: 8)
             performSegue(withIdentifier: "showMusic", sender: nil)
            
        case 1:
            print("image")
            theImage = viewModel.showImage(numberImages: 9)
            performSegue(withIdentifier: "showPicture", sender: nil)
            
        case 2:
            print("callme")
            viewModel.doCallMe()
            
        default:
            //nothing
            print("nothing")
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        //self.theImage.image = sender as? UIImage
      
        if let nextViewController = segue.destination as? ShowImageViewController {
            nextViewController.selectedImage = theImage
        }
    }
}
