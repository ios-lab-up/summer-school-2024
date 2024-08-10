# Mi Aplicación Increíble

![image](https://github.com/user-attachments/assets/d10f168a-5255-4c2f-9bd1-37920c6b2795)

## Descripción
Esta aplicación demuestra cómo integrar una escena de Spline en SwiftUI y crear una pantalla de inicio moderna con un botón de efecto cristal. Es un excelente punto de partida para aprender SwiftUI y personalizar la apariencia de una aplicación.

## Objetivos de la clase
- Entender la estructura básica de una aplicación SwiftUI.
- Aprender a integrar una escena de Spline en SwiftUI.
- Crear y personalizar un botón con un efecto de cristal.
- Utilizar colores en formato hexadecimal en SwiftUI.

## Preparación del Proyecto

### Crear un nuevo proyecto en Xcode
1. Abrir Xcode y seleccionar "Create a new Xcode project".
2. Seleccionar "App" y hacer clic en "Next".
3. Nombrar el proyecto, seleccionar "SwiftUI" como interfaz y "Swift" como lenguaje, luego hacer clic en "Next" y "Create".

### Agregar Spline Runtime
1. Ir a `File > Add Packages...`.
2. Ingresar `https://github.com/spline-design/spline-runtime-swift` en el campo de búsqueda y agregar el paquete.

## Desarrollo de la Interfaz

### Crear y configurar ContentView
1. Añadir la extensión de `Color` para soportar hexadecimales.

   ```swift
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
   ```

2. Crear el diseño de la pantalla:

   ```swift
   struct ContentView: View {
       // Variables para personalizar
       let colorDeFondo: Color = Color(hex: "#0c131f")
       let colorDelBoton: Color = Color(hex: "#32FF89").opacity(0.7)
       let colorDelTexto: Color = Color(hex: "#FFFFFF")
       let nombreDeLaApp: String = "Mi Aplicación Increíble"
       let nombreDelCreador: String = "Creado por Tu Nombre"
       let escenaDeSpline = URL(string: "https://build.spline.design/dXKPmuJd03hml8azuluN/scene.splineswift")!
       
       var body: some View {
           VStack(spacing: 20) {
               // Escena de Spline
               SplineView(sceneFileURL: escenaDeSpline)
                   .frame(height: 550) // Ajustar altura según sea necesario
                   .shadow(radius: 10)
                   .ignoresSafeArea(.all)
               
               // Nombre de la aplicación
               Text(nombreDeLaApp)
                   .font(.largeTitle)
                   .fontWeight(.bold)
                   .padding(.top, 20)
                   .foregroundColor(colorDelTexto)
               
               // Nombre del creador
               Text(nombreDelCreador)
                   .font(.title2)
                   .foregroundColor(colorDelTexto)
               
               Spacer()
               
               // Botón de inicio
               Button(action: {
                   print("Botón de inicio presionado")
               }) {
                   Text("Inicio")
                       .font(.title2)
                       .fontWeight(.semibold)
                       .padding()
                       .frame(maxWidth: .infinity)
                       .background(
                           LinearGradient(gradient: Gradient(colors: [colorDelBoton, colorDelBoton.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                               .blur(radius: 10)
                               .opacity(0.8)
                               .clipShape(RoundedRectangle(cornerRadius: 15))
                       )
                       .overlay(
                           RoundedRectangle(cornerRadius: 15)
                               .stroke(Color.white.opacity(0.6), lineWidth: 1)
                       )
                       .foregroundColor(colorDelTexto)
                       .cornerRadius(15)
                       .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
               }
               .padding(.horizontal, 40)
               .padding(.bottom, 40)
           }
           .padding()
           .background(colorDeFondo)
           .edgesIgnoringSafeArea(.all)
       }
   }

   #Preview {
       ContentView()
   }
   ```

### Personalización y Pruebas
- **Personalización**: Cambiar los valores de las variables para personalizar colores y textos.
- **Pruebas**: Ejecutar el proyecto en el simulador y verificar que todo funcione correctamente.

### Conclusión y Preguntas
- **Recapitulación**: Revisar los conceptos cubiertos en la clase.
- **Preguntas**: Espacio para que los alumnos hagan preguntas y resuelvan dudas.
- **Siguiente Paso**: Sugerir proyectos adicionales para practicar.

### Recursos Adicionales
- **Documentación de SwiftUI**: [SwiftUI Documentation](https://developer.apple.com/documentation/swiftui/)
- **Documentación de Spline**: [Spline Runtime Documentation](https://github.com/spline-design/spline-runtime-swift)

