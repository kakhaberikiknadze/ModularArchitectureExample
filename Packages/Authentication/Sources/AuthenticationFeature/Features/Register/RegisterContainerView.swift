import SwiftUI
import ComposableArchitecture
import RootFeatureAPI

extension Authentication {
    struct RegisterContainerView: View {
        @Bindable private var store: StoreOf<RegisterReducer>
        
        @Environment(FeatureProvider.self) private var features
        
        init(store: StoreOf<RegisterReducer>) {
            self.store = store
        }
        
        var body: some View {
            features.register(
                store.scope(state: \.self, action: \.viewAction)
            )
        }
    }
}
