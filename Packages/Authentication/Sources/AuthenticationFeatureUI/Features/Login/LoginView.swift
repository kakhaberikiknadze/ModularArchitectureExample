import SwiftUI
import ComposableArchitecture
import AuthenticationFeatureAPI

public struct LoginView: View {
    public typealias ViewState = LoginFeature.State
    public typealias Action = LoginFeature.Action
    
    @Bindable private var store: Store<ViewState, Action>
    
    public init(store: Store<ViewState, Action>) {
        self.store = store
    }
    
    public var body: some View {
        VStack {
            TextField(
                "",
                text: $store.username,
                prompt: Text(store.usernamePlaceholder)
            )
            
            TextField(
                "",
                text: $store.password,
                prompt: Text(store.passwordPlaceholder)
            )
            
            Button(store.submitButtonTitle) {
                store.send(.submit)
            }
            .disabled(store.isSubmitButtonDisabled)
            
            Button(store.registerButtonTitle) {
                store.send(.register)
            }
        }
        .textFieldStyle(.roundedBorder)
    }
}

#if DEBUG
#Preview {
    LoginPreview()
}
#endif
