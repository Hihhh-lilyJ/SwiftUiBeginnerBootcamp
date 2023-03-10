//
//  IfLetGuardBootcamp.swift
//  SwiftUiBeginnerBootcamp
//
//  Created by MacBook Pro on 06/03/2023.
//

import SwiftUI

struct IfLetGuardBootcamp: View {
    
    @State var currentUserID:String? = nil
    @State var displayText:String? = nil
    @State var isLoading:Bool = false
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Here we are pricting Safe Coding")
                if let text = displayText {
                    Text(text)
                        .font(.title)
                }
                if isLoading {
                    ProgressView()
                }
                Spacer()
            }
            .navigationTitle("Safe Coding")
            .onAppear {
                loadData2()
            }
        }
    }
    
    
    func loadData () {
        if let userID = currentUserID {
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                displayText = "This is the new data! User ID is: \(userID)"
                isLoading = false
               }
            } else {
                displayText = "Error! There is no userID"
        }
    }
    
    func loadData2 () {
        guard let userID = currentUserID else {
            displayText = "Error! There is no userID"
            return
        }
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            displayText = "This is the new data! User ID is: \(userID)"
            isLoading = false
        }
    }
}

struct IfLetGuardBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        IfLetGuardBootcamp()
    }
}
