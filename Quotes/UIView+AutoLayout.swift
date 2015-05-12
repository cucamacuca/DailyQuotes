//
//  UIView+AutoLayout.swift
//  TraktCalendar
//
//  Created by Daniela on 10/21/14.
//  Copyright (c) 2014 Daniela. All rights reserved.
//
//  Thanks Daniela for awesome extension :)
//

import UIKit

extension UIView {
    
    
    // MARK: Fill super view
    
    func fillSuperview(edges: UIEdgeInsets) -> [NSLayoutConstraint] {
        
        return [self.addTopConstraint(toView: self.superview, attribute: .Top, relation: .Equal, constant: edges.top),
            self.addLeftConstraint(toView: self.superview, attribute: .Left, relation: .Equal, constant: edges.left),
            self.addRightConstraint(toView: self.superview, attribute: .Right, relation: .Equal, constant: edges.right),
            self.addBottomConstraint(toView: self.superview, attribute: .Bottom, relation: .Equal, constant: edges.bottom)]
    }
    
    
    // MARK: Right Constraint
    
    func addRightConstraint(toView view: UIView?, attribute: NSLayoutAttribute, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        var constraint: NSLayoutConstraint = self.addConstraint(fromView: self,
            attribute: .Right,
            relation: relation,
            toView: view,
            attribute: attribute,
            constant: constant)
        
        return constraint
    }
    
    
    // MARK: Left Constraint
    
    func addLeftConstraint(toView view: UIView?, attribute: NSLayoutAttribute, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        var constraint: NSLayoutConstraint = self.addConstraint(fromView: self,
            attribute: .Left,
            relation: relation,
            toView: view,
            attribute: attribute,
            constant: constant)
        
        return constraint
    }
    
    
    // MARK: Top Constraint
    
    func addTopConstraint(toView view: UIView?, attribute: NSLayoutAttribute, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        var constraint: NSLayoutConstraint = self.addConstraint(fromView: self,
            attribute: .Top,
            relation: relation,
            toView: view,
            attribute: attribute,
            constant: constant)
        
        return constraint
    }
    
    
    // MARK: Bottom Constraint
    
    func addBottomConstraint(toView view: UIView?, attribute: NSLayoutAttribute, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        var constraint: NSLayoutConstraint = self.addConstraint(fromView: self,
            attribute: .Bottom,
            relation: relation,
            toView: view,
            attribute: attribute,
            constant: constant)
        
        return constraint
    }
    
    
    // MARK: Center Y
    
    func addCenterYConstraint(toView view: UIView?, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        var constraint: NSLayoutConstraint = self.addConstraint(fromView: self,
            attribute: .CenterY,
            relation: relation,
            toView: view,
            attribute: .CenterY,
            constant: constant)
        
        return constraint
    }
    
    
    // MARK: Center X
    
    func addCenterXConstraint(toView view: UIView?, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        var constraint: NSLayoutConstraint = self.addConstraint(fromView: self,
            attribute: .CenterX,
            relation: relation,
            toView: view,
            attribute: .CenterX,
            constant: constant)
        
        return constraint
    }
    
    
    // MARK: Width
    
    func addWidthConstraint(toView view: UIView?, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        var constraint: NSLayoutConstraint = self.addConstraint(fromView: self,
            attribute: .Width,
            relation: relation,
            toView: view,
            attribute: .Width,
            constant: constant)
        
        return constraint
    }
    
    
    // MARK: Height
    
    func addHeightConstraint(toView view: UIView?, relation: NSLayoutRelation, constant: CGFloat) -> NSLayoutConstraint {
        
        var constraint: NSLayoutConstraint = self.addConstraint(fromView: self,
            attribute: .Height,
            relation: relation,
            toView: view,
            attribute: .Height,
            constant: constant)
        
        return constraint
    }
    
    
    // MARK: Private
    
    private func addConstraint(fromView view1: UIView, attribute attr1: NSLayoutAttribute, relation: NSLayoutRelation, toView view2: UIView?, attribute attr2: NSLayoutAttribute, constant: CGFloat) -> NSLayoutConstraint {
        
        view1.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        let constraint: NSLayoutConstraint = NSLayoutConstraint(item: view1,
            attribute: attr1,
            relatedBy: relation,
            toItem: view2,
            attribute: attr2,
            multiplier: 1.0,
            constant: constant)
        
        self.superview?.addConstraint(constraint)
        
        return constraint
    }
}
