//
//  BasicTabBarButton.swift
//  CustomTabBarTests
//
//  Created by Devin Grischow on 1/6/24.
//

import SwiftUI

struct BasicTabBarButton: View {
    
    
    @Binding var selectedTab:TabChoices
    
    var body: some View {
        //Needed to obtain the midpoint of beach button to be used in the curve animation
        GeometryReader{ geometry in
            
            Button(){
                print("Hello World!")
            }label: {
                Image(selectedTab.rawValue)
                    .renderingMode(.template)
                    .foregroundColor(.green)
            }
            //Max Button Frame
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            
            
            
            
            
        }
    }
}

