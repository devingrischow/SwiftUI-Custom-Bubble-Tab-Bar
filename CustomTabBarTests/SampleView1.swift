//
//  SampleView1.swift
//  CustomTabBarTests
//
//  Created by Devin Grischow on 1/5/24.
//

import SwiftUI

struct SampleView1: View {
    var body: some View {
        HStack{
            Text("Hello, World Its View 1!")
            
        }.frame(width: 400, height: 800).background(Color.purple)
    }
}

#Preview {
    SampleView1()
}
