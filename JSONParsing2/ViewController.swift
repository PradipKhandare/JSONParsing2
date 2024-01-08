//
//  ViewController.swift
//  JSONParsing2
//
//  Created by NTS on 08/01/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    //API:- https://tools.learningcontainer.com/sample-json.json

    override func viewDidLoad() {
        super.viewDidLoad()
        parseData()
        
    }

    func parseData(){
        guard let url = URL(string: "https://tools.learningcontainer.com/sample-json.json") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error!)
                return
            }
            
            if let safeData = data {
                do{
                    let jsonData = try JSONDecoder().decode(PersonDataModel.self, from: safeData)
                    DispatchQueue.main.async {
                        self.firstNameLabel.text = jsonData.firstName
                        self.lastNameLabel.text = jsonData.lastName
                        self.ageLabel.text = "\(jsonData.age)"
                        self.genderLabel.text = jsonData.gender
                    }
                }catch{
                    print(error)
                }
            }
        }
        .resume()
    }

}

