import Foundation

let ref = Firebase(url: "https://blurp.firebaseio.com")

// Blab struct defined a blab: blabString, timeStamp,
class Blab {
    var username : String?
    var blabString : String?
    var timeStamp : NSDate?
    
    var connections: Array<Edge>
    
    init(username: String, blabString: String, timeStamp: NSDate) {
        self.username = username
        self.blabString = blabString
        self.timeStamp = timeStamp
        
        self.connections = Array<Edge>()
    }
    
    init() {
        self.connections = Array<Edge>()
    }
    
    func addEdge(source: Blab, neighbor: Blab) {
        let newEdge = Edge()
        
        newEdge.neighbor = neighbor
        //newEdge.weight = weight
        source.connections.append(newEdge)
    }
}

class Edge {
    var neighbor: Blab
    //var weight: Int
    
    init() {
        //weight = 0
        neighbor = Blab()
    }
}

class Digraph {
    var canvas: Array<Blab>
    
    
    init() {
        canvas = Array<Blab>()
    }
    
    func addBlab(childBlab: Blab) {
        canvas.append(childBlab)
    }
}

func == (a: Blab, b: Blab) -> Bool {
    return a.username == b.username && a.blabString == b.blabString && a.timeStamp == b.timeStamp
}

let date1 = NSDate(timeIntervalSinceNow: -500.0)
let date2 = NSDate(timeIntervalSinceNow: -3800.0)
let date3 = NSDate(timeIntervalSinceNow: -467000.0)
let date4 = NSDate(timeIntervalSinceNow: -724120.0)

let testBlab1 = Blab(username: "Stine", blabString: "Can we go to Grizzly Peak?", timeStamp: date1)

let testBlab2 = Blab(username: "Nagoogin", blabString: "It smells like asparagus piss", timeStamp: date2)

let testBlab3 = Blab(username: "Posadinho", blabString: "I'm a light blue Bruin", timeStamp: date3)

let testBlab4 = Blab(username: "Jungsoo", blabString: "I like Kim Chi Noodles", timeStamp: date4)

