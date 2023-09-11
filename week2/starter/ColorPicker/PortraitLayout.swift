

import SwiftUI

struct PortraitLayout: View {

  @State private var redValue: Double = 250
  @State private var greenValue: Double = 100
  @State private var blueValue: Double = 50

  @State private var committedRed: Double = 250
  @State private var committedGreen: Double = 100
  @State private var committedBlue: Double = 50

  
  var body: some View {
    VStack(spacing: 35) {
               Text("Color Picker")
                   .font(.largeTitle)
               RoundedRectangle(cornerRadius: 0)
                   .fill(Color(red: committedRed/255, green: committedGreen/255, blue: committedBlue/255))
                   .background(
                       RoundedRectangle(cornerRadius: 0)
                           .strokeBorder(LinearGradient(gradient: Gradient(colors: [Color(red: committedRed/255, green: committedGreen/255, blue: committedBlue/255)]), startPoint: .leading, endPoint: .trailing),
                                         lineWidth: 10)
                           .blur(radius: 5)
                   )
                   .frame(width: 380, height: 300)
               colorSlider(title: "Red", value: $redValue, color: .red)
               colorSlider(title: "Green", value: $greenValue, color: .green)
               colorSlider(title: "Blue", value: $blueValue, color: .blue)
               Button {
                   commitColors()
               } label: {
                   Text("Set Color")
                       .padding()
                       .background(Color.blue)
                       .foregroundColor(.white)
                       .overlay(
                           RoundedRectangle(cornerRadius: 8)
                               .strokeBorder(Color.white, lineWidth: 3)
                       )
                       .cornerRadius(8)
               }
           }
           .padding(.horizontal)
       }
  func colorSlider(title: String, value: Binding<Double>, color: Color) -> some View {
      VStack {
          HStack {
              SliderView(value: value, color: color)
              Text("\(Int(value.wrappedValue))")
          }
          Text(title)
      }
  }

  func commitColors() {
        committedRed = redValue
        committedGreen = greenValue
        committedBlue = blueValue
    }
  }


struct PortraitLayout_Previews: PreviewProvider {
    static var previews: some View {
      PortraitLayout()
    }
}
