//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Our strings
    let story1 = "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: \"Need a ride, boy?\"."
    let answer1a = "I\'ll hop in. Thanks for the help!"
    let answer1b = "Better ask him if he\'s a murderer first."
    
    
    let story2 = "He nods slowly, unphased by the question."
    let answer2a = "At least he\'s honest. I\'ll climb in."
    let answer2b = "Wait, I know how to change a tire."
    
    let story3 = "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box."
    let answer3a = "I love Elton John! Hand him the cassette tape."
    let answer3b = "It\'s him or me! You take the knife and stab him."
    
    let story4 = "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?"
    let story5 = "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in."
    let story6 = "You bond with the murderer while crooning verses of \"Can you feel the love tonight\". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: \"Try the pier.\""
    
    
    let BUTTON_TOP = 1
    let BUTTON_BOTTOM = 2
    var currentStory = 1
    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    
    // TODO Step 5: Initialise instance variables here
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // TODO Step 3: Set the text for the storyTextView, topButton, bottomButton, and to T1_Story, T1_Ans1, and T1_Ans2
        initStory()
    }

    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
    
        // TODO Step 4: Write an IF-Statement to update the views
                
        // TODO Step 6: Modify the IF-Statement to complete the story
        let currentAvailableAns = checkButtonAnswer()
        let userAns = sender.tag == BUTTON_TOP ? currentAvailableAns.anw1 : currentAvailableAns.ans2
        if storySelection(userAns){
            showEndAlert()
        }
    }
    
    func initStory() {
        storyTextView.text = story1
        setButtonTitle(answer1a, answer1b)
        
    }
    
    func setButtonTitle(_ titleTop: String, _ titleBottom: String) {
        topButton.setTitle(titleTop, for: UIControlState.normal)
        bottomButton.setTitle(titleBottom, for: UIControlState.normal)
    }
    
    func checkButtonAnswer() -> (anw1: String, ans2: String) {
        var ans1: String
        var ans2: String
        switch currentStory {
        case 2:
            ans1 = "answer2a"
            ans2 = "answer2b"
        case 3:
            ans1 = "answer3a"
            ans2 = "answer3b"
        default:
            ans1 = "answer1a"
            ans2 = "answer1b"
        }
        return(ans1, ans2)
    }
    
    func storySelection(_ answer: String) -> Bool {
        var storyEnd = false
        switch answer {
        case "answer1a", "answer2a":
            currentStory = 3
            storyTextView.text = story3
            setButtonTitle(answer3a, answer3b)
        case "answer1b":
            currentStory = 2
            storyTextView.text = story2
            setButtonTitle(answer2a, answer2b)
        case "answer2b":
            storyTextView.text = story4
            storyEnd = true
        case "answer3a":
            storyTextView.text = story6
            storyEnd = true
        case "answer3b":
            storyTextView.text = story5
            storyEnd = true
        default:
            storyTextView.text = story1
        }
        return storyEnd
    }
    
    func showEndAlert() {
        let alert = UIAlertController(title: "Awesome", message: "Story Ended?", preferredStyle: .alert)
        
        let endAction = UIAlertAction(title: "Restart", style: .default , handler: { (UIAlertAction) in
            self.initStory()
            self.currentStory = 1
        })
        alert.addAction(endAction)
        present(alert, animated: true, completion: nil)
    }
}

