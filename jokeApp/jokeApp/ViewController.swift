//
//  ViewController.swift
//  jokeApp
//
//  Created by Aryan on 03/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var JokeLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func PressMeBtn(_ sender: Any) {
        
        
        
        
        let url = URL(string: "https://v2.jokeapi.dev/joke/Any")!

                let task = URLSession.shared.dataTask(with: url) { data, response, error in
        //            print(response!)
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, Any>
        //                print(json)
                        
                        
                        if(json["setup"] != nil){
                            print((json["setup"]))
                            JokeLabel.text = json["setup"] as! String
                        }else if(json["joke"] != nil){
                            print(json["joke"])
                            JokeLabel.text =  json["joke"] as! String
                        }
        //                let ci = json[String(0)] ?? 0
        //                print(ci)
                 
                    } catch {
                        print("error")
                    }
                }

                task.resume()
        
        
        
        
           }
        
        
    
}

