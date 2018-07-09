//
//  ViewController.swift
//  Silly Song
//
//  Created by Jaotct on 9/7/2561 BE.
//  Copyright © 2561 great corner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameFiled: UITextField!
    @IBOutlet weak var songText: UITextView!
    
    let bananaFanaTemplate = [
        "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
        "Banana Fana Fo F<SHORT_NAME>",
        "Me My Mo M<SHORT_NAME>",
        "<FULL_NAME>"].joined(separator: "\n")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        nameFiled.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func reset(_ sender: Any) {
        nameFiled.text = String()
        songText.text = String()
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        if(nameFiled.text != nil){
            if((nameFiled.text?.count)! > 0){
                songText.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameFiled.text!)
            }else {
                let alert = UIAlertController(title: "Error", message: "Type some Name", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func shortNameForName(name: String) -> String {
        let lowercaseName = name.lowercased()
        let vowelSet = CharacterSet(charactersIn: "aeiou")
        let index:String.Index = (lowercaseName.rangeOfCharacter(from: vowelSet)?.lowerBound)!
        
        return String(lowercaseName.suffix(from: index))
    }
    
    func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
        
        let shortName = shortNameForName(name: fullName)
        
        let lyrics = lyricsTemplate
            .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
            .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
        
        return lyrics
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

