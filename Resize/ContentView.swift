//
//  ContentView.swift
//  Resize
//
//  Created by Ulaş Alyeşil on 26.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                HeaderView()
                
                Divider()

                FormView()
                
                Divider()
                
                HStack {
                    Button("Quit Resize") {
                        NSApplication.shared.terminate(nil)
                    }
                    .keyboardShortcut("q")
                    .buttonStyle(.plain)
                    Spacer()
                }
            }
            .padding()
            .frame(width: 320)
        }
    }
}

#Preview {
    ContentView()
}
