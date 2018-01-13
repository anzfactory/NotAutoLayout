//
//  LayoutPropertyCanStoreBottomRightType.swift
//  NotAutoLayout
//
//  Created by 史翔新 on 2017/11/12.
//  Copyright © 2017年 史翔新. All rights reserved.
//

import Foundation

public protocol LayoutPropertyCanStoreBottomRightType: LayoutMakerPropertyType {
	
	associatedtype WillSetBottomRightProperty
	
	func storeBottomRight(_ bottomRight: LayoutElement.Point) -> WillSetBottomRightProperty
	
}

extension LayoutPropertyCanStoreBottomRightType {
	
	public func setBottomRight(to bottomRight: CGPoint) -> WillSetBottomRightProperty {
		
		let bottomRight = LayoutElement.Point.constant(bottomRight)
		
		let maker = self.storeBottomRight(bottomRight)
		
		return maker
		
	}
	
	public func setBottomRight(by bottomRight: @escaping (_ property: ViewFrameProperty) -> CGPoint) -> WillSetBottomRightProperty {
		
		let bottomRight = LayoutElement.Point.byParent(bottomRight)
		
		let maker = self.storeBottomRight(bottomRight)
		
		return maker
		
	}
	
	public func pinBottomRight(to referenceView: UIView?, with bottomRight: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> WillSetBottomRightProperty {
		
		return self.pinBottomRight(by: { [weak referenceView] in referenceView }, with: bottomRight)
		
	}
	
	public func pinBottomRight(by referenceView: @escaping () -> UIView?, with bottomRight: @escaping (ViewPinProperty<ViewPinPropertyType.Point>) -> CGPoint) -> WillSetBottomRightProperty {
		
		let bottomRight = LayoutElement.Point.byReference(referenceGetter: referenceView, bottomRight)
		
		let maker = self.storeBottomRight(bottomRight)
		
		return maker
		
	}
	
}

public protocol LayoutPropertyCanStoreBottomRightToEvaluateFrameType: LayoutPropertyCanStoreBottomRightType where WillSetBottomRightProperty == LayoutEditor {
	
	func evaluateFrame(bottomRight: LayoutElement.Point, parentView: UIView, property: ViewFrameProperty, fitting: (CGSize) -> CGSize) -> CGRect
	
}

extension LayoutPropertyCanStoreBottomRightToEvaluateFrameType {
	
	public func storeBottomRight(_ bottomRight: LayoutElement.Point) -> WillSetBottomRightProperty {
		
		let layout = Layout(frame: { (parentView, property, fitting) -> CGRect in
			return self.evaluateFrame(bottomRight: bottomRight, parentView: parentView, property: property, fitting: fitting)
		})

		let editor = LayoutEditor(layout)
		
		return editor
		
	}
	
}

@available(*, deprecated)
extension LayoutPropertyCanStoreBottomRightType {
	
	public func pinBottomRight(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetBottomRightProperty {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottomRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform)
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottomRight(to referenceView: UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetBottomRightProperty {
		
		let referenceView = { [weak referenceView] in referenceView }
		
		return self.pinBottomRight(by: referenceView, s: reference, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
	}
	
	public func pinBottomRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false) -> WillSetBottomRightProperty {
		
		let bottomRight = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: false)
		
		let maker = self.storeBottomRight(bottomRight)
		
		return maker
		
	}
	
	@available(iOS 11.0, *)
	public func pinBottomRight(by referenceView: @escaping () -> UIView?, s reference: CGRect.PlaneBasePoint, offsetBy offset: CGVector = .zero, ignoresTransform: Bool = false, safeAreaOnly shouldOnlyIncludeSafeArea: Bool) -> WillSetBottomRightProperty {
		
		let bottomRight = self.parentView.pointReference(reference, of: referenceView, offsetBy: offset, ignoresTransform: ignoresTransform, safeAreaOnly: shouldOnlyIncludeSafeArea)
		
		let maker = self.storeBottomRight(bottomRight)
		
		return maker
		
	}
	
}
