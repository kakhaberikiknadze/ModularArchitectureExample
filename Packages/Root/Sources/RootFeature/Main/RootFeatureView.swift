import SwiftUI
import ComposableArchitecture

public extension Root {
    struct FeatureView: View {
        public typealias R = FeatureReducer
        private let store: StoreOf<R>
        
        private let containers = ContainerProvider()
        private let features: FeatureProvider
        
        public init(
            store: StoreOf<R>,
            features: FeatureProvider
        ) {
            self.store = store
            self.features = features
        }
        
        public var body: some View {
            containers
                .home(store.scope(state: \.home, action: \.home))
                .environment(containers)
                .environment(features)
        }
    }
}
