//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Vasichko Anna on 15.05.2023.
//

import UIKit

final class ResultViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var infoLabel: UILabel!
    
    var answersChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFinalResult()
        navigationItem.hidesBackButton = true
        
    }

    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    deinit {
        print("ResultViewController is deallocated")
    }
    
    private func getFinalResult(){
        
        var answers = ["dog": 0, "cat": 0, "rabbit": 0, "turtle": 0]
        
        var winnerScore = 0
        var winnerName = ""
        var winnerIndex = ""
        var def = ""
        
        for answer in answersChosen {
            switch answer.animal {
            case .dog:
                answers["dog"]! += 1
            case .cat:
                answers["cat"]! += 1
            case .rabbit:
                answers["rabbit"]! += 1
            default:
                answers["turtle"]! += 1
            }
        }
        
        for answer in answers{
            if answer.value > winnerScore {
                winnerScore = answer.value
                winnerName = answer.key
                switch winnerName{
                    case "dog": winnerIndex = "🐶"
                    case "cat": winnerIndex = "🐱"
                    case "rabbit": winnerIndex = "🐰"
                    default: winnerIndex = "🐢"
                }
            }
        }
        for answer in answersChosen{
            switch answer.animal{
                
            case .dog:
                if winnerName == "dog"{
                    def = answer.animal.definition
                }
            case .cat:
                if winnerName == "cat"{
                    def = answer.animal.definition
                }
            case .rabbit:
                if winnerName == "rabbit"{
                    def = answer.animal.definition
                }
            case .turtle:
                if winnerName == "turtle"{
                    def = answer.animal.definition
                }
            }
        }
        
        resultLabel.text = "Вы - \(winnerIndex)"
        infoLabel.text = def
    
    }
}
