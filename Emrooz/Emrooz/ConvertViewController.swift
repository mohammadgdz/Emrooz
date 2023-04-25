//
//  ConvertViewController.swift
//  Emrooz
//
//  Created by Mohammad on 2023-04-24.
//

import UIKit

class ConvertViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        datePicker.calendar = Calendar(identifier: .persian)
        datePicker.locale = Locale(identifier: "fa_IR")
        
        
        label.text = self.convertDate()
        
        
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
            label.textColor = UIColor.white
        }
        
        self.datePicker.alpha = 0
        label.alpha = 0
        label.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        
        // Do any additional setup after loading the view.
    }
    

    
    
    @IBAction func pickerChanged() {
        
        label.text = self.convertDate()

    }
    
    
    
    func convertDate () -> String {
        let pickerDate = datePicker.date
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateStyle = .long
        return formatter.string(from: pickerDate)

    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1){
            self.datePicker.alpha = 1
            self.label.alpha = 1
            self.label.transform = CGAffineTransform(scaleX: 1, y: 1)
            
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
