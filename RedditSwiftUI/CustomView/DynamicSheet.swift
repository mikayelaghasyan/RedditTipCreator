//
//  DynamicSheet.swift
//  RedditSwiftUI
//
//  Created by Mikayel Aghasyan on 11/25/19.
//  Copyright © 2019 Mikayel Aghasyan. All rights reserved.
//

import SwiftUI

protocol DynamicSheetPresentable: View {
    var isPresented: Binding<Bool> { get set }
}

enum DragState {
    case inactive
    case dragging(translation: CGSize)
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}

struct DynamicSheet<SheetContent>: View where SheetContent: DynamicSheetPresentable {
    @EnvironmentObject var dynamicOverlayContext: DynamicOverlayContext

    var view: (Binding<Bool>) -> SheetContent

    @State var dimColor: Color = Color.clear
    @State var contentOffset: CGFloat = 0
    @State var contentSize: CGSize?
    @State var contentOpacity: Double = 0
    @State var isPresented: Bool = true

    @GestureState private var dragState = DragState.inactive

    var opacityFactor: Double {
        if let contentHeight = self.contentSize?.height {
            return Double((contentHeight - self.dragState.translation.height) / contentHeight)
        }
        return 1
    }

    var body: some View {
        let drag = DragGesture()
            .updating($dragState) { drag, state, _ in
                let yOffset = drag.translation.height
                let threshold = CGFloat(-50)
                let stiffness = CGFloat(0.3)
                if yOffset > threshold {
                    state = .dragging(translation: drag.translation)
                } else if -yOffset + (self.contentSize?.height ?? 0) < UIScreen.main.bounds.height + 30 {
                     let distance = yOffset - threshold
                     let translationHeight = threshold + (distance * stiffness)
                     state = .dragging(translation: CGSize(width: drag.translation.width, height: translationHeight))
                 }
        }.onEnded(onDragEnded)

        return ZStack {
            Group {
                if !self.isPresented {
                    ZStack {
                        EmptyView()
                    }.onAppear {
                        self.dismiss()
                    }
                }
                Rectangle()
                    .edgesIgnoringSafeArea(.all)
                    .foregroundColor(self.dimColor.opacity(self.opacityFactor))
//                    .animation(self.dragState.isDragging ? nil : .spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0))
                    .onTapGesture {
                        self.isPresented = false
                    }
                VStack {
                    Spacer()
                    self.view(self.$isPresented)
                    .background(
                        GeometryReader { geometry -> AnyView in
                            let size = geometry.size
                            DispatchQueue.main.async {
                                self.contentSize = size
                            }
                            return AnyView(Color.white)
                        }
                    )
                    .cornerRadius(7)
                    .padding(8)
                        .offset(y: self.contentOffset + self.dragState.translation.height)
//                    .animation(self.dragState.isDragging ? nil : .spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0))
                    .gesture(drag)
                }.opacity(self.contentOpacity)
            }
        }.onAppear {
            DispatchQueue.main.async {
                self.contentOffset = self.contentSize?.height ?? 0
                self.contentOpacity = 1
                withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0)) {
                    self.dimColor = Color.black.opacity(0.5)
                    self.contentOffset = 0
                }
            }
        }.onDisappear {
            withAnimation {
                self.dimColor = Color.clear
            }
        }
    }

    fileprivate func dismiss() {
        withAnimation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0)) {
            self.dimColor = Color.clear
            self.contentOffset = self.contentSize?.height ?? 0
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            self.dynamicOverlayContext.dismissOverlay()
        }
    }

    private func onDragEnded(drag: DragGesture.Value) {
        if drag.predictedEndTranslation.height > (self.contentSize?.height ?? 0) / 2.0 {
            DispatchQueue.main.async {
                self.dismiss()
            }
        }
    }
}
