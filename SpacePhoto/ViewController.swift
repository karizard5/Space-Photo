//
//  ViewController.swift
//  SpacePhoto
//
//  Created by Reid, Jon Carl on 11/18/18.
//  Copyright © 2018 Reid, Jon Carl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let photoInfoController = PhotoInfoController()
    
    // initial commit
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var copyrightLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        descriptionLabel.text = ""
        copyrightLabel.text = ""
        photoInfoController.fetchPhotoInfo(completion: {(photoInfo) in
            if let photoInfo = photoInfo{
                DispatchQueue.main.async {
                    self.title = photoInfo.title
                    self.descriptionLabel.text = photoInfo.description
                    if let copyright = photoInfo.copyright{
                        self.copyrightLabel.text = "Copyright: \(copyright)"
                    }
                    else{
                        self.copyrightLabel.isHidden = true
                    }
                }
            }
        })
    }
}

