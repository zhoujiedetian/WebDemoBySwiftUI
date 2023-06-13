//
//  WBScrollViewController.swift
//  TestUI
//
//  Created by zhoujie on 2023/6/6.
//

import SwiftUI

struct WBScrollViewController<Content: View>: UIViewControllerRepresentable {
    
    let pageWidth: CGFloat
    let contentSize: CGSize
    let content: Content
    @Binding var isLeft: CGFloat
    
    init(pageWidth: CGFloat,
         contentSize: CGSize,
         isLeft: Binding<CGFloat>,
         @ViewBuilder content: ()-> Content) {
        self.pageWidth = pageWidth
        self.contentSize = contentSize
        self._isLeft = isLeft
        self.content = content()
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        scrollView.delegate = context.coordinator
        context.coordinator.scrollView = scrollView
        
        let vc = UIViewController()
        vc.view.addSubview(scrollView)
        
        let host = UIHostingController(rootView: content)
        context.coordinator.host = host
        vc.addChild(host)
        scrollView.addSubview(host.view)
        host.didMove(toParent: vc)
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        let scrollView = context.coordinator.scrollView!
        scrollView.frame = CGRect(x: 0, y: 0, width: pageWidth, height: contentSize.height)
        scrollView.contentSize = contentSize
        scrollView.setContentOffset(CGPoint(x: isLeft * (contentSize.width - pageWidth), y: 0), animated: true)
        context.coordinator.host.view.frame = CGRect(origin: .zero, size: contentSize)
    }
    
    func makeCoordinator() -> WBCoordinator {
        return WBCoordinator(self)
    }
    
    class WBCoordinator: NSObject, UIScrollViewDelegate {
        let parent: WBScrollViewController
        var scrollView: UIScrollView!
        var host: UIHostingController<Content>!
        
        init(_ parent: WBScrollViewController) {
            self.parent = parent
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            withAnimation {
                parent.isLeft = scrollView.contentOffset.x < parent.pageWidth * 0.5 ? 0 : 1
            }
            
        }
    }
}
