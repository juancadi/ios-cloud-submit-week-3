//
//  BookDetailViewController.swift
//  OpenLibrary
//
//  Created by JUAN ANDRÉS CÁRDENAS DIAZ on 17/01/16.
//  Copyright © 2016 JUAN ANDRÉS CÁRDENAS DIAZ. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    
    
    @IBOutlet weak var lblBookIsbn: UILabel!
    
    @IBOutlet weak var lblBookAuthor: UILabel!
    
    @IBOutlet weak var imgBookCover: UIImageView!
    
    var bookDetail : Book?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        if bookDetail != nil {
            
            title = bookDetail!.name
            lblBookIsbn.text = bookDetail!.isbn
            lblBookAuthor.text = bookDetail!.authors
            
            if bookDetail!.imgCover != nil {
            
                imgBookCover.image = bookDetail!.imgCover
            
            }else{
                
                let syncHttp = SyncHttpConnection()
                let imgCoverResponse = syncHttp.downloadImage(bookDetail!.urlCover!)
                
                if imgCoverResponse.success{
                
                    imgBookCover.image = imgCoverResponse.image
                
                }else{
                
                    imgBookCover.image = UIImage(named: "poster_not_available");
                }
                
            }
        
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
