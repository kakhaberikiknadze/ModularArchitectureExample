import ComposableArchitecture
import AuthenticationFeatureAPI
import AuthenticationAPI

public extension Authentication {
    @Reducer
    struct FeatureReducer: AuthenticationFeatureReducing {
        public struct State: AuthenticationState {
            var login: LoginReducer.State = .initial
            
            public init() {}
        }
        
        public enum Action: AuthenticationAction {
            case login(LoginReducer.Action)
            case delegate(AuthenticationDelegateAction)
            
            public var delegate: AuthenticationDelegateAction? {
                guard case let .delegate(action) = self else { return nil }
                return action
            }
        }
        
        public init() {}
        
        public var body: some ReducerOf<Self> {
            Scope(state: \.login, action: \.login) {
                LoginReducer()
            }
        }
    }
}
