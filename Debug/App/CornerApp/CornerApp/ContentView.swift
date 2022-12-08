//
//  ContentView.swift
//  CornerApp
//
//  Created by Nail Sharipov on 30.11.2022.
//

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
                path.move(to: viewModel.dots[1])
                path.addArc(
                    center: viewModel.dots[1],
                    radius: 120,
                    startAngle: viewModel.start,
                    endAngle: viewModel.end,
                    clockwise: !viewModel.isClockWise
                )
                path.closeSubpath()
            }.fill(.yellow.opacity(0.1))
            
            Path() { path in
                path.move(to: CGPoint(x: 0, y: 0.5 * size.height))
                path.addLine(to: CGPoint(x: size.width, y: 0.5 * size.height))
                path.move(to: CGPoint(x: 0.5 * size.width, y: 0))
                path.addLine(to: CGPoint(x: 0.5 * size.width, y: size.height))
            }
            .stroke(style: .init(lineWidth: 1))
            .foregroundColor(.gray)
            VectorShape(a: viewModel.dots[1], b: viewModel.dots[0], arrow: 20)
                .stroke(style: .init(lineWidth: 4, lineCap: .round, lineJoin: .round))
                .foregroundColor(.blue)
            VectorShape(a: viewModel.dots[1], b: viewModel.dots[2], arrow: 20)
                .stroke(style: .init(lineWidth: 4, lineCap: .round, lineJoin: .round))
                .foregroundColor(.red)
            Circle()
                .fill(viewModel.color)
                .frame(width: 32, height: 32)
                .position(viewModel.testPoint)
                .zIndex(1)
                .gesture(DragGesture()
                    .onChanged { data in
                        viewModel.onDrag(data: data)
                    }
                    .onEnded { data in
                        viewModel.onEndDrag(data: data)
                    }
                )
            ForEach((0..<viewModel.dots.count), id: \.self) { id in
                Circle()
                    .fill(.white.opacity(0.1))
                    .frame(width: 32, height: 32)
                    .position(viewModel.dots[id])
                    .zIndex(1)
                    .gesture(DragGesture()
                        .onChanged { data in
                            viewModel.onDrag(index: id, data: data)
                        }
                        .onEnded { data in
                            viewModel.onEndDrag(index: id, data: data)
                        }
                    )
            }
            
            VStack {
                Toggle("Is Clock Wise", isOn: $viewModel.isClockWise).padding(8)
                Spacer()
            }
        }
        .padding()
    }
    
}
