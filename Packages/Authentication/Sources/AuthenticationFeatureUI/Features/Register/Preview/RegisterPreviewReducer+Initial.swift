#if DEBUG
extension RegisterPreviewReducer.State {
    static var preview: Self {
        .init(
            usernamePlaceholder: "Enter username",
            username: "",
            passwordPlaceholder: "Enter password",
            password: "",
            confirmPasswordPlaceholder: "Confirm password",
            confirmPassword: "",
            submitButtonTitle: "Register",
            isSubmitButtonDisabled: true
        )
    }
}
#endif
