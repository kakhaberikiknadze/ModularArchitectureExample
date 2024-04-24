#if DEBUG
import AuthenticationFeatureAPI
import ComposableArchitecture

@Reducer
struct LoginPreviewReducer {
    typealias State = LoginFeature.State
    typealias Action = LoginFeature.Action
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .binding(\.username), .binding(\.password):
                state.isSubmitButtonDisabled = state.username.isEmpty || state.password.isEmpty
                return .none
            case .submit:
                print("Submitted")
                return .none
            case .register:
                print("Register tapped")
                return .none
            default:
                return .none
            }
        }
    }
}
#endif
