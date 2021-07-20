import SwiftUI
import MultiAvatarSwift
import WebKit
import Swafka

struct AvatarGeneratorView: View {
    
    @EnvironmentObject var modelData: ModelData
    
    @State public var tempAvatarId: String
    
    @State private var disableSaveButton: Bool = true
            
    init(avatarId: String) {
        self.tempAvatarId = avatarId
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Avatar Generator")
                    .font(.title2)
                    .padding()
                Spacer()
            }
            ZStack {
                SVGView(string: Multiavatar.generate(string: tempAvatarId, vpWidth: 282, vpHeight:  260))
                    .frame(width: 200, height: 200, alignment: .top)
                    .cornerRadius(100)
                    .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                    .padding(5)
                RefreshButton(string: $tempAvatarId, disableSaveButton: $disableSaveButton)
                    .offset(x: 120, y: 100)
                    .padding(.trailing, 45)
                    .padding(.bottom, 20)
                    .buttonStyle(BorderlessButtonStyle())
                Spacer()
            }
            HStack {
                SaveAvatarButton(shouldDisable: $disableSaveButton, avatarId: $tempAvatarId )
                    .buttonStyle(BorderlessButtonStyle())
//                    .background(Color.green)
            }
            Spacer()
        }
    }
}


struct SaveAvatarButton: View {
    
    @Binding public var shouldDisable: Bool
    
    @Binding public var avatarId: String
    
    @State private var showingAlert = false

    var body: some View {
        Button("Save Avatar") {
            showingAlert = true
        }
        .frame(width: 150, height: 10, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .contentShape(Rectangle())
        .disabled(shouldDisable)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Is this the one?"),
                  message: Text("Saving will override your current avatar."),
                  primaryButton: .destructive(Text("Save")) {
                    Swafka.shared.publish(topic: NewAvatar.init(id: avatarId))
                  },
                  secondaryButton: .cancel()
            )
        }
        .padding()
        .foregroundColor(.gray)
//        .overlay(
//            RoundedRectangle(cornerRadius: 5)
//                .stroke(Color.gray, lineWidth: 3)
//        )
    }
}

struct AvatarGeneratorView_Previews: PreviewProvider {
    
    static var modelData = ModelData()
    
    static var previews: some View {
        AvatarGeneratorView(avatarId: modelData.avatarId)
    }
}

//
//struct PocketSVGView: UIViewRepresentable {
//
//    let svgString: String
//
//    func updateUIView(_ uiView: UIView, context: Context) {
//        let path = SVGBezierPath.paths(fromSVGString: svgString)
//        let layer = SVGLayer()
//        layer.paths = path
//        let frame = CGRect(x: 0, y: 0, width: 200, height: 200)
//        layer.frame = frame
//        uiView.layer.addSublayer(layer)
//    }
//
//    func makeUIView(context: Context) -> UIView {
//        let path = SVGBezierPath.paths(fromSVGString: svgString)
//        let layer = SVGLayer()
//        layer.paths = path
//        let frame = CGRect(x: 0, y: 0, width: 200, height: 200)
//        layer.frame = frame
//
//        let view = UIView()
//        view.layer.addSublayer(layer)
//        return view
//
//    }
//}
