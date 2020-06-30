//
//  ViewController.swift
//  SLCalc
//
//  Created by Kristian Myhre on 30/06/2020.
//  Copyright © 2020 Kristian Myhre. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let parties: [Party] = [Party(name: "Høyre", votes: 6100), Party(name: "Venstre", votes: 5000), Party(name: "Sosialistisk Venstreparti", votes: 8400)]
        calculateElection(seatsToAllocate: 10, partiesArray: parties)

    }


}

