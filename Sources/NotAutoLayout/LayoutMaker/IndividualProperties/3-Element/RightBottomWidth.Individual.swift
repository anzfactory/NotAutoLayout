//
//  RightBottomWidth.Individual.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

extension IndividualProperty {
	
	public struct RightBottomWidth {
		
		let right: LayoutElement.Horizontal
		
		let bottom: LayoutElement.Vertical
		
		let width: LayoutElement.Length
		
	}
	
}

// MARK: - Make Frame
extension IndividualProperty.RightBottomWidth {
	
	private func makeFrame(right: Float, bottom: Float, width: Float, height: Float) -> Rect {
		
		let x = right - width
		let y = bottom - height
		let frame = Rect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

// MARK: - Set A Length -
// MARK: Height
extension IndividualProperty.RightBottomWidth: LayoutPropertyCanStoreHeightToEvaluateFrameType {
	
	public func evaluateFrame(height: LayoutElement.Length, parameters: IndividualFrameCalculationParameters) -> Rect {
		
		let right = self.right.evaluated(from: parameters)
		let bottom = self.bottom.evaluated(from: parameters)
		let width = self.width.evaluated(from: parameters, withTheOtherAxis: .height(0))
		let height = height.evaluated(from: parameters, withTheOtherAxis: .width(width))
		
		return self.makeFrame(right: right, bottom: bottom, width: width, height: height)
		
	}
	
}
