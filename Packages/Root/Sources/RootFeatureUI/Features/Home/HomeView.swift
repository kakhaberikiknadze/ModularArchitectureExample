import SwiftUI
import ComposableArchitecture
import RootFeatureAPI

public struct HomeView: View {
    public typealias ViewState = HomeFeature.State
    public typealias Action = HomeFeature.Action
    
    private let store: Store<ViewState, Action>
    
    public init(store: Store<ViewState, Action>) {
        self.store = store
    }
    
    public var body: some View {
        Text(store.title)
            .task {
                store.send(.task)
            }
    }
}

#if DEBUG
#Preview {
    HomePreview()
}
#endif
