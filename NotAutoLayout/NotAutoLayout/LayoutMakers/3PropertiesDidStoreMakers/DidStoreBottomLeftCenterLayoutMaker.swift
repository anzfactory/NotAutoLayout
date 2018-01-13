//
//  DidStoreBottomLeftCenterLayoutProperty.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct DidStoreBottomLeftCenterLayoutProperty {
	
	let bottomLeft: LayoutElement.Point
	
	let center: LayoutElement.Horizontal
	
}

// MARK: - Make Frame
extension DidStoreBottomLeftCenterLayoutProperty {
	
	private func makeFrame(bottomLeft: CGPoint, center: CGFloat, top: CGFloat) -> CGRect {
		
		let height = bottomLeft.y - top
		
		return self.makeFrame(bottomLeft: bottomLeft, center: center, height: height)
		
	}
	
	private func makeFrame(bottomLeft: CGPoint, center: CGFloat, middle: CGFloat) -> CGRect {
		
		let height = (bottomLeft.y - middle).doubled
		
		return self.makeFrame(bottomLeft: bottomLeft, center: center, height: height)
		
	}
	
	private func makeFrame(bottomLeft: CGPoint, center: CGFloat, height: CGFloat) -> CGRect {
		
		let x = bottomLeft.x
		let y = bottomLeft.y - height
		let width = (center - bottomLeft.x).doubled
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Line -
// MARK: Top
extension DidStoreBottomLeftCenterLayoutProperty: LayoutPropertyCanStoreTopToEvaluateFrameType {
	
	public typealias WillSetTopProperty = LayoutEditor
	
	public func evaluateFrame(top: LayoutElement.Vertical, property: ViewFrameProperty) -> CGRect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: property)
		let center = self.center.evaluated(from: property)
		let top = top.evaluated(from: property)
		
		return self.makeFrame(bottomLeft: bottomLeft, center: center, top: top)
		
	}
	
}

// MARK: Middle
extension DidStoreBottomLeftCenterLayoutProperty: LayoutPropertyCanStoreMiddleToEvaluateFrameType {
	
	public typealias WillSetMiddleProperty = LayoutEditor
	
	public func evaluateFrame(middle: LayoutElement.Vertical, property: ViewFrameProperty) -> CGRect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: property)
		let center = self.center.evaluated(from: property)
		let middle = middle.evaluated(from: property)
		
		return self.makeFrame(bottomLeft: bottomLeft, center: center, middle: middle)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension DidStoreBottomLeftCenterLayoutProperty: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public typealias WillSetHeightProperty = LayoutEditor
	
	public func evaluateFrame(height: LayoutElement.Length, property: ViewFrameProperty, fittingCalculation: (CGSize) -> CGSize) -> CGRect {
		
		let bottomLeft = self.bottomLeft.evaluated(from: property)
		let center = self.center.evaluated(from: property)
		let width = (center - bottomLeft.x).doubled
		let height = height.evaluated(from: property, fitting: fittingCalculation, withTheOtherAxis: .width(width))
		
		return self.makeFrame(bottomLeft: bottomLeft, center: center, height: height)
		
	}
	
}
