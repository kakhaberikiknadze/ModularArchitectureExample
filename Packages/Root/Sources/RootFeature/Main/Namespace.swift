import SwiftUI
import AuthenticationAPI

public enum Root<
    // MARK: - Features
    
    HomeView: View,
        
    // MARK: - External features
        
    AuthenticationReducer: AuthenticationFeatureReducing,
    AuthenticationView: View
> {}
