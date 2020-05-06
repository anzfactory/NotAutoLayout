//
//  LayoutMaker<Property.WillAddAdditionalEvaluationProperty>.swift
//  NotAutoLayout
//
//  Created by 史　翔新 on 2017/09/26.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanAddAdditionalEvaluationType: LayoutMakerPropertyType {
	
	associatedtype WillAddAdditionalEvaluationProperty: LayoutMakerPropertyType
	
	func addEvaluation(_ evaluation: FrameAdditionalEvaluation) -> WillAddAdditionalEvaluationProperty
	
}

private extension LayoutMaker where Property: LayoutPropertyCanAddAdditionalEvaluationType {
	
	func addEvaluation(_ evaluation: FrameAdditionalEvaluation) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		let newProperty = self.didSetProperty.addEvaluation(evaluation)
		let newMaker = self.changintProperty(to: newProperty)
		
		return newMaker
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanAddAdditionalEvaluationType {
	
	public func movingLeft(to left: @escaping FrameAdditionalEvaluation.FloatEvaluation) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		let evaluation = FrameAdditionalEvaluation.moveLeftTo(left)
		let maker = self.addEvaluation(evaluation)
		
		return maker
		
	}
	
	public func movingLeft(to left: Float) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		return self.movingLeft(to: { _, _ in left })
		
	}
	
	public func movingCenter(to center: @escaping FrameAdditionalEvaluation.FloatEvaluation) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		let evaluation = FrameAdditionalEvaluation.moveCenterTo(center)
		let maker = self.addEvaluation(evaluation)
		
		return maker
		
	}
	
	public func movingCenter(to center: Float) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		return self.movingCenter(to: { _, _ in center })
		
	}
	
	public func movingRight(to right: @escaping FrameAdditionalEvaluation.FloatEvaluation) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		let evaluation = FrameAdditionalEvaluation.moveRightTo(right)
		let maker = self.addEvaluation(evaluation)
		
		return maker
		
	}
	
	public func movingRight(to right: Float) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		return self.movingRight(to: { _, _ in right })
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanAddAdditionalEvaluationType {
	
	public func movingTop(to top: @escaping FrameAdditionalEvaluation.FloatEvaluation) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		let evaluation = FrameAdditionalEvaluation.moveTopTo(top)
		let maker = self.addEvaluation(evaluation)
		
		return maker

	}
	
	public func movingTop(to top: Float) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		return self.movingTop(to: { _, _ in top })
		
	}
	
	public func movingMiddle(to middle: @escaping FrameAdditionalEvaluation.FloatEvaluation) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		let evaluation = FrameAdditionalEvaluation.moveMiddleTo(middle)
		let maker = self.addEvaluation(evaluation)
		
		return maker
		
	}
	
	public func movingMiddle(to middle: Float) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		return self.movingMiddle(to: { _, _ in middle })
		
	}
	
	public func movingBottom(to bottom: @escaping FrameAdditionalEvaluation.FloatEvaluation) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		let evaluation = FrameAdditionalEvaluation.moveBottomTo(bottom)
		let maker = self.addEvaluation(evaluation)
		
		return maker
		
	}
	
	public func movingBottom(to bottom: Float) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		return self.movingBottom(to: { _, _ in bottom })
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanAddAdditionalEvaluationType {
	
	public func movingX(by offset: @escaping FrameAdditionalEvaluation.FloatEvaluation) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		let evaluation = FrameAdditionalEvaluation.moveXBy(offset)
		let maker = self.addEvaluation(evaluation)
		
		return maker
		
	}
	
	public func movingX(by offset: Float) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		return self.movingX(by: { _, _ in offset })
		
	}
	
	public func movingY(by offset: @escaping FrameAdditionalEvaluation.FloatEvaluation) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		let evaluation = FrameAdditionalEvaluation.moveYBy(offset)
		let maker = self.addEvaluation(evaluation)
		
		return maker
		
	}
	
	public func movingY(by offset: Float) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		return self.movingY(by: { _, _ in offset })
		
	}
	
	public func movingOrigin(by offset: @escaping FrameAdditionalEvaluation.PointEvaluation) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		let evaluation = FrameAdditionalEvaluation.moveOriginBy(offset)
		let maker = self.addEvaluation(evaluation)
		
		return maker
		
	}
	
	public func movingOrigin(by offset: Point) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		return self.movingOrigin(by: { _, _ in offset })
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanAddAdditionalEvaluationType {
	
	public func pinchingLeft(to left: @escaping FrameAdditionalEvaluation.FloatEvaluation) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		let evaluation = FrameAdditionalEvaluation.pinchLeftTo(left)
		let maker = self.addEvaluation(evaluation)
		
		return maker
		
	}
	
	public func pinchingLeft(to left: Float) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		return self.pinchingLeft(to: { _, _ in left })
		
	}
	
	public func pinchingLeft(by left: @escaping FrameAdditionalEvaluation.FloatEvaluation) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		let evaluation = FrameAdditionalEvaluation.pinchLeftBy(left)
		let maker = self.addEvaluation(evaluation)
		
		return maker
		
	}
	
	public func pinchingLeft(by left: Float) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		return self.pinchingLeft(by: { _, _ in left })
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanAddAdditionalEvaluationType {
	
	public func pinchingRight(to right: @escaping FrameAdditionalEvaluation.FloatEvaluation) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		let evaluation = FrameAdditionalEvaluation.pinchRightTo(right)
		let maker = self.addEvaluation(evaluation)
		
		return maker
		
	}
	
	public func pinchingRight(to right: Float) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		return self.pinchingRight(to: { _, _ in right })
		
	}
	
	public func pinchingRight(by right: @escaping FrameAdditionalEvaluation.FloatEvaluation) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		let evaluation = FrameAdditionalEvaluation.pinchRightBy(right)
		let maker = self.addEvaluation(evaluation)
		
		return maker
		
	}
	
	public func pinchingRight(by right: Float) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		return self.pinchingRight(by: { _, _ in right })
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanAddAdditionalEvaluationType {
	
	public func pinchingTop(to top: @escaping FrameAdditionalEvaluation.FloatEvaluation) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		let evaluation = FrameAdditionalEvaluation.pinchTopTo(top)
		let maker = self.addEvaluation(evaluation)
		
		return maker
		
	}
	
	public func pinchingTop(to top: Float) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		return self.pinchingTop(to: { _, _ in top })
		
	}
	
	public func pinchingTop(by top: @escaping FrameAdditionalEvaluation.FloatEvaluation) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		let evaluation = FrameAdditionalEvaluation.pinchTopBy(top)
		let maker = self.addEvaluation(evaluation)
		
		return maker
		
	}
	
	public func pinchingTop(by top: Float) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		return self.pinchingTop(by: { _, _ in top })
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanAddAdditionalEvaluationType {
	
	public func pinchingBottom(to bottom: @escaping FrameAdditionalEvaluation.FloatEvaluation) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		let evaluation = FrameAdditionalEvaluation.pinchBottomTo(bottom)
		let maker = self.addEvaluation(evaluation)
		
		return maker
		
	}
	
	public func pinchingBottom(to bottom: Float) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		return self.pinchingBottom(to: { _, _ in bottom })
		
	}
	
	public func pinchingBottom(by bottom: @escaping FrameAdditionalEvaluation.FloatEvaluation) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		let evaluation = FrameAdditionalEvaluation.pinchBottomBy(bottom)
		let maker = self.addEvaluation(evaluation)
		
		return maker
		
	}
	
	public func pinchingBottom(by bottom: Float) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		return self.pinchingBottom(by: { _, _ in bottom })
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanAddAdditionalEvaluationType {
	
	public func expandingWidth(to width: @escaping FrameAdditionalEvaluation.FloatEvaluation, from reference: Line.Horizontal) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		let evaluation = FrameAdditionalEvaluation.expandWidthTo(width, from: reference)
		let maker = self.addEvaluation(evaluation)
		
		return maker
		
	}
	
	public func expandingWidth(to width: Float, from reference: Line.Horizontal) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		return self.expandingWidth(to: { _, _ in width }, from: reference)
		
	}
	
	public func expandingWidth(by diff: @escaping FrameAdditionalEvaluation.FloatEvaluation, from reference: Line.Horizontal) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		let evaluation = FrameAdditionalEvaluation.expandWidthBy(diff, from: reference)
		let maker = self.addEvaluation(evaluation)
		
		return maker
		
	}
	
	public func expandingWidth(by diff: Float, from reference: Line.Horizontal) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		return self.expandingWidth(by: { _, _ in diff }, from: reference)
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanAddAdditionalEvaluationType {
	
	public func expandingHeight(to height: @escaping FrameAdditionalEvaluation.FloatEvaluation, from reference: Line.Vertical) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		let evaluation = FrameAdditionalEvaluation.expandHeightTo(height, from: reference)
		let maker = self.addEvaluation(evaluation)
		
		return maker
		
	}
	
	public func expandingHeight(to height: Float, from reference: Line.Vertical) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		return self.expandingHeight(to: { _, _ in height }, from: reference)
		
	}
	
	public func expandingHeight(by diff: @escaping FrameAdditionalEvaluation.FloatEvaluation, from reference: Line.Vertical) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		let evaluation = FrameAdditionalEvaluation.expandHeightBy(diff, from: reference)
		let maker = self.addEvaluation(evaluation)
		
		return maker
		
	}
	
	public func expandingHeight(by diff: Float, from reference: Line.Vertical) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		return self.expandingHeight(by: { _, _ in diff }, from: reference)
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanAddAdditionalEvaluationType {
	
	public func expandingSize(to size: @escaping FrameAdditionalEvaluation.SizeEvaluation, from reference: Point) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		let evaluation = FrameAdditionalEvaluation.expandSizeTo(size, from: reference)
		let maker = self.addEvaluation(evaluation)
		
		return maker
		
	}
	
	public func expandingSize(to size: Size, from reference: Point) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		return self.expandingSize(to: { _, _ in size }, from: reference)
		
	}
	
	public func expandingSize(by diff: @escaping FrameAdditionalEvaluation.SizeEvaluation, from reference: Point) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		let evaluation = FrameAdditionalEvaluation.expandSizeBy(diff, from: reference)
		let maker = self.addEvaluation(evaluation)
		
		return maker
		
	}
	
	public func expandingSize(by diff: Size, from reference: Point) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		return self.expandingSize(by: { _, _ in diff }, from: reference)
		
	}
	
}

extension LayoutMaker where Property: LayoutPropertyCanAddAdditionalEvaluationType {
	
	public func addingProcess(by process: @escaping FrameAdditionalEvaluation.Process) -> LayoutMaker<Property.WillAddAdditionalEvaluationProperty> {
		
		let evaluation = FrameAdditionalEvaluation.addotionalProcess(process)
		let maker = self.addEvaluation(evaluation)
		
		return maker
		
	}
	
}
