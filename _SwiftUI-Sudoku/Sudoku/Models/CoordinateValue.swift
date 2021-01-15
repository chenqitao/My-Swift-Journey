import Foundation

struct CoordinateValue: Hashable {
    let r: Int
    let c: Int
    let s: Int
    let v: Int
    
    var coordinate: Coordinate {
        return (r: r, c: c, s: s)
    }
}

typealias Coordinate = (r: Int, c: Int, s: Int)
