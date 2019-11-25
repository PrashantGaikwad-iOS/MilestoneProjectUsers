

import SwiftUI

struct UserDetailsView: View {
    let user: User
    let friends: [Friend]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                HStack{
                    Text("Company: ").fontWeight(.heavy)
                    Text("\(user.company)")
                }
                HStack{
                    Text("Email: ").fontWeight(.heavy)
                    Text("\(user.email)")
                }
                HStack{
                    Text("Address: ").fontWeight(.heavy)
                    Text("\(user.address)")
                }
                HStack{
                    Text("About: ").fontWeight(.heavy)
                    Text("\(user.about)")
                }
                Section(header: Text("Friends").fontWeight(.heavy)) {
                    List(friends, id:\.id) { friend in
                        NavigationLink(destination:FriendDetailView(friend: friend)) {
                            Text("\(friend.name)")
                        }
                    }
                }
                
            }
            .layoutPriority(1.0)
            .padding()
            .navigationBarTitle("\(user.name)",displayMode: .inline)
        }
    }
    
    init(user: User, friends: [Friend]) {
        self.user = user
        
        var friends = [Friend]()
        
        for friend in user.friends {
            friends.append(friend)
        }
        
        self.friends = friends
    }
    
}
//
//struct UserDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserDetailsView()
//    }
//}
