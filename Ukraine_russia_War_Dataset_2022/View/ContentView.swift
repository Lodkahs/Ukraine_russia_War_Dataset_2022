//
//  ContentView.swift
//  Ukraine_russia_War_Dataset_2022
//
//  Created by Andrew  on 8/21/23.
//

import SwiftUI

protocol Losses : Codable {
    var date : String { get }
    var day : Int { get }
}

struct ContentView: View {
    
    init() {
            // Make the navigation bar background completely transparent
            UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
            UINavigationBar.appearance().shadowImage = UIImage()
        }
    
    var body: some View {
        
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.04541411034, green: 0.08468856293, blue: 0.06666667014, alpha: 1)), Color(#colorLiteral(red: 0.125633069, green: 0.1545227466, blue: 0.05256164966, alpha: 1))]),
                startPoint: .leading,
                endPoint: .trailing
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack {
                    Text("генеральний штаб зс україни")
                        .foregroundColor(.white)
                        .textCase(.uppercase)
                    Text("інформує")
                        .foregroundColor(.white)
                        .textCase(.uppercase)
                    
                    LossesListView()
                    
                }
                
                .font(.title3)
                .blendMode(.lighten)
                
                .padding()
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        //LossesListView()
    }
}
