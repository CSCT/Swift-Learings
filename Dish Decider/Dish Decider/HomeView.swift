//
//  ContentView.swift
//  Dish Decider
//
//  Created by Graceson Thompson on 1/19/25.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedMealTypes: Set<MealType> = []
    
    enum MealType: String, CaseIterable {
        case breakfast = "Breakfast"
        case lunch = "Lunch"
        case dinner = "Dinner"
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("What would you like to eat?")
                    .font(.title)
                    .padding()
                
                HStack(spacing: 8) {
                    ForEach(MealType.allCases, id: \.self) { mealType in
                        Button(action: {
                            if selectedMealTypes.contains(mealType) {
                                selectedMealTypes.remove(mealType)
                            } else {
                                selectedMealTypes.insert(mealType)
                            }
                        }) {
                            Text(mealType.rawValue)
                                .font(.callout)
                                .foregroundColor(selectedMealTypes.contains(mealType) ? .white : .black)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                                .padding(.horizontal, 8)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(selectedMealTypes.contains(mealType) ? Color.black : Color.white)
                                        .shadow(color: .gray.opacity(0.3), radius: 3, x: 0, y: 2)
                                )
                        }
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Dish Decider")
        }
    }
}

#Preview {
    HomeView()
}
