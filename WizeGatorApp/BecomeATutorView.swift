//
//  BecomeATutorView.swift
//  WizeGatorApp
//
//  Created by Philip Karnatsevich on 11/10/24.
//
// ver 1.3

import SwiftUI

struct BecomeATutorView: View {
    @Binding var tutors: [Tutor]  // Binding to the shared list of tutors
    @State private var name: String = ""
    @State private var expertise: String = ""
    @State private var emoji: String = ""
    @State private var isTutorAdded: Bool = false

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "graduationcap.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .padding(.leading, 10)

                Text("Become a Tutor")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(.white)

                Spacer()
            }
            .padding()
            .background(Color.green)

            VStack(spacing: 20) {
                Text("Register as a Tutor")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.top, 30)

                TextField("Enter your name", text: $name)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 5)

                TextField("Enter your expertise", text: $expertise)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 5)

                TextField("Enter an emoji", text: $emoji)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .shadow(radius: 5)

                Button(action: {
                    if !name.isEmpty && !expertise.isEmpty && !emoji.isEmpty {
                        tutors.append(Tutor(id: tutors.count + 1, name: name, expertise: expertise, emoji: emoji))
                        name = ""
                        expertise = ""
                        emoji = ""
                        isTutorAdded = true

                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isTutorAdded = false
                        }
                    }
                }) {
                    Text("Submit")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .shadow(radius: 5)
                }

                if isTutorAdded {
                    Text("Congratulations! You are now a tutor.")
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
    BecomeATutorView(tutors: .constant([]))
}
