//
//  SingleTeamViewController.swift
//  VVScoring
//
//  Created by CLARK, THOMAS on 1/31/17.
//  Copyright © 2017 Q Is Silqent. All rights reserved.
//

import UIKit

class SingleTeamViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let cellReuseIdendifier = "SingleTeamViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(SingleTeamViewCell.self, forCellReuseIdentifier: cellReuseIdendifier)
        
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teamList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdendifier, for: indexPath as IndexPath) as! SingleTeamViewCell
        
        
        
        return cell
    }
}
