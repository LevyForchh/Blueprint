//
//  BlueprintViewAdditions.swift
//  BlueprintUI-Unit-Tests
//
//  Created by Kyle Van Essen on 2/21/20.
//

import UIKit

@testable import BlueprintUI

/**
 Testing additions to help verify native view construction and management.
 */
extension BlueprintView
{
    internal var rootNativeElementViews : [UIView] {
        self.rootNativeNodeView?.subviews ?? []
    }
    
    private var rootNativeNodeView : RootNativeNodeView? {
        for subview in self.subviews {
            if let view = subview as? RootNativeNodeView {
                return view
            }
        }
        
        return nil
    }
}
