//
//  TutorDashboardView.swift
//  WizeGatorApp
//
//  Created by Philip Karnatsevich on 11/10/24.
//
// ver 1.3

import SwiftUI

struct Message: Identifiable {
    let id = UUID() // Unique ID for each message
    let content: String
    let tutor: String
}

struct TutorDashboardView: View {
    @Binding var tutors: [Tutor]
    @Binding var messages: [Message] // Bind to the shared message list
    @State private var showMessageLog = false // Toggle to navigate to the message log
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Approved Tutors")
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)

                ForEach(tutors) { tutor in
                    VStack {
                        Text(tutor.emoji)
                            .font(.system(size: 50))

                        Text(tutor.name)
                            .font(.headline)

                        Text("Expertise: \(tutor.expertise)")
                            .font(.subheadline)
                            .foregroundColor(.gray)

                        // NavigationLink to SendMessageView
                        NavigationLink(destination: SendMessageView(tutorName: tutor.name)) {
                            Text("Message")
                                .font(.subheadline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(0.4), radius: 4, x: 0, y: 2)
                }
            }
            .padding()
        }
        .background(Color.green)
        .navigationTitle("Tutor Dashboard")
        .sheet(isPresented: $showMessageLog) {
            MessageLogView(messages: messages)
        }
    }
}
