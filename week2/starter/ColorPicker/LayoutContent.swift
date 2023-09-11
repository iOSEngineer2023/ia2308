

import SwiftUI

struct LayoutContent: View {
  @State private var redValue: Double = 250
  @State private var greenValue: Double = 100
  @State private var blueValue: Double = 50

  @State private var committedRed: Double = 250
  @State private var committedGreen: Double = 100
  @State private var committedBlue: Double = 50

  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  @Environment(\.verticalSizeClass) var verticalSizeClass

  
    var body: some View {
      Group{
                 Text("Color Picker")
          .font(horizontalSizeClass == .compact && verticalSizeClass == .regular ? .largeTitle : .headline)
                 RoundedRectangle(cornerRadius: 0)
                     .fill(Color(red: committedRed/255, green: committedGreen/255, blue: committedBlue/255))
                     .background(
                         RoundedRectangle(cornerRadius: 0)
                             .strokeBorder(LinearGradient(gradient: Gradient(colors: [Color(red: committedRed/255, green: committedGreen/255, blue: committedBlue/255)]), startPoint: .leading, endPoint: .trailing),
                                           lineWidth: 10)
                             .blur(radius: 5)
                     )
                     .padding(.horizontal)
                     .frame(width: 380, height: 300)
                 Text("Red")
                 VStack {
                     HStack {
                         SliderView(value: $redValue, color: .red)
                         Text("\(Int(redValue))")
                     }
                     Text("Green")
                     HStack {
                         SliderView(value: $greenValue, color: .green)
                         Text("\(Int(greenValue))")
                     }
                     Text("Blue")
                     HStack {
                         SliderView(value: $blueValue, color: .blue)
                         Text("\(Int(blueValue))")
                     }
                 }
                 .padding(.horizontal)

               Button {
                   commitColors()
               } label: {
                   Text("Set Color")
                       .padding()
                       .background(.blue)
                       .overlay(
                           RoundedRectangle(cornerRadius: 8)
                               .strokeBorder(Color.white, lineWidth: 3)
                       )
                       .foregroundColor(.white)
                       .cornerRadius(8)
               }
           }
       }
  func commitColors() {
        committedRed = redValue
        committedGreen = greenValue
        committedBlue = blueValue
    }
    }


struct LayoutContent_Previews: PreviewProvider {
    static var previews: some View {
        LayoutContent()
    }
}
