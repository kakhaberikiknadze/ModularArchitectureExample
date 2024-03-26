import ComposableArchitecture

public protocol RootState: Equatable, Sendable {
    init()
}

public protocol RootAction: Sendable {
    var delegate: RootDelegateAction? { get }
}

public enum RootDelegateAction: Sendable {
    
}

public protocol RootFeatureReducing: Reducer
where State: RootState, Action: RootAction {
    init()
}
