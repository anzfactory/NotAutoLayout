//
//  LeftBottom.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct LeftBottom {
		
		let left: LayoutElement.Horizontal
		
		let bottom: LayoutElement.Vertical
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.LeftBottom {
	
	private func makeFrame(left: Float, bottom: Float, size: Size) -> Rect {
		
		let top = bottom - size.height
		let origin = Point(x: left, y: top)
		let size = size
		let frame = Rect(origin: origin, size: size)
		
		return frame
		
	}
	
}

// MARK: - Set A Size -
// MARK: Size
extension IndividualProperty.LeftBottom: LayoutPropertyCanStoreSizeToEvaluateFrameType {
	
	public func evaluateFrame(size: LayoutElement.Size, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let left = self.left.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let size = size.evaluated(from: parameters)
		
		return self.makeFrame(left: left, bottom: bottom, size: size)
		
	}
	
}

// MARK: - Set A Length -
// MARK: Width
extension IndividualProperty.LeftBottom: LayoutPropertyCanStoreWidthType {
	
	public func storeWidth(_ width: LayoutElement.Length) -> IndividualProperty.LeftBottomWidth {
		
		let leftBottomWidth = IndividualProperty.LeftBottomWidth(left: self.left,
																 bottom: self.bottom,
																 width: width)
		
		return leftBottomWidth
		
	}
	
}

// MARK: Height
extension IndividualProperty.LeftBottom: LayoutPropertyCanStoreHeightType {
	
	public func storeHeight(_ height: LayoutElement.Length) -> IndividualProperty.LeftBottomHeight {
		
		let leftBottomHeight = IndividualProperty.LeftBottomHeight(left: self.left,
																   bottom: self.bottom,
																   height: height)
		
		return leftBottomHeight
		
	}
	
}
