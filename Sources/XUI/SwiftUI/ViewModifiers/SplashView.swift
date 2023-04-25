//
//  SplashView.swift
//  HomeForYou
//
//  Created by Aung Ko Min on 24/4/23.
//

import SwiftUI
@available(iOS 16.0.0, *)
private struct SplashView<SplashContent: View>: ViewModifier {

    private let timeout: TimeInterval
    private let splashContent: () -> SplashContent

    @State private var isActive = true

    public init(timeout: TimeInterval, @ViewBuilder splashContent: @escaping () -> SplashContent) {
        self.timeout = timeout
        self.splashContent = splashContent
    }

    public func body(content: Content) -> some View {
        if isActive {
            splashContent()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + timeout) {
                        withAnimation {
                            self.isActive = false
                        }
                    }
                }
        } else {
            content
        }
    }
}
@available(iOS 16.0.0, *)
public extension View {
    func _splashVeiw<SplashContent: View>(timeout: TimeInterval = 2.5, @ViewBuilder splashContent: @escaping () -> SplashContent) -> some View {
        modifier(SplashView(timeout: timeout, splashContent: splashContent))
    }
}
