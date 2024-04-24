import ComposableArchitecture

public enum LoginFeature {
    @ObservableState
    public struct State: Equatable, Sendable {
        public var usernamePlaceholder: String
        public var username: String
        public var passwordPlaceholder: String
        public var password: String
        public var submitButtonTitle: String
        public var isSubmitButtonDisabled: Bool
        public var registerButtonTitle: String
        
        public init(
            usernamePlaceholder: String,
            username: String,
            passwordPlaceholder: String,
            password: String,
            submitButtonTitle: String,
            isSubmitButtonDisabled: Bool,
            registerButtonTitle: String
        ) {
            self.usernamePlaceholder = usernamePlaceholder
            self.username = username
            self.passwordPlaceholder = passwordPlaceholder
            self.password = password
            self.submitButtonTitle = submitButtonTitle
            self.isSubmitButtonDisabled = isSubmitButtonDisabled
            self.registerButtonTitle = registerButtonTitle
        }
    }
    
    @CasePathable
    public enum Action: Sendable, BindableAction {
        case binding(BindingAction<State>)
        case submit
        case register
    }
}
