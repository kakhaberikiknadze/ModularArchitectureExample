import ComposableArchitecture
import AuthenticationFeatureAPI
import SwiftUI

public extension Authentication {
    @Observable
    final class FeatureProvider: @unchecked Sendable {
        private var _login: @Sendable (Store<LoginFeature.State, LoginFeature.Action>) -> LoginView
        private var _register: @Sendable (Store<RegisterFeature.State, RegisterFeature.Action>) -> RegisterView
        
        public init(
            login: @Sendable @escaping (Store<LoginFeature.State, LoginFeature.Action>) -> LoginView,
            register: @Sendable @escaping (Store<RegisterFeature.State, RegisterFeature.Action>) -> RegisterView
        ) {
            _login = login
            _register = register
        }
        
        func login(
            _ store: Store<LoginFeature.State, LoginFeature.Action>
        ) -> some View {
            _login(store)
        }
        
        func register(
            _ store: Store<RegisterFeature.State, RegisterFeature.Action>
        ) -> some View {
            _register(store)
        }
    }
}
