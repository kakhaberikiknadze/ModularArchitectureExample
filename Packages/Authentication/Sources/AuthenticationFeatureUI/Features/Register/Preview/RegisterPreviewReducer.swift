#if DEBUG
import AuthenticationFeatureAPI
import ComposableArchitecture

@Reducer
struct RegisterPreviewReducer {
    typealias State = RegisterFeature.State
    typealias Action = RegisterFeature.Action
    
    var body: some ReducerOf<Self> {
        BindingReducer()
        
        Reduce { state, action in
            switch action {
            case .binding(\.username),
                    .binding(\.password),
                    .binding(\.confirmPassword):
                state.isSubmitButtonDisabled = state.username.isEmpty 
                || state.password.isEmpty
                || state.confirmPassword != state.password
                return .none
            case .submit:
                print("Submitted")
                return .none
            default:
                return .none
            }
        }
    }
}
#endif
