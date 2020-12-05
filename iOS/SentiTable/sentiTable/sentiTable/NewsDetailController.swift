//
//  NewsDetailController.swift
//  sentiTable
//
//  Created by sentilab on 2019/12/08.
//  Copyright © 2019 sentilab. All rights reserved.
//

import UIKit

class NewsDetailController : UIViewController {
    
    @IBOutlet weak var ImageMain: UIImageView!
    @IBOutlet weak var LabelMain: UILabel!
    
    //1. image url
    //2. desc
    
    var imageUrl: String?
    var desc: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ok!?
        if let img = imageUrl {
            //이미지 가져와서 뿌린다!
            //Data
            if let data = try? Data(contentsOf: URL(string: img)!) {
                //Main Thread
                DispatchQueue.main.async {
                    self.ImageMain.image = UIImage(data: data)
                }
            }
        }
        
        if let d = desc {
            //본문을 보여준다!
            self.LabelMain.text = d
        }
    }
    
}
