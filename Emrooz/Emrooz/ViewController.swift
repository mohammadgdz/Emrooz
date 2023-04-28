//
//  ViewController.swift
//  Emrooz
//
//  Created by Mohammad on 2023-04-23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var todayLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        //today label codes
        let now = Date()
        let formater = DateFormatter()
        formater.dateStyle = .long
        formater.calendar = Calendar(identifier: .persian)
        formater.locale = Locale(identifier: "fa_IR")
        formater.dateFormat = "EEEE\ndd MMM YYYY"
        todayLabel.text = formater.string(from: now)
        
        let persianCal = Calendar(identifier: .persian)
        let thisMonth = persianCal.component(.month, from: Date())
        
        switch thisMonth {
            
        case 1...3:
            imageView.image = UIImage(named: "bgSpring")
            break
        case 4...6:
            imageView.image = UIImage(named: "bgSummer")
            break
        case 6...9:
            imageView.image = UIImage(named: "bgSFall")
            break
        default:
            imageView.image = UIImage(named: "bgWinter")
        }
        
        todayLabel.alpha = 0
        todayLabel.transform = CGAffineTransform(translationX: 0, y: -100)
    }

    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1){
            self.todayLabel.alpha = 1
            self.todayLabel.transform = CGAffineTransform(translationX: 0, y: 0)
        }
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        todayLabel.alpha = 0
        todayLabel.transform = CGAffineTransform(translationX: 0, y: -100)
    }

}

