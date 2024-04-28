import AuthenticationFeatureAPI
import ComposableArchitecture

@Reducer
public struct LoginReducer {
    public typealias ViewState = LoginFeature.State
    public typealias ViewAction = LoginFeature.Action
    
    @ObservableState
    @dynamicMemberLookup
    public struct State: Equatable, Sendable {
        var viewState: ViewState
        @Presents var register: RegisterReducer.State?
        
        subscript<T>(dynamicMember keyPath: WritableKeyPath<ViewState, T>) -> T {
            get { viewState[keyPath: keyPath] }
            set { viewState[keyPath: keyPath] = newValue }
        }
    }
    
    @CasePathable
    public enum Action: Sendable {
        case viewAction(ViewAction)
        case register(PresentationAction<RegisterReducer.Action>)
        case delegate(DelegateAction)
    }
    
    @CasePathable
    public enum DelegateAction: Sendable {
        case loggedIn
    }
    
    public var body: some ReducerOf<Self> {
        Scope(state: \.viewState, action: \.viewAction) {
            BindingReducer()
        }
        
        Reduce { state, action in
            switch action {
            case let .viewAction(action):
                return reduce(into: &state, action: action)
            case let .register(action):
                return reduce(into: &state, action: action)
            default:
                return .none
            }
        }
        .ifLet(\.$register, action: \.register) {
            RegisterReducer()
        }
    }
}

private extension LoginReducer {
    func reduce(
        into state: inout State,
        action: ViewAction
    ) -> Effect<Action> {
        switch action {
        case .binding(\.username), .binding(\.password):
            state.isSubmitButtonDisabled = state.username.isEmpty || state.password.isEmpty
            return .none
        case .submit:
            return .run { send in
                // Do some service work in real
                return await send(.delegate(.loggedIn))
            }
        case .register:
            state.register = .initial
            return .none
        default:
            return .none
        }
    }
}

private extension LoginReducer {
    func reduce(
        into state: inout State,
        action: PresentationAction<RegisterReducer.Action>
    ) -> Effect<Action> {
        switch action {
        case .presented(.delegate(.registered)):
            return .send(.delegate(.loggedIn))
        default:
            return .none
        }
    }
}
