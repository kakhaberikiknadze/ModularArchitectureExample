import ComposableArchitecture
import RootFeatureAPI
import SwiftUI

extension Root {
    @Observable
    final class ContainerProvider: Sendable {
        func home(_ store: StoreOf<HomeReducer>) -> some View {
            HomeContainerView(store: store)
        }
    }
}
