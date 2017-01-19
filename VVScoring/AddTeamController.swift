//
//  AddTeamController.swift
//  VVScoring
//
//  Created by CLARK, THOMAS on 1/18/17.
//  Copyright © 2017 Q Is Silqent. All rights reserved.
//

import UIKit

class AddTeamController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate {
    
    let cellReuseIdendifier: String = "addTeamCell"
    var tempTeamList: [(num: String, name: String)] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(addTeamCell.self, forCellReuseIdentifier: cellReuseIdendifier)
        
        tableView.dataSource = self
        tableView.delegate = self
        
        loadList()
    }
    
    func loadList(){
        tempTeamList = []
        var x = 0
        for (num, val) in teamList{
            tempTeamList[x].num = num
            tempTeamList[x].name = val.name
            x += 1
        }
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
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func plusButton(_ sender: AnyObject) {
        tempTeamList.append(("-", "-"))
        tableView.reloadData()
    }
    
    @IBAction func saveButton(_ sender: AnyObject) {
        var output: [String: (name: String, fav: Bool)] = [:]
        for x in 0..<tempTeamList.count{
            output[tempTeamList[x].num] = (tempTeamList[x].name, false)
        }
        teamList = output
        self.removeAnimate()
    }
    
    @IBAction func closeButton(_ sender: AnyObject) {
        self.removeAnimate()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCellEditingStyle.delete{
            tempTeamList.remove(at: indexPath.row)
        }
    }
    
    func teamNumberEdit(_ sender: AnyObject) {
        // get a reference to the view controller for the popover
        let popController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "numPad")
        
        // set the presentation style
        popController.modalPresentationStyle = UIModalPresentationStyle.popover
        
        // set up the popover presentation controller
        popController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.up
        popController.popoverPresentationController?.delegate = self
        popController.popoverPresentationController?.sourceView = sender as? UIView // button
        popController.popoverPresentationController?.sourceRect = sender.bounds
        
        // present the popover
        self.present(popController, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempTeamList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdendifier, for: indexPath as IndexPath) as! addTeamCell
        
        cell.labels["number"]?.Label.placeholder = "Number"
        cell.labels["number"]?.Label.addTarget(self, action: #selector(self.teamNumberEdit(_:)), for: UIControlEvents.touchUpInside)
        
        cell.labels["name"]?.Label.placeholder = "Name"
        
        return cell
    }

}
