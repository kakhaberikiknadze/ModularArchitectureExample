import SwiftUI
import ComposableArchitecture
import RootFeatureAPI

extension Root {
    struct HomeContainerView: View {
        @Bindable private var store: StoreOf<HomeReducer>
        
        @Environment(FeatureProvider.self) private var features
        
        init(store: StoreOf<HomeReducer>) {
            self.store = store
        }
        
        var body: some View {
            features.home(store)
        }
    }
}
