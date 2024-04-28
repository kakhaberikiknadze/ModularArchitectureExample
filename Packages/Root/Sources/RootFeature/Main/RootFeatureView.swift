import SwiftUI
import ComposableArchitecture

public extension Root {
    struct FeatureView: View {
        public typealias R = FeatureReducer
        private let store: StoreOf<R>
        
        private let containers = ContainerProvider()
        private let features: FeatureProvider
        private let externalFeatures: ExternalFeatureProvider
        
        public init(
            store: StoreOf<R>,
            features: FeatureProvider,
            externalFeatures: ExternalFeatureProvider
        ) {
            self.store = store
            self.features = features
            self.externalFeatures = externalFeatures
        }
        
        public var body: some View {
            containers
                .home(store.scope(state: \.home, action: \.home))
                .environment(containers)
                .environment(features)
                .environment(externalFeatures)
        }
    }
}
