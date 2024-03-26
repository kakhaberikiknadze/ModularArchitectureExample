#if DEBUG
import SwiftUI
import ComposableArchitecture
import RootFeatureAPI

struct HomePreview: View {
    typealias ViewState = HomeFeature.State
    typealias Action = HomeFeature.Action
    
    let store = Store<ViewState, Action>(
        initialState: .preview,
        reducer: HomePreviewReducer.init
    )
    
    var body: some View {
        HomeView(store: store)
    }
}
#endif
