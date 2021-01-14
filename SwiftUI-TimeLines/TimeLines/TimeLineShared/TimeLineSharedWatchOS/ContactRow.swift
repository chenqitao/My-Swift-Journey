//
//  ContactRow.swift
//  Time Lines SharedWatchOS
//
//  Created by Mathieu Dutour on 13/04/2020.
//  Copyright © 2020 Mathieu Dutour. All rights reserved.
//

import SwiftUI
import CoreLocation

public struct ContactRow: View {
  public var name: String
  public var timezone: TimeZone?
  public var coordinate: CLLocationCoordinate2D?
  public var startTime: Date?
  public var endTime: Date?

  public init(name: String, timezone: TimeZone?, coordinate: CLLocationCoordinate2D?, startTime: Date? = nil, endTime: Date? = nil) {
    self.name = name
    self.timezone = timezone
    self.coordinate = coordinate
    self.startTime = startTime
    self.endTime = endTime
  }

  public var body: some View {
    VStack {
      HStack {
        Text(name)
          .font(.system(size: 20))
          .lineLimit(1)
        Spacer()
        Text(timezone?.prettyPrintTimeDiff() ?? "")
        .font(.caption)
        .foregroundColor(Color(UIColor.gray))
      }

      Spacer()

      Line(coordinate: coordinate, timezone: timezone, startTime: startTime, endTime: endTime)
      .frame(height: 80)
    }
  }
}

public struct ContactRow_Previews: PreviewProvider {
  public static var previews: some View {
    Group {
      ContactRow(name: "Mathieu", timezone: TimeZone(secondsFromGMT: 0), coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0))
      ContactRow(name: "Paul", timezone: TimeZone(secondsFromGMT: -3600), coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0))
      ContactRow(name: "Paul", timezone: TimeZone(secondsFromGMT: +7800), coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0))
    }
    .previewDevice("Apple Watch Series 4 - 44mm")
  }
}


