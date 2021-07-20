import SwiftUI

struct RefreshButton: View {
    
    @Binding var string: String
    
    @Binding var disableSaveButton: Bool
    
    var body: some View {
        Button(action: {
            string = UUID().uuidString
            disableSaveButton = false
        }) {
            Image(systemName: "arrow.clockwise")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.gray)
                .frame(width: 20.0, height: 20.0)
                .padding(10)
                .cornerRadius(30)
        }
        .overlay(Circle().stroke(Color.gray, lineWidth: 4))
    }
}

struct RefreshButton_Previews: PreviewProvider {
    static var previews: some View {
        RefreshButton(string: .constant("false"), disableSaveButton: .constant(true))
    }
}
