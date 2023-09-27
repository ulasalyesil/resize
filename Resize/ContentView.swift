//
//  ContentView.swift
//  Resize
//
//  Created by Ulaş Alyeşil on 26.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var widthText: Int = 1440 // this value should automatically give the current window width
    @State var heightText: Int = 1024 // this value should automatically give the current window height
    @State var selectedPresetIndex: Int = 0 // Track the selected preset
    
                

    func resizeFrontMostWindow() {
        let width = widthText
        let height = heightText
        
        // construct the applescript to resize the frontmost window
        if let script = NSAppleScript(source: """
                tell application "System Events"
                    set frontApp to name of first application process whose frontmost is true
                end tell
                tell application frontApp
                    set bounds of front window to {0, 0, \(width), \(height)}
                end tell
                """) {
                var error: NSDictionary?
                script.executeAndReturnError(&error)
                if let error = error {
                    // Handle the error
                    print("Error resizing window: \(error)")
                }
            }
        }
    
    let presets: [(String, Int, Int)] = [ // Define your preset sizes
        ("1920 x 1080", 1920, 1080),
        ("1440 x 1024", 1440, 1024),
        ("1280 x 720", 1280, 720),
        // Add more presets as needed
    ]
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(.black)
                    .frame(width: 32, height: 32)
                Text("Resize")
                    .font(.title3.bold())
                Spacer()
                Button(action: {
                    // transition settings view
                }, label: {
                    Image(systemName: "gearshape.fill")
                })
                .buttonStyle(.plain)
            }
            Divider()
            
            VStack(spacing: 16) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Width")
                            .foregroundStyle(.secondary)
                        TextField("Width", value: $widthText, formatter: NumberFormatter())
                            .textFieldStyle(.roundedBorder)
                    }
                    VStack(alignment: .leading) {
                        Text("Height")
                            .foregroundStyle(.secondary)
                        TextField("Height", value: $heightText, formatter: NumberFormatter())
                            .textFieldStyle(.roundedBorder)
                    }
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
                
                Button(action: {
                    resizeFrontMostWindow()
                    let selectedPreset = presets[selectedPresetIndex]
                                    widthText = selectedPreset.1
                                    heightText = selectedPreset.2
                                    // Add code to resize the window
                }, label: {
                    Text("Resize Window")
                })
                .buttonStyle(.borderedProminent)
            }
            
            Divider()
            
            HStack {
                Button(action: {
                    NSApplication.shared.terminate(self)
                }, label: {
                    Text("Quit Resize")
                        .foregroundStyle(.secondary)
                })
                    .buttonStyle(.plain)
                
                Spacer()
            }
        }
        .padding()
        .frame(width: 320)
    }
}



#Preview {
    ContentView()
}
