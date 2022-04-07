//
//  GetStartedView.swift
//  happy-tracker
//
//  Created by Mirna Helmy on 4/6/22.
//

import SwiftUI

struct GetStartedView: View {
    var body: some View {
        ZStack{
            Color("pale").opacity(0.2)
                .ignoresSafeArea()
            
            VStack{
              
            Text("Welcome to")
                    .font(.largeTitle)
                    .padding(.top,50)
                
            Text("Emotional Check-up")
                .font(.title)
                .fontWeight(.bold)
               
                Spacer()

            Image("Logo")
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
  
       
      
            Text("Emotional Check-up detects your \n emotions through facial expressions")
                 //   .lineLimit(nil)
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .padding(.bottom,140)
              
            Text("Start your first session👇")
                    .font(.callout)
                    .fontWeight(.semibold)
                NavigationLink { // destination
                    RecordSessionView()
                } label: {
                    CustomButtonLabel(buttonLabel: "Record Session")
                }
            
                Spacer()
            }
        }

  


    }

}

struct GetStartedView_Previews: PreviewProvider {
    static var previews: some View {
        GetStartedView()
    }
}