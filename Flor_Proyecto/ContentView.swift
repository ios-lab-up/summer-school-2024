//
//  ios_lab_summer_school_2024App.swift
//  ios-lab-summer-school-2024
//
//  Created by Flor Lazcano on 26/07/24.
//

import SwiftUI
import SplineRuntime

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct ContentView: View {
    @State private var flo = false
    let colorDeFondo: Color = Color(hex: "000004")
    let colorDelBoton: Color = Color(hex: "3C3C49").opacity(0.7)
    let colorDelTexto: Color = Color(hex: "FFFFFF")
    let nombreDeLaApp: String = "My World"
    let nombreDelCreador: String = "Flore"
    let escenaDeSpline = URL(string: "https://build.spline.design/rJ0A3pu20EHxR7SP6br6/scene.splineswift")!
    
    var body: some View {
        VStack {
            if flo {
                
            } else {
                VStack(spacing: 20) {
                    SplineView(sceneFileURL: escenaDeSpline)
                        .frame(height: 550) // Ajustar altura según sea necesario
                        .shadow(radius: 10)
                        .ignoresSafeArea(.all)
                    
                    Text(nombreDeLaApp)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                        .foregroundColor(colorDelTexto)
                    
                    Text(nombreDelCreador)
                        .font(.title2)
                        .foregroundColor(colorDelTexto)
                    
                    Spacer()
                    
                    Button(action: {
                        print("Botón de inicio presionado")
                        // Cambia el valor de 'flo' si deseas alternar la vista
                        flo.toggle()
                    }) {
                        Text("Inicio")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(colorDelBoton)
                            .foregroundColor(colorDelTexto)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 40)
                }
                .padding()
                .background(colorDeFondo)
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

#Preview {
    ContentView()
}
