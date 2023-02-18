//
//  XFormRow.swift
//  RoomRentalDemo
//
//  Created by Aung Ko Min on 19/1/23.
//

import SwiftUI

@available(iOS 16.0, *)
public struct XFormRow<Content: View>: View {

    let title: String
    let isEmpty: Bool
    let content: () -> Content

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(.init(title))
                .font(.subheadline)
                .foregroundStyle(.tertiary)
                .italic(!isEmpty)
            content()
        }
    }
}
