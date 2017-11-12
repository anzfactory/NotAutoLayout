//
//  TopRightLeftDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct TopRightLeftDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let topRight: LayoutElement.Point
	
	let left: LayoutElement.Line
	
}

extension TopRightLeftDidSetLayoutMaker {
	
	private func makeFrame(topRight: CGPoint, left: CGFloat, bottom: CGFloat) -> CGRect {
		
		let x = left
		let y = topRight.y
		let width = topRight.x - left
		let height = bottom - topRight.y
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
	private func makeFrame(topRight: CGPoint, left: CGFloat, height: CGFloat) -> CGRect {
		
		let x = left
		let y = topRight.y
		let width = topRight.x - left
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

extension TopRightLeftDidSetLayoutMaker: LayoutMakerCanSetBottomToMakeLayoutEditorType {
	
	public typealias WillSetBottomMaker = LayoutEditor
	
	public func makeFrame(bottom: LayoutElement.Line, evaluatedFrom parameter: LayoutControlParameter) -> CGRect {
		let topRight = self.topRight.evaluated(from: parameter)
		let left = self.left.evaluated(from: parameter)
		let bottom = bottom.evaluated(from: parameter)
		return self.makeFrame(topRight: topRight, left: left, bottom: bottom)
	}
	
}

extension TopRightLeftDidSetLayoutMaker: LayoutMakerCanSetHeightToMakeLayoutEditorType {
	
	public typealias WillSetHeightMaker = LayoutEditor
	
	public func makeFrame(height: LayoutElement.Length, parameter: LayoutControlParameter) -> CGRect {
		
		let topRight = self.topRight.evaluated(from: parameter)
		let left = self.left.evaluated(from: parameter)
		let width = topRight.x - left
		let height = height.evaluated(from: parameter, theOtherAxis: .width(width))
		return self.makeFrame(topRight: topRight, left: left, height: height)
		
	}
	
}
