import SwiftUI
import ComposableArchitecture
import RootFeatureAPI

extension Authentication {
    struct LoginContainerView: View {
        @Bindable private var store: StoreOf<LoginReducer>
        
        @Environment(FeatureProvider.self) private var features
        
        init(store: StoreOf<LoginReducer>) {
            self.store = store
        }
        
        var body: some View {
            features.login(
                store.scope(state: \.viewState, action: \.viewAction)
            )
        }
    }
}
