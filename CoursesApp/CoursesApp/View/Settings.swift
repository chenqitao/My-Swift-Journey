//
//  Settings.swift
//  CoursesApp
//
//  Created by Luan Nguyen on 13/12/2020.
//

import SwiftUI

struct Settings: View {
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Settings")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color("text"))
                } //: VSTACK
                .foregroundColor(.black)
                
                Spacer(minLength: 0)
            } //: HSTACK
            .padding()
            
            Spacer()
            
            ZStack {
                LottieView(filename: "ChainSettings")
            }
            .frame(width: 360, height: 360, alignment: .center)
            
            Text("Put some items for Settings here.")
                .font(.title2)
                .fontWeight(.regular)
                .foregroundColor(Color("text"))
            
            Spacer()
            
            Spacer()
        } //: VSTACK
    }
}
