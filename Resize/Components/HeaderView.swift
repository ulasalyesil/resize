//
//  HeaderView.swift
//  Resize
//
//  Created by Ulaş Alyeşil on 27.09.2023.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(.black)
                    .frame(width: 32, height: 32)
                Image(systemName: "square.resize")
                    .foregroundStyle(.white)
                    .font(.title3.bold())
            }
            
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
    }
}

#Preview {
    HeaderView()
}
