//
//  CardSelectionVC.swift
//  cardWorkout
//
//  Created by Blair Duddy on 2023-04-08.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    //outlets required to control image
    @IBOutlet var cardImageView: UIImageView!
    //outlet required to control buttons
    @IBOutlet var buttons: [UIButton]!
    
    //set a variable that will call card.allValues file and use as an array of assets
    var cards: [UIImage] = card.allValues
    // create timer variable
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        
        //button styling
        for button in buttons {
            button.layer.cornerRadius = 8
        }
    }
    //Timer will stop when view changed/rules button clicks
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    //create timer that will iterate through card images at a set interval
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    //objc func required for Selector in startTimer function
    //if unable to unwrap optional or assets unavailable, Ace of Spades will display by default
    @objc func showRandomImage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    //stop timer when "STOP!" button clicked
    @IBAction func stopButttonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    //stop timer and restart timer when "reset" button clicked
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
    
    
}
