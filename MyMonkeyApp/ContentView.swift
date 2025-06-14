//
//  ContentView.swift
//  MyMonkeyApp
//
//  Created by Mphiliseni Mhlongo on 2025/06/14.
//

import SwiftUI

struct Pizza: Identifiable {
    let id = UUID()
    let name: String
    let location: String
    let emoji: String
    let population: Int // in millions
    let maxPopulation: Int // for progress
}

struct ContentView: View {
    let pizzas = [
        Pizza(name: "Margherita", location: "Naples, Italy", emoji: "🍕", population: 3, maxPopulation: 10),
        Pizza(name: "Pepperoni", location: "USA", emoji: "🍕", population: 8, maxPopulation: 10),
        Pizza(name: "Hawaiian", location: "Canada", emoji: "🍍", population: 2, maxPopulation: 10),
        Pizza(name: "Veggie", location: "Global", emoji: "🥦", population: 5, maxPopulation: 10),
        Pizza(name: "BBQ Chicken", location: "USA", emoji: "🍗", population: 6, maxPopulation: 10),
        Pizza(name: "Four Cheese", location: "Italy", emoji: "🧀", population: 4, maxPopulation: 10)
    ]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(spacing: 16) {
            ZStack(alignment: .bottomLeading) {
                LinearGradient(gradient: Gradient(colors: [Color(red: 0.98, green: 0.67, blue: 0.13), Color(red: 0.93, green: 0.36, blue: 0.18)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
                    .shadow(color: Color.orange.opacity(0.25), radius: 10, x: 0, y: 6)
                HStack(alignment: .center, spacing: 16) {
                    ZStack {
                        Circle()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color(red: 0.98, green: 0.67, blue: 0.13)]), startPoint: .top, endPoint: .bottom))
                            .frame(width: 60, height: 60)
                        Text("🍕")
                            .font(.system(size: 36))
                    }
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Pizza World")
                            .font(.system(size: 34, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                        Text("Discover the best pizzas from around the globe!")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.85))
                    }
                    Spacer()
                }
                .padding(.leading, 24)
                .padding(.bottom, 18)
                .padding(.trailing, 12)
            }
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(pizzas) { pizza in
                        VStack(spacing: 8) {
                            Text(pizza.emoji)
                                .font(.system(size: 40))
                            Text(pizza.name)
                                .font(.headline)
                            Text(pizza.location)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            // Population progress
                            VStack(alignment: .leading, spacing: 4) {
                                HStack {
                                    Text("Popularity")
                                        .font(.caption2)
                                        .foregroundColor(.gray)
                                    Spacer()
                                    Text("\(pizza.population)M")
                                        .font(.caption2)
                                        .foregroundColor(.gray)
                                }
                                ProgressView(value: Float(pizza.population), total: Float(pizza.maxPopulation))
                                    .accentColor(.orange)
                                    .scaleEffect(x: 1, y: 1.3, anchor: .center)
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .fill(Color.white.opacity(0.85))
                                .shadow(color: Color.orange.opacity(0.18), radius: 16, x: 0, y: 8)
                                .shadow(color: Color.black.opacity(0.08), radius: 2, x: 0, y: 1)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .stroke(Color.orange.opacity(0.12), lineWidth: 1)
                        )
                    }
                }
                .padding()
            }
        }
        .background(
            ZStack {
                // Pizza emoji background
                Color(.systemBackground)
                ForEach(0..<12) { i in
                    let x = CGFloat((i % 4) * 100 + 30)
                    let y = CGFloat((i / 4) * 100 + 80)
                    Text(["🍕", "🍍", "🧀", "🍗"][i % 4])
                        .font(.system(size: 60))
                        .opacity(0.07)
                        .position(x: x, y: y)
                }
            }
        )
    }
}

#Preview {
    ContentView()
}
