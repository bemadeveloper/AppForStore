//
//  EditButton.swift
//  AppForStore
//
//  Created by Bema on 30/4/24.
//

import SwiftUI

struct EditButton: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "pencil")
                .padding(.top, 5)
        }
        
    }
}

#Preview {
    EditButton()
}
