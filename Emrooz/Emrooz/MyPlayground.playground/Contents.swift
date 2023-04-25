import UIKit


let now = Date()

let tommorow = Date(timeIntervalSinceNow: 5600)




let formater = DateFormatter()

formater.dateStyle = .short
formater.calendar = Calendar(identifier: .persian)
formater.locale = Locale(identifier: "fa_IR")
formater.dateFormat = "dd - MMM - YYYY"

let str:String = formater.string(from: now)
