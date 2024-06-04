//
//  SortButton.swift
//  SwiftUI-100-Knocks-Challenge
//
//  Created by af_nakandakari_toru on 2024/06/04.
//

import SwiftUI

struct SortButton: View {
    @Binding var isSortedAscending: Bool
    var action: (() -> Void)?

    var body: some View {
        Button(action: {
            isSortedAscending.toggle()
            action?()
        }) {
            Image(systemName: isSortedAscending ? "arrow.down.circle.fill" : "arrow.up.circle.fill")
                .font(.system(size: 16))
                .foregroundColor(.primary)
                .padding(2)
                .background(Color(.systemGray5))
                .clipShape(Circle())
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
        }
    }
}

#Preview {
    @State var isSortedAscending = false
    return SortButton(isSortedAscending: $isSortedAscending)
}
