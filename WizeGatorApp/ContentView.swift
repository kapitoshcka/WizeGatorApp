//
//  ContentView.swift
//  WizeGatorApp
//
//  Created by Philip Karnatsevich on 11/10/24.
//
// Ver 1.3

import SwiftUI

struct ContentView: View {
    // Preloaded default tutors
    @State private var tutors: [Tutor] = [
        Tutor(id: 1, name: "Philip Karnatsewich", expertise: "CSC", emoji: "👨‍💻"),
        Tutor(id: 2, name: "John Doh", expertise: "BUS", emoji: "📈"),
        Tutor(id: 3, name: "Nina Carter", expertise: "ASTR", emoji: "🔭"),
        Tutor(id: 4, name: "Alice Johnson", expertise: "MATH", emoji: "📐")
    ]
    
    @State private var messages: [Message] = [] // Store sent messages

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Top Navbar Section
                HStack {
                    Image(systemName: "graduationcap.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding(.leading, 10)
                    
                    Text("WizeGATOR App")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                .padding()
                .background(Color.green)
                
                // Welcome Section
                VStack(spacing: 20) {
                    Text("Welcome to WizeGATOR")
                        .font(.system(size: 28, weight: .bold))
                        .padding(.top, 30)
                    
                    Text("Explore exclusive tutors or offer your expertise. Use the options below or navigate through the menu.")
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                    
                    HStack(spacing: 20) {
                        NavigationLink(destination: TutorDashboardView(tutors: $tutors, messages: $messages)) {
                            Text("Find a Tutor")
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(8)
                                .shadow(radius: 5)
                        }
                        
                        NavigationLink(destination: BecomeATutorView(tutors: $tutors)) {
                            Text("Become a Tutor")
                                .font(.headline)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(8)
                                .shadow(radius: 5)
                        }
                    }
                    .padding(.horizontal, 40)
                }
                .frame(maxHeight: .infinity)
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
            .background(Color.green.opacity(0.1)) // Added background color for the whole content
        }
        .navigationViewStyle(StackNavigationViewStyle()) // Ensure proper navigation appearance
    }
}

// Preview with preloaded data
#Preview {
    ContentView()
}
