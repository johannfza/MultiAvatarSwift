//
//  ContentView.swift
//  iOS Example
//
//  Created by Johann Fong on Jul 20, 2021.
//

import SwiftUI
import MultiAvatarSwift
import WebKit


struct SwiftUIMultiAvatarSwift: View {
    
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        HStack {
            //            7f6bc2d6eddaa8f67b
            
            SVGView(string: Multiavatar.generate(string: modelData.avatarId, vpWidth: 579, vpHeight: 579)).frame(width: 100, height: 100, alignment: .top)
                .cornerRadius(50)
                .overlay(Circle().stroke(Color.gray, lineWidth: 4))
                .shadow(radius: 5)
                .padding(5)
            VStack(alignment: .leading) {
                Text("Johnny Afro")
                    .foregroundColor(.white)
                    .font(.title)
                    .padding(.bottom, 3)
                Text("Chill out, relax \nand have an open mind.")
                    .foregroundColor(.white)
                    .font(.subheadline)
            }
            .padding()
        }
        .padding()
    }
}

struct ContentView: View {

    
    var body: some View {
        VStack(alignment: .center) {
            SwiftUIMultiAvatarSwift()
            Spacer()
            SettingListView()
                .cornerRadius(10, corners: [.topLeft, .topRight])
                .ignoresSafeArea(.all)
        }.background(
            Image("profilecloud")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
    }
}


struct SVGView: UIViewRepresentable {
    
    let string: String
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.contentMode = .scaleAspectFit
        webView.sizeToFit()
        webView.autoresizesSubviews = true
        webView.isUserInteractionEnabled = false
        webView.loadHTMLString(string, baseURL: nil)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
        
    }
}

struct CircleImage: View {
    var body: some View {
        Image("turtlerock")
            .resizable()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct ProfileBackgroudImage: View {
    var body: some View {
        Image("profilecloud")
            .resizable()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 4))
            .shadow(radius: 7)
    }
}


//struct AvatarView: View {
//    var body: some View {
//        SVGView()
//    }
//}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
