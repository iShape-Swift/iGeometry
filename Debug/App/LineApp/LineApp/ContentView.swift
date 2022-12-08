//
//  ContentView.swift
//  LineApp
//
//  Created by Nail Sharipov on 06.12.2022.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    
    @StateObject
    var viewModel = ViewModel()
    
    var body: some View {
        GeometryReader() { proxy in
            content(size: proxy.size)
        }
        .frame(width: 400, height: 400)
    }
    
    private func content(size: CGSize) -> some View {
        viewModel.resize(size: size)
        return ZStack {
            Path() { path in
                path.move(to: CGPoint(x: 0, y: 0.5 * size.height))
                path.addLine(to: CGPoint(x: size.width, y: 0.5 * size.height))
                path.move(to: CGPoint(x: 0.5 * size.width, y: 0))
                path.addLine(to: CGPoint(x: 0.5 * size.width, y: size.height))
            }
            .stroke(style: .init(lineWidth: 1))
            .foregroundColor(.gray)
            
            Circle()
                .fill(viewModel.color)
                .frame(width: 32, height: 32)
                .position(viewModel.p)
                .zIndex(1)
                .gesture(DragGesture()
                    .onChanged { data in
                        viewModel.onDragP(data: data)
                    }
                    .onEnded { data in
                        viewModel.onEndDragP(data: data)
                    }
                )
            Circle()
                .fill(viewModel.color.opacity(0.5))
                .frame(width: 32, height: 32)
                .position(viewModel.a)
                .zIndex(1)
                .gesture(DragGesture()
                    .onChanged { data in
                        viewModel.onDragA(data: data)
                    }
                    .onEnded { data in
                        viewModel.onEndDragA(data: data)
                    }
                )
            Circle()
                .fill(viewModel.color.opacity(0.5))
                .frame(width: 32, height: 32)
                .position(viewModel.b)
                .zIndex(1)
                .gesture(DragGesture()
                    .onChanged { data in
                        viewModel.onDragB(data: data)
                    }
                    .onEnded { data in
                        viewModel.onEndDragB(data: data)
                    }
                )
            
            Path() { path in
                path.move(to: viewModel.a)
                path.addLine(to: viewModel.b)
                if viewModel.isSameLine {
                    path.move(to: viewModel.a)
                    path.addLine(to: viewModel.p)
                    path.move(to: viewModel.b)
                    path.addLine(to: viewModel.p)
                }
            }
            .stroke(style: .init(lineWidth: 4))
            .foregroundColor(viewModel.color)

            if let o = viewModel.o, !viewModel.isSameLine {
                VectorShape(a: o, b: viewModel.p, arrow: 20)
                    .stroke(style: .init(lineWidth: 4, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
    
}
