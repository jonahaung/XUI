//
//  ViewModifiers.swift
//  EhPanda
//
//  Created by 荒木辰造 on R 2/12/06.
//

import SwiftUI

public extension View {

    @ViewBuilder func withHorizontalSpacing(width: CGFloat = 8, height: CGFloat? = nil) -> some View {
        Color.clear.frame(width: width, height: height)
        self
        Color.clear.frame(width: width, height: height)
    }

    func autoBlur(radius: Double) -> some View {
        blur(radius: radius)
            .allowsHitTesting(radius < 1)
            .animation(.linear(duration: 0.1), value: radius)
    }

    func synchronize<Value: Equatable>(_ first: Binding<Value>, _ second: Binding<Value>) -> some View {
        self
            .onChange(of: first.wrappedValue) { newValue in
                second.wrappedValue = newValue
            }
            .onChange(of: second.wrappedValue) { newValue in
                first.wrappedValue = newValue
            }
    }
    func synchronize<Value: Equatable>(_ first: Binding<Value>, _ second: FocusState<Value>.Binding) -> some View {
        self
            .onChange(of: first.wrappedValue) { newValue in
                second.wrappedValue = newValue
            }
            .onChange(of: second.wrappedValue) { newValue in
                first.wrappedValue = newValue
            }
    }
}
