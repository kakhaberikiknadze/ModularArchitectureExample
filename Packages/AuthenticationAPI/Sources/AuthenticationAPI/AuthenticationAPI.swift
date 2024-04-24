import ComposableArchitecture

public protocol AuthenticationState: Equatable, Sendable {
    init()
}

public protocol AuthenticationAction: Sendable {
    var delegate: AuthenticationDelegateAction? { get }
}

public enum AuthenticationDelegateAction: Sendable {
    case authenticated
}

public protocol AuthenticationFeatureReducing: Reducer
where State: AuthenticationState, Action: AuthenticationAction {
    init()
}
