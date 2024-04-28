import ComposableArchitecture
import AuthenticationFeatureAPI
import SwiftUI

extension Authentication {
    @Observable
    final class ContainerProvider: Sendable {
        func login(_ store: StoreOf<LoginReducer>) -> some View {
            LoginContainerView(store: store)
        }
        
        func register(_ store: StoreOf<RegisterReducer>) -> some View {
            RegisterContainerView(store: store)
        }
    }
}
