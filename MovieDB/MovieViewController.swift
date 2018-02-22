//
//  MovieViewController.swift
//  MovieDB
//
//  Created by kaidong pei on 12/3/17.
//  Copyright © 2017 kaidong pei. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var desc: UITextView!
   
    var getDe: String?
    var getIm: UIImage?
    var getTitle: String?
    var getDate: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.image = getIm
        desc.text = getDe
        name.text = getTitle
        year.text = getDate

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
