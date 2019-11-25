

import SwiftUI

struct ContentView: View {
    @State var users = [User]()
    
    var body: some View {
        NavigationView {
            List(users, id:\.id) { user in
                NavigationLink(destination: UserDetailsView(user: user, friends: user.friends)) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Name: \(user.name)")
                            .font(.headline)
                        Text("Age: \(user.age)")
                    }
                    Text("Company: \(user.company)")
                }
                }
            }
            .onAppear(perform: loadData)
        .navigationBarTitle("Users")
        }
    }
    
    func loadData() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, reponse, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([User].self, from:data) {
                    DispatchQueue.main.async {
                        self.users = decodedResponse
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
