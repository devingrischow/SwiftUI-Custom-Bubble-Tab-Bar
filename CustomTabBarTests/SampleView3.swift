//
//  SampleView3.swift
//  CustomTabBarTests
//
//  Created by Devin Grischow on 1/5/24.
//

import SwiftUI

struct SampleView3: View {
    var body: some View {
        HStack{
            Text("Hello, World Its View 3!")
            
        }.frame(width: 400, height: 800).background(Color.red)
    }
}

#Preview {
    SampleView3()
}
