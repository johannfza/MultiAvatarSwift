import SwiftUI
import Swafka

final class ModelData: ObservableObject {
    @Published var settingItems: [SettingItem]
    @Published var avatarId: String = "7f6bc2d6eddaa8f67b"
    @Published var tempAvatarId: String = loadSVGString()
    init() {
        self.settingItems = [
            SettingItem(id: 1, name: "Username", iconName: "person", placeHolder: "@mrCoolAfroGuy", hasCheveron: true),
            SettingItem(id: 2, name: "Phone", iconName: "phone", placeHolder: "+65 8909 3890", hasCheveron: true),
            SettingItem(id: 3, name: "Notifications", iconName: "bell", placeHolder: "On", hasCheveron: true),
            SettingItem(id: 4, name: "Help", iconName: "questionmark.circle", placeHolder: "", hasCheveron: true)
            //chevron.right

        ]
        
        Swafka.shared.subscribe(self, to: NewAvatar.self) { newAvatar in
            self.avatarId = newAvatar.id
        }
    }
}

struct NewAvatar: Topicable{
    public var id: String
}


public struct SettingItem: Hashable, Codable, Identifiable {
    
    public var id: Int
    public var name: String
    public var iconName: String
    public var placeHolder: String
    public var hasCheveron: Bool
    
    public init(id: Int, name: String, iconName: String, placeHolder: String, hasCheveron: Bool) {
        self.id = id
        self.name = name
        self.iconName = iconName
        self.placeHolder = placeHolder
        self.hasCheveron = hasCheveron
    }

}


public func loadSVGString() -> String {
    if let filepath = Bundle.main.path(forResource: "avatar", ofType: "txt") {
        do {
            let contents = try String(contentsOfFile: filepath)
            print(contents)
            return contents
        } catch {
                    // contents could not be loaded
        }
    }
    return ""
}
