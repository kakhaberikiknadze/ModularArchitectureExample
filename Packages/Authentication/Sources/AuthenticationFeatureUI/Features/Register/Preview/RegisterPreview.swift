#if DEBUG
import SwiftUI
import ComposableArchitecture
import AuthenticationFeatureAPI

struct RegisterPreview: View {
    typealias ViewState = RegisterFeature.State
    typealias Action = RegisterFeature.Action
    
    @State private var store = Store<ViewState, Action>(
        initialState: .preview,
        reducer: RegisterPreviewReducer.init
    )
    
    var body: some View {
        RegisterView(store: store)
    }
}
#endif
