//
//  LabeledTextField.swift
//  Resize
//
//  Created by Ulaş Alyeşil on 27.09.2023.
//

import SwiftUI

struct LabeledTextField: View {
    
    @Binding var value: CGFloat
    @Binding var label: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .foregroundStyle(.secondary)
            TextField(label, value: $value, formatter: NumberFormatter())
                .textFieldStyle(.roundedBorder)
        }
    }
}

//#Preview {
//    LabeledTextField(value: 1024.0, label: "Height")
//}
