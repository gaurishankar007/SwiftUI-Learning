import SwiftUI


struct ContentView: View {
    var body: some View {
       LandmarkList()
    }
}


#Preview {
    ContentView()
        .environment(ModelData())
}
