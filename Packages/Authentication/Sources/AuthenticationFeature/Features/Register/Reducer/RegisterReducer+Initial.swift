extension RegisterReducer.State {
    static var initial: Self {
        .init(
            usernamePlaceholder: "Username",
            username: "",
            passwordPlaceholder: "Password",
            password: "",
            confirmPasswordPlaceholder: "Confirm password",
            confirmPassword: "",
            submitButtonTitle: "Register",
            isSubmitButtonDisabled: true
        )
    }
}
