import Foundation

// Blab struct defined a blab: blabString, timeStamp,
struct Blab {
    let username : String
    let blabString : String
    let time : NSDate
}

let date1 = NSDate(timeIntervalSinceNow: -500.0)
let date2 = NSDate(timeIntervalSinceNow: -3800.0)
let date3 = NSDate(timeIntervalSinceNow: -467000.0)
let date4 = NSDate(timeIntervalSinceNow: -724120.0)

let testBlab1 = Blab(username: "Stine", blabString: "Can we go to Grizzly Peak?", time: date1)

let testBlab2 = Blab(username: "Nagoogin", blabString: "It smells like asparagus piss", time: date2)

let testBlab3 = Blab(username: "Posadinho", blabString: "I'm a light blue Bruin", time: date3)

let testBlab4 = Blab(username: "Jungsoo", blabString: "I like Kim Chi Noodles", time: date4)

