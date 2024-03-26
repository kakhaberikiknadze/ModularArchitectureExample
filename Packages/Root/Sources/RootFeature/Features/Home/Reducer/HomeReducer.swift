import Foundation
import ComposableArchitecture
import RootFeatureAPI

extension Root {
    @Reducer
    public struct HomeReducer {
        public typealias State = HomeFeature.State
        public typealias Action = HomeFeature.Action
        
        public var body: some ReducerOf<Self> {
            Reduce<State, Action> { state, action in
                switch action {
                case .task:
                    state.title = "Title after task"
                    return .none
                }
            }
        }
    }
}
