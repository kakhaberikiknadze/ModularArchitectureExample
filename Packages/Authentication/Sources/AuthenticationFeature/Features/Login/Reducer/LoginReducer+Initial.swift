extension LoginReducer.State {
    static var initial: Self {
        .init(
            viewState: .init(
                usernamePlaceholder: "Username",
                username: "",
                passwordPlaceholder: "Password",
                password: "",
                submitButtonTitle: "Log in",
                isSubmitButtonDisabled: true,
                registerButtonTitle: "Register"
            )
        )
    }
}
