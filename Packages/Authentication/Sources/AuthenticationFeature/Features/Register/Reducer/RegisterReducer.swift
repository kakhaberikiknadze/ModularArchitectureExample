import AuthenticationFeatureAPI
import ComposableArchitecture

@Reducer
public struct RegisterReducer {
    public typealias State = RegisterFeature.State
    public typealias ViewAction = RegisterFeature.Action
    
    public enum Action: Sendable {
        case viewAction(ViewAction)
        case delegate(DelegateAction)
    }
    
    public enum DelegateAction: Sendable {
        case registered
    }
    
    public var body: some ReducerOf<Self> {
        Scope(state: \.self, action: \.viewAction) {
            BindingReducer()
        }
        
        Reduce { state, action in
            switch action {
            case let .viewAction(action):
                return reduce(into: &state, action: action)
            default:
                return .none
            }
        }
    }
}

private extension RegisterReducer {
    func reduce(
        into state: inout State,
        action: ViewAction
    ) -> Effect<Action> {
        switch action {
        case .binding(\.username),
                .binding(\.password),
                .binding(\.confirmPassword):
            state.isSubmitButtonDisabled = state.username.isEmpty
            || state.password.isEmpty
            || state.confirmPassword != state.password
            return .none
        case .submit:
            return .run { send in
                // Do some service work in real
                return await send(.delegate(.registered))
            }
        default:
            return .none
        }
    }
}
