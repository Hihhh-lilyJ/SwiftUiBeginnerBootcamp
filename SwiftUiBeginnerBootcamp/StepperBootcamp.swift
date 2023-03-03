//
//  StepperBootcamp.swift
//  SwiftUiBeginnerBootcamp
//
//  Created by MacBook Pro on 03/03/2023.
//

import SwiftUI

struct StepperBootcamp: View {
    
    @State var stepperValue: Int = 10
    @State var widthIncrement: CGFloat = 0
    var body: some View {
        VStack{
            Stepper("Stepper: \(stepperValue)", value: $stepperValue)
                .padding(50)
            RoundedRectangle(cornerRadius: 25)
                .frame(width: 100 + widthIncrement, height: 100)
            Stepper("Stepper 2") {
                //  increment
                incrementWidth(amount: 100)
            } onDecrement: {
                //  decrement
                incrementWidth(amount: -100)
            }
        }
    }
    func incrementWidth (amount: CGFloat) {
        withAnimation(.easeOut) {
            widthIncrement += amount
        }
    }
}

struct StepperBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        StepperBootcamp()
    }
}