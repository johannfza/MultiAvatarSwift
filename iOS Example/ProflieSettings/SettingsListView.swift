import SwiftUI

struct SettingListView: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        List {
            ForEach(modelData.settingItems) { setting in
                SettingRowView(setting: setting)
                
            }
            AvatarGeneratorView(avatarId: modelData.avatarId)
        }
    }
}

struct SettingListView_Previews: PreviewProvider {
    static var previews: some View {
        SettingListView().environmentObject(ModelData())
    }
}
