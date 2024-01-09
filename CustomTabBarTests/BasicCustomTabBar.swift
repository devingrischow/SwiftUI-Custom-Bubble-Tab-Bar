//
//  BasicCustomTabBar.swift
//  CustomTabBarTests
//
//  Created by Devin Grischow on 1/6/24.
//  This is a demonstration of a Custom 3 Tab Bubble Tab Bar


import SwiftUI

struct BasicCustomTabBar: View {
    
    @Binding var selectedTab:TabChoices
    
    var viewWidth:CGFloat
    
    @State var xAxis:CGFloat = 0
    
    @Namespace var animation
    
    //MARK: Basic custom tab bar
    //This tab bar is very simple but made in a working and more modern version.
    var body: some View {
        ZStack{
             
            //Capsule Background for tab bar
            Rectangle()
                
                .frame(height: 80)
                .shadow(radius: 10, y: 10)
        
            //HStack for the bar Items
            HStack{
                
                ForEach(tabBarItems) { barItem in
                    
                    GeometryReader { geometry in
                        Button(){
                            withAnimation(.spring(duration: 0.5)){
                                selectedTab = barItem
//                                if barItem == tabBarItems.first{
//                                                    //the shape / 1.5 allows the icon AND dip to reside in the center of the box
//                                    xAxis = geometry.size.width / 1.5
//                                }else if barItem == tabBarItems.last{
//                                    xAxis = geometry.size.width * 2.8
//                                }else{
//                                    xAxis = geometry.size.width * 1.7
//
//                                }
                                xAxis = geometry.frame(in: .global).minX + 37
                            }
                            
                            
                            //xAxis = geometry.frame(in: .global).minX * 1.2
                        }label: {
                            
                            Image(barItem.rawValue)
                                .renderingMode(.template)
                                .foregroundStyle(selectedTab == barItem ? Color.orange : Color.white)
                                .padding([.leading,.trailing], 30)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                //frame is the size of the button inside the geo reeder
                                .background(Color.green)
                                .clipShape(Circle())
                                .matchedGeometryEffect(id: barItem, in: animation)
                                .offset(y: selectedTab == barItem ? -55 : 0) //When the item is selected, se the height to be a certain value, but the default bar is 0
                                
                        }.onAppear{
                            //On Initial Appearance make sure the bar is in the center
                            if barItem != tabBarItems.first && barItem != tabBarItems.last{
                                xAxis = geometry.size.width * 1.74
                            }
                        
                    }//Bottom Of Geometry Reader
                    
                    }
                    
                }
                
                //Bottom Of Hstack
            }.frame(height: 80)
            //Bottom Of Zstack
        }.padding(.horizontal)
        .foregroundColor(.clear)
        .background(Color.green.clipShape(CustomShape(xAxis: xAxis)).cornerRadius(15))
        .frame(width: viewWidth) 
        

        
    }
}


//MARK: Custom Curve Shape
struct CustomShape: Shape{
    
    var xAxis:CGFloat
    
    //Animating The Bubble Path
    var animatableData:CGFloat {
        get {return xAxis}
        set{xAxis = newValue}
        
    }
    
    let topCenterOffset:CGFloat = 70
    
    let curveDepth:CGFloat = 35
    
    func path(in rect: CGRect) -> Path{
        
        return Path{ path in
        
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let center = xAxis
            
            path.move(to: CGPoint(x: center - topCenterOffset, y: 0)) // left side of the curve position, 50 paces behind the center
            
            let to1 = CGPoint(x: center, y: 40)
            let control1 = CGPoint(x: center - curveDepth, y: 0)
            let control2 = CGPoint(x: center - curveDepth, y: 40)
            
            let to2 = CGPoint(x: center + topCenterOffset, y: 0)  //right side curve position, which is 50 points in front of the center
            let control3 = CGPoint(x: center + curveDepth, y: 40)
            let control4 = CGPoint(x: center + curveDepth, y: 0)
            
            path.addCurve(to: to1, control1: control1, control2: control2)
            path.addCurve(to: to2, control1: control3, control2: control4)
        }
    }
    
    
}



#Preview {
//    BasicCustomTabBar(selectedTab: .constant(.view1), viewWidth: 393)
//        .previewLayout(.sizeThatFits)
//        .padding(.vertical)
    ContentView()
}
