import ComposableArchitecture
import RootFeatureAPI
import SwiftUI

public extension Root {
    @Observable
    final class FeatureProvider: @unchecked Sendable {
        private var _home: @Sendable (Store<HomeFeature.State, HomeFeature.Action>) -> HomeView
        
        public init(
            home: @Sendable @escaping (Store<HomeFeature.State, HomeFeature.Action>) -> HomeView
        ) {
            _home = home
        }
        
        func home(
            _ store: Store<HomeFeature.State, HomeFeature.Action>
        ) -> some View {
            _home(store)
        }
    }
    
    @Observable
    final class ExternalFeatureProvider: Sendable {
        private var _authentication: @Sendable (StoreOf<AuthenticationReducer>) -> AuthenticationView
        
        public init(
            authentication: @Sendable @escaping (StoreOf<AuthenticationReducer>) -> AuthenticationView
        ) {
            _authentication = authentication
        }
        
        func audioMixer(_ store: StoreOf<AuthenticationReducer>) -> some View {
            _authentication(store)
        }
    }
}
