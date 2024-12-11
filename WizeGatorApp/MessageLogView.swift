//
//  MessageLogView.swift
//  WizeGatorApp
//
//  Created by Philip Karnatsevich on 11/10/24.
//
// ver 1.3

import SwiftUI

struct MessageLogView: View {
    let messages: [Message]
    
    var body: some View {
        VStack {
            Text("Message Log")
                .font(.title)
                .bold()
                .padding()
            
            List(messages, id: \.id) { message in
                VStack(alignment: .leading) {
                    Text("To: \(message.tutor)")
                        .font(.headline)
                    Text("Message: \(message.content)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
            }
        }
    }
}
