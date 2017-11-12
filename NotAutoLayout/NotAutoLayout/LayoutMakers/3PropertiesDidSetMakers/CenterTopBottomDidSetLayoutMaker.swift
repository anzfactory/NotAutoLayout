//
//  CenterTopBottomDidSetLayoutMaker.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/06/20.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public struct CenterTopBottomDidSetLayoutMaker {
	
	public unowned let parentView: UIView
	
	let center: LayoutElement.Line
	
	let top: LayoutElement.Line
	
	let bottom: LayoutElement.Line
	
}

extension CenterTopBottomDidSetLayoutMaker {
	
	private func makeFrame(center: CGFloat, top: CGFloat, bottom: CGFloat, width: CGFloat) -> CGRect {
		
		let x = center - width.half
		let y = top
		let height = bottom - top
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
		
	}
	
}

extension CenterTopBottomDidSetLayoutMaker: LayoutMakerCanSetWidthToMakeLayoutEditorType {
	
	public typealias WillSetWidthMaker = LayoutEditor
	
	public func makeFrame(width: LayoutElement.Length, parameter: LayoutControlParameter) -> CGRect {
		let top = self.top.evaluated(from: parameter)
		let bottom = self.bottom.evaluated(from: parameter)
		let height = bottom - top
		let center = self.center.evaluated(from: parameter)
		let width = width.evaluated(from: parameter, theOtherAxis: .height(height))
		let x = center - width.half
		let y = top
		let frame = CGRect(x: x, y: y, width: width, height: height)
		
		return frame
	}
	
}
