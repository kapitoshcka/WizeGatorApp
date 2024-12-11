//
//  SendMessageView.swift
//  WizeGatorApp
//
//  Created by Philip Karnatsevich on 11/10/24.
//
// ver 1.3

import SwiftUI

struct SendMessageView: View {
    @State private var message: String = ""
    @State private var isMessageSent: Bool = false

    let tutorName: String

    var body: some View {
        VStack {

            HStack {
                Image(systemName: "graduationcap.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding(.leading, 10)
                
                Text("Message \(tutorName)")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)
                
                Spacer()
            }
            .padding()
            .background(Color.green)
            

            VStack(spacing: 20) {
                Text("Send a Message to \(tutorName)")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 30)

                TextField("Enter your message", text: $message)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 5)
                
                Button(action: {

                    if !message.isEmpty {
                        print("Message sent to \(tutorName): \(message)")
                        
                        message = ""
                        isMessageSent = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isMessageSent = false
                        }
                    }
                }) {
                    Text("Send Message")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .shadow(radius: 5)
                }

                if isMessageSent {
                    Text("Congratulations! Your message was sent.")
                        .font(.subheadline)
                        .foregroundColor(.green)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(radius: 5)
                }
            }
            .padding()
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.gray.opacity(0.4), Color.green.opacity(0.2)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .cornerRadius(10)
            .padding()
        }
        .background(Color.green.opacity(0.1))
    }
}

#Preview {
    SendMessageView(tutorName: "Philip Karnatsewich")
}

