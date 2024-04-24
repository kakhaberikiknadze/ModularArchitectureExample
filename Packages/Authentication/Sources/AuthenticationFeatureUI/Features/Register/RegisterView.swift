import SwiftUI
import ComposableArchitecture
import AuthenticationFeatureAPI

public struct RegisterView: View {
    public typealias ViewState = RegisterFeature.State
    public typealias Action = RegisterFeature.Action
    
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
            
            TextField(
                "",
                text: $store.confirmPassword,
                prompt: Text(store.confirmPasswordPlaceholder)
            )
            
            Button(store.submitButtonTitle) {
                store.send(.submit)
            }
            .disabled(store.isSubmitButtonDisabled)
        }
        .textFieldStyle(.roundedBorder)
    }
}

#if DEBUG
#Preview {
    RegisterPreview()
}
#endif
