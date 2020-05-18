//
//  ViewController.swift
//  CoronaAPI
//
//  Created by Jason Adrian on 17/05/20.
//  Copyright © 2020 JasonAdrian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var confirmedLabel: UILabel!
    @IBOutlet weak var deathLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    @IBOutlet weak var activeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let url = URL(string: "https://api.covid19api.com/country/indonesia"){
            URLSession.shared.dataTask(with: url){data, response, error in
                if let data = data {
                    do{
                        let result = try JSONDecoder().decode([res].self, from: data)
                        DispatchQueue.main.async {
                            self.confirmedLabel.text = String(result[result.count-1].Confirmed)
                            self.deathLabel.text = String(result[result.count-1].Deaths)
                            self.recoveredLabel.text = String(result[result.count-1].Recovered)
                            self.activeLabel.text = String(result[result.count-1].Active)
                        }
//                        print(result[result.count-1].Confirmed)
//                        print(result[result.count-1].Deaths)
//                        print(result[result.count-1].Recovered)
//                        print(result[result.count-1].Active)
                        
                    }catch let error{
                        print(error)
                    }
                }
            }.resume()
        }
    }
}

struct res : Codable{
    let Country : String
    let CountryCode : String
    let Province : String
    let City : String
    let CityCode : String
    let Lat : String
    let Lon : String
    let Confirmed : Int
    let Deaths : Int
    let Recovered : Int
    let Active : Int
    let Date : String
}

