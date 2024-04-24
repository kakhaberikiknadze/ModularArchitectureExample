#if DEBUG
extension LoginPreviewReducer.State {
    static var preview: Self {
        .init(
            usernamePlaceholder: "Enter username",
            username: "",
            passwordPlaceholder: "Enter password",
            password: "",
            submitButtonTitle: "Log in",
            isSubmitButtonDisabled: true,
            registerButtonTitle: "Register"
        )
    }
}
#endif
