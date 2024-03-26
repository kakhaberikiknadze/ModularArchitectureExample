import ComposableArchitecture

public enum HomeFeature {
    @ObservableState
    public struct State: Equatable, Sendable {
        public var title: String
        
        public init(title: String) {
            self.title = title
        }
    }
    
    @CasePathable
    public enum Action: Sendable {
        case task
    }
}
