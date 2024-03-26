#if DEBUG
import RootFeatureAPI
import ComposableArchitecture

@Reducer
struct HomePreviewReducer {
    typealias State = HomeFeature.State
    typealias Action = HomeFeature.Action
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .task:
                print("Task triggered")
                return .none
            }
        }
    }
}
#endif
