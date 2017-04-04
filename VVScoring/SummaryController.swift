//
//  SummaryController.swift
//  VVScoring
//
//  Created by Tom Clark on 3/30/17.
//  Copyright © 2017 Q Is Silqent. All rights reserved.
//

import UIKit

class SummaryController: UIViewController {

    //MARK: Properties
    
    @IBOutlet weak var matchNumber: UILabel!
    
    //Comments
    @IBOutlet weak var matchCom: UILabel!
    @IBOutlet weak var Red1Com: UILabel!
    @IBOutlet weak var Red2Com: UILabel!
    @IBOutlet weak var Blue1Com: UILabel!
    @IBOutlet weak var Blue2Com: UILabel!
    
    //Team Info
    @IBOutlet weak var r1num: UILabel!
    @IBOutlet weak var r1Name: UILabel!
    @IBOutlet weak var r2num: UILabel!
    @IBOutlet weak var r2Name: UILabel!
    @IBOutlet weak var b1num: UILabel!
    @IBOutlet weak var b1Name: UILabel!
    @IBOutlet weak var b2num: UILabel!
    @IBOutlet weak var b2Name: UILabel!
    
    //Red 1 Stats
    @IBOutlet weak var r1autoBeac: UILabel!
    @IBOutlet weak var r1autoVor: UILabel!
    @IBOutlet weak var r1teleBalls: UILabel!
    @IBOutlet weak var r1Cap: UILabel!
    
    //Red 2 Stats
    @IBOutlet weak var r2autoBeac: UILabel!
    @IBOutlet weak var r2autoVor: UILabel!
    @IBOutlet weak var r2teleBalls: UILabel!
    @IBOutlet weak var r2Cap: UILabel!
    
    //Blue 1 Stats
    @IBOutlet weak var b1autoBeac: UILabel!
    @IBOutlet weak var b1autoVor: UILabel!
    @IBOutlet weak var b1teleBalls: UILabel!
    @IBOutlet weak var b1Cap: UILabel!
    
    //Blue 2 Stats
    @IBOutlet weak var b2autoBeac: UILabel!
    @IBOutlet weak var b2autoVor: UILabel!
    @IBOutlet weak var b2teleBalls: UILabel!
    @IBOutlet weak var b2Cap: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showAnimate()
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        
        setLabels()
    }
    
    func setLabels(){
        let data = matchData[currentMatch]
        
        matchNumber.text = "Match \(currentMatch+1)"
        
        //Comments
        Red1Com.text = data[0].teamComment != "" ? data[0].teamComment : "No Comment"
        Red2Com.text = data[1].teamComment != "" ? data[1].teamComment : "No Comment"
        Blue1Com.text = data[2].teamComment != "" ? data[2].teamComment : "No Comment"
        Blue2Com.text = data[3].teamComment != "" ? data[3].teamComment : "No Comment"
        matchCom.text = data[0].matchComment != "" ? data[0].matchComment : "No Comment"
        
        //Team Info
        r1num.text = String(data[0].number)
        r1Name.text = teamList["\(data[0].number)"]?.name
        
        r2num.text = String(data[1].number)
        r2Name.text = teamList["\(data[1].number)"]?.name
        
        b1num.text = String(data[2].number)
        b1Name.text = teamList["\(data[2].number)"]?.name
        
        b2num.text = String(data[3].number)
        b2Name.text = teamList["\(data[3].number)"]?.name
        
        //Stats
        //Red 1
        r1autoBeac.text = String(data[0].autoBeacons)
        r1autoVor.text = String(data[0].autoVortex)
        r1teleBalls.text = String(data[0].vortexBalls)
        r1Cap.text = String(data[0].capBallPts)
        
        //Red 2
        r2autoBeac.text = String(data[1].autoBeacons)
        r2autoVor.text = String(data[1].autoVortex)
        r2teleBalls.text = String(data[1].vortexBalls)
        r2Cap.text = String(data[1].capBallPts)
        
        //Blue 1
        b1autoBeac.text = String(data[2].autoBeacons)
        b1autoVor.text = String(data[2].autoVortex)
        b1teleBalls.text = String(data[2].vortexBalls)
        b1Cap.text = String(data[2].capBallPts)
        
        //Blue 2
        b2autoBeac.text = String(data[3].autoBeacons)
        b2autoVor.text = String(data[3].autoVortex)
        b2teleBalls.text = String(data[3].vortexBalls)
        b2Cap.text = String(data[3].capBallPts)
    }
    
    @IBAction func back(_ sender: Any) {
        removeAnimate()
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
