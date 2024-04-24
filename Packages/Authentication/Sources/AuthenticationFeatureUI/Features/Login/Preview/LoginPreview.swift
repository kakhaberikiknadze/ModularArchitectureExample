#if DEBUG
import SwiftUI
import ComposableArchitecture
import AuthenticationFeatureAPI

struct LoginPreview: View {
    typealias ViewState = LoginFeature.State
    typealias Action = LoginFeature.Action
    
    @State private var store = Store<ViewState, Action>(
        initialState: .preview,
        reducer: LoginPreviewReducer.init
    )
    
    var body: some View {
        LoginView(store: store)
    }
}
#endif
