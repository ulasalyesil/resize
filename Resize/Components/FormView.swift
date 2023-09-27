//
//  FormView.swift
//  Resize
//
//  Created by Ulaş Alyeşil on 27.09.2023.
//

import SwiftUI

struct FormView: View {
    
    @State private var widthLabel: String = "Width"
    @State private var widthValue: CGFloat = 1440
    @State private var heightLabel: String = "Height"
    @State private var heightValue: CGFloat = 1024
    @State var selectedPresetIndex: Int = 0 // Track the selected preset
    @State var isOverlayVisible: Bool = true
    
    let presets: [(String, Int, Int)] = [ // Define your preset sizes
        ("Please Select", 0, 0),
        ("1920 x 1080", 1920, 1080),
        ("1440 x 1024", 1440, 1024),
        ("1280 x 720", 1280, 720),
        ("2560 x 1440", 2560, 1440),
        ("1680 x 1050", 1680, 1050)
    ]

    var body: some View {
        VStack(alignment: .trailing, spacing: 16) {
            HStack {
                LabeledTextField(value: $widthValue, label: $widthLabel)
                LabeledTextField(value: $heightValue, label: $heightLabel)
            }
            VStack(alignment: .leading) {
                Text("Presets")
                    .foregroundStyle(.secondary)
                Picker("", selection: $selectedPresetIndex) {
                    ForEach(0..<presets.count, id: \.self) { index in
                        Text(presets[index].0)
                    }
                }
                .pickerStyle(.menu)
            }
            HStack {
                Text("Show Overlay")
                    .foregroundStyle(.secondary)
                Spacer()
                Toggle("", isOn: $isOverlayVisible)
                    .toggleStyle(.switch)
            }
            .padding(.vertical, 8)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Resize Window")
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.borderedProminent)
        }
        .labelsHidden()
    }
}

#Preview {
    FormView()
}
