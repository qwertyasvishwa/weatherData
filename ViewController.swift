//
//  ViewController.swift
//  weatherData
//
//  Created by Vishwa Raj on 18/10/16.
//  Copyright © 2016 innov8. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var forecast: UILabel!
    @IBOutlet weak var inputCity: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = URL(string: "http://www.weather-forecast.com/locations/Bangalore/forecasts/latest")!
        
        let request = NSMutableURLRequest(url:url)
        let task = URLSession.shared.dataTask(with: request as URLRequest)
        {
            data, response, error in
            
            if error != nil
            {
                print(error)
                
            }
            else{
                if let unwrappedData = data {
                    let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
//                    print(dataString)
                    var stringSeparator = "Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">"
                    if let contentArray = dataString?.components(separatedBy: stringSeparator)
                    {
                        if contentArray.count > 0
                        {
                            stringSeparator = "</span>"
                            if var newContentArray = contentArray[1].components(separatedBy: stringSeparator)
                            {
                                if newContentArray.count > 0
                                {
                                    print(newContentArray[0])
                                }
                            }
                            
                        }
                    }
                }
                
            }
        }
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func submit(_ sender: UIButton) {
        
    }

}

