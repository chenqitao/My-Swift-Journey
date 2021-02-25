//
//  ContentView.swift
//  CustomRowsApp
//
//  Created by Edgar Nzokwe on 3/19/20.
//  Copyright © 2020 Edgar Nzokwe. All rights reserved.
//

import SwiftUI


struct ContentView: View {

        var body: some View {
          
            List {
                ForEach(weatherData){ weather in
                    WeatherRow(weather: weather)
                }
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
