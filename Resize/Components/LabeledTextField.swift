//
//  LabeledTextField.swift
//  Resize
//
//  Created by Ulaş Alyeşil on 27.09.2023.
//

import SwiftUI

struct LabeledTextField: View {
    
    @State var inputText: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Width")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    LabeledTextField()
}
