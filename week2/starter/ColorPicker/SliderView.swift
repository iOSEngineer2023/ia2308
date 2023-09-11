
import SwiftUI

struct SliderView: View {
    @Binding var value: Double
    var color: Color

    var body: some View {
        HStack {
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(color)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
  @State static var sliderValue: Double = 128.0
    static var previews: some View {
      SliderView(value: $sliderValue, color: Color.red)
    }
}
