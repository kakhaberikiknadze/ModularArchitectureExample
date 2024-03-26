import ComposableArchitecture
import RootFeatureAPI
import RootAPI

public extension Root {
    @Reducer
    struct FeatureReducer: RootFeatureReducing {
        public struct State: RootState {
            var home: HomeReducer.State = .initial
            
            public init() {}
        }
        
        public enum Action: RootAction {
            case home(HomeReducer.Action)
            
            public var delegate: RootDelegateAction? {
                nil
            }
        }
        
        public init() {}
        
        public var body: some Reducer<State, Action> {
            Scope(state: \.home, action: \.home) {
                HomeReducer()
            }
        }
    }
}
