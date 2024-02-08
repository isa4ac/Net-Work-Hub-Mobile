//
//  MainLoadingView.swift
//  Net Work Hub
//
//  Created by Isaac Vanmeter on 10/31/23.
//

import SwiftUI

struct SplashScreenView: View {
    @Environment(\.colorScheme) private var colorScheme
    @State private var isActive = false
    @State private var size = 0.8
    @State private var progress: CGFloat = 0
    let gradient1 = Gradient(colors: [.primary, .purple])
    let gradient2 = Gradient(colors: [Color(red: 0.44, green: 0.4, blue: 0.53) , Color(red: 0.44, green: 0.4, blue: 0.53), .white])
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {	
                Rectangle()
                    .animatableGradient(fromGradient: gradient1, toGradient: gradient2, progress: progress)
                    .ignoresSafeArea()
                    .onAppear {
                        withAnimation(.linear(duration: 2).repeatForever(autoreverses: true)) {
                            self.progress = 1
                        }
                    }
                    .mask(
                        VStack(spacing: 0) {
                            Text("Net-work Hub")
                                .font(.largeTitle)
                                .bold()
                        }
                            .scaleEffect(size)
                            .onAppear {
                                withAnimation(.easeInOut(duration: 0.8)) {
                                    self.size = 1.2
                                }
                            }
                    )
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    self.isActive = true
                }
            }
        }
    }
}

extension View {
    func animatableGradient(fromGradient: Gradient, toGradient: Gradient, progress: CGFloat) -> some View {
        self.modifier(AnimatableGradientModifier(fromGradient: fromGradient, toGradient: toGradient, progress: progress))
    }
}

struct AnimatableGradientModifier: AnimatableModifier {
    let fromGradient: Gradient
    let toGradient: Gradient
    var progress: CGFloat = 0.0
 
    var animatableData: CGFloat {
        get { progress }
        set { progress = newValue }
    }
 
    func body(content: Content) -> some View {
        var gradientColors = [Color]()
 
        for i in 0..<fromGradient.stops.count {
            let fromColor = UIColor(fromGradient.stops[i].color)
            let toColor = UIColor(toGradient.stops[i].color)
 
            gradientColors.append(colorMixer(fromColor: fromColor, toColor: toColor, progress: progress))
        }
 
        return LinearGradient(gradient: Gradient(colors: gradientColors), startPoint: .bottomTrailing, endPoint: .topLeading)
    }
 
    func colorMixer(fromColor: UIColor, toColor: UIColor, progress: CGFloat) -> Color {
        guard let fromColor = fromColor.cgColor.components else { return Color(fromColor) }
        guard let toColor = toColor.cgColor.components else { return Color(toColor) }
 
        let red = fromColor[0] + (toColor[0] - fromColor[0]) * progress
        let green = fromColor[1] + (toColor[1] - fromColor[1]) * progress
        let blue = fromColor[2] + (toColor[2] - fromColor[2]) * progress
 
        return Color(red: Double(red), green: Double(green), blue: Double(blue))
    }
}

#Preview {
    SplashScreenView()
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
