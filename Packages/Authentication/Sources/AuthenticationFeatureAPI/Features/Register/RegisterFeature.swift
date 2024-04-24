import ComposableArchitecture

public enum RegisterFeature {
    @ObservableState
    public struct State: Equatable, Sendable {
        public var usernamePlaceholder: String
        public var username: String
        public var passwordPlaceholder: String
        public var password: String
        public var confirmPasswordPlaceholder: String
        public var confirmPassword: String
        public var submitButtonTitle: String
        public var isSubmitButtonDisabled: Bool
        
        public init(
            usernamePlaceholder: String,
            username: String,
            passwordPlaceholder: String,
            password: String,
            confirmPasswordPlaceholder: String,
            confirmPassword: String,
            submitButtonTitle: String,
            isSubmitButtonDisabled: Bool
        ) {
            self.usernamePlaceholder = usernamePlaceholder
            self.username = username
            self.passwordPlaceholder = passwordPlaceholder
            self.password = password
            self.confirmPasswordPlaceholder = confirmPasswordPlaceholder
            self.confirmPassword = confirmPassword
            self.submitButtonTitle = submitButtonTitle
            self.isSubmitButtonDisabled = isSubmitButtonDisabled
        }
    }
    
    @CasePathable
    public enum Action: Sendable, BindableAction {
        case binding(BindingAction<State>)
        case submit
    }
}
