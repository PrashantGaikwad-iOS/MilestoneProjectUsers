

import SwiftUI

struct FriendDetailView: View {
    let friend: Friend
    var body: some View {
        List {
            Text("ID: ").fontWeight(.heavy)
            Text("\(friend.id)")
            Text("Name: ").fontWeight(.heavy)
            Text("\(friend.name)")
        }
        .font(.largeTitle)
    }
}
