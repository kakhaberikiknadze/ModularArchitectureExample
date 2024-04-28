import SwiftUI
import ComposableArchitecture

public extension Authentication {
    struct FeatureView: View {
        private let store: StoreOf<FeatureReducer>
        
        private let containers = ContainerProvider()
        private let features: FeatureProvider
        
        public init(
            store: StoreOf<FeatureReducer>,
            features: FeatureProvider
        ) {
            self.store = store
            self.features = features
        }
        
        public var body: some View {
            containers
                .login(store.scope(state: \.login, action: \.login))
                .environment(containers)
                .environment(features)
        }
    }
}
