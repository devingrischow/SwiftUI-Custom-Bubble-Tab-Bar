//
//  ContentView.swift
//  CustomTabBarTests
//
//  Created by Devin Grischow on 1/5/24.
//

import SwiftUI

enum TabChoices:String, Identifiable{
    case view1 = "view1"
    case view2 = "view2"
    case view3 = "view3"
    
    var id: Self { return self }
}

let tabBarItems:[TabChoices] = [.view1, .view2, .view3]

struct ContentView: View {
    
    @State var selectedTab:TabChoices = .view2
    
    var body: some View {
        GeometryReader{ geometry in
            TabView(selection: $selectedTab){
                SampleView1().tag(TabChoices.view2)
                SampleView2().tag(TabChoices.view2)
                SampleView3().tag(TabChoices.view3)
            }//Bottom of Tab View
            .overlay(alignment: .bottom){
                BasicCustomTabBar(selectedTab: $selectedTab, viewWidth: geometry.size.width - 30)//To get the effect of the tab bar being smaller than the phone, take the screen width (393 on iphone 15 pro) and subtract 30 from the size, this it to allow for easier resizing on any phone
            }
            
        }
        
        
                
    }//Bottom Of Body
}//Bottom Of View

 
#Preview {
    ContentView()
}

