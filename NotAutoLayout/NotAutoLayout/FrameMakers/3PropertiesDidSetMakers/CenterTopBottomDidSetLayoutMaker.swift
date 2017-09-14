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
	
	let center: CGRect.Float
	
	let top: CGRect.Float
	
	let bottom: CGRect.Float
	
}

extension CenterTopBottomDidSetLayoutMaker {
	
	public func setWidth(to width: CGFloat) -> Layout.Individual {
		
		if let center = self.center.constantValue, let top = self.top.constantValue, let bottom = self.bottom.constantValue {
			let height = bottom - top
			let x = center - width.half
			let y = top
			let frame = CGRect(x: x, y: y, width: width, height: height)
			let layout = Layout.Individual.makeAbsolute(frame: frame)
			
			return layout
			
		} else {
			let layout = Layout.Individual.makeCustom { (boundSize) -> CGRect in
				let top = self.top.closureValue(boundSize)
				let bottom = self.bottom.closureValue(boundSize)
				let height = bottom - top
				let center = self.center.closureValue(boundSize)
				let x = center - width.half
				let y = top
				let frame = CGRect(x: x, y: y, width: width, height: height)
				
				return frame
				
			}
			
			return layout
			
		}
		
	}
	
	public func setWidth(by width: @escaping (_ parameter: LayoutControlParameter) -> CGFloat) -> Layout.Individual {
		
		let layout = Layout.Individual.makeCustom { (parameter) -> CGRect in
			let top = self.top.closureValue(parameter)
			let bottom = self.bottom.closureValue(parameter)
			let height = bottom - top
			let center = self.center.closureValue(parameter)
			let width = width(parameter)
			let x = center - width.half
			let y = top
			let frame = CGRect(x: x, y: y, width: width, height: height)
			
			return frame
			
		}
		
		return layout
		
	}
	
}