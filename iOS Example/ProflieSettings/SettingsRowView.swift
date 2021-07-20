import SwiftUI

struct SettingRowView: View {
    @EnvironmentObject var modelData: ModelData
    
    var setting: SettingItem

    var body: some View {
        HStack {
            SquareIcon(iconName: setting.iconName)
            Text(setting.name)
                .padding(4)
            Spacer()
            Text(setting.placeHolder)
                .foregroundColor(.gray)
            setting.hasCheveron ? Image(systemName: "chevron.right" ) : Image(systemName: "")
        }
        .padding()
    }
}

struct SettingRowView_Previews: PreviewProvider {
    
    static var modelData = ModelData()
    
    static var previews: some View {
        Group {
            SettingRowView(setting: (modelData.settingItems[0])).environmentObject(modelData)
            SettingRowView(setting: (modelData.settingItems[1])).environmentObject(modelData)
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}

struct SquareIcon: View {
    
    var iconName: String
    
    var body: some View {
        Group {
            Image(systemName: iconName)
                .foregroundColor(.white)
                .padding(6)
                .background(Color.gray)
                .cornerRadius(5)
        }
    }
}
