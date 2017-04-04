//
//  CommentPop.swift
//  VVScoring
//
//  Created by CLARK, THOMAS on 3/22/17.
//  Copyright © 2017 Q Is Silqent. All rights reserved.
//

import UIKit

class CommentPop: UIViewController {

    /*
     let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tournamentSelectTV") as! TournamentSelectController
     self.addChildViewController(popOverVC)
     popOverVC.view.frame = self.view.frame
     self.view.addSubview(popOverVC.view)
     popOverVC.didMove(toParentViewController: self)
    */
    //MARK: Properties:
    
    //Team Labels
    @IBOutlet weak var red1: UILabel!
    @IBOutlet weak var red2: UILabel!
    @IBOutlet weak var blue1: UILabel!
    @IBOutlet weak var blue2: UILabel!
    
    //Text views
    @IBOutlet weak var matchField: UITextView!
    @IBOutlet weak var red1Field: UITextView!
    @IBOutlet weak var red2Field: UITextView!
    @IBOutlet weak var blue1Field: UITextView!
    @IBOutlet weak var blue2Field: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.showAnimate()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        
        let match = matchData[currentMatch]
        
        //Match field
        matchField.text = match[0].matchComment
        
        //Red 1
        red1Field.text = match[0].teamComment
        red1.text = String(match[0].number)
        
        //Red2
        red2Field.text = match[1].teamComment
        red2.text = String(match[1].number)
        
        //Blue 1
        blue1Field.text = match[2].teamComment
        blue1.text = String(match[2].number)
        
        blue2Field.text = match[3].teamComment
        blue2.text = String(match[3].number)
    }
    
    @IBAction func close(_ sender: Any) {
        matchData[currentMatch][0].matchComment = matchField.text
        matchData[currentMatch][0].teamComment = red1Field.text
        
        matchData[currentMatch][1].matchComment = matchField.text
        matchData[currentMatch][1].teamComment = red2Field.text
        
        matchData[currentMatch][2].matchComment = matchField.text
        matchData[currentMatch][2].teamComment = blue1Field.text
        
        matchData[currentMatch][3].matchComment = matchField.text
        matchData[currentMatch][3].teamComment = blue2Field.text
        removeAnimate()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAnimate(){
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        })
    }
    
    func removeAnimate(){
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }

}
