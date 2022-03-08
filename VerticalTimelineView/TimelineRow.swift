//
//  TimelineRow.swift
//  VerticalTimelineView
//
//  Created by Manish Kumar on 2022-03-06.
//

import UIKit

class TimelineRow: UIView {
    @IBOutlet weak var backgroundImageview: UIImageView!
    @IBOutlet weak var rowDate: UILabel!
    @IBOutlet weak var rowTitle: UILabel!
    @IBOutlet weak var rowDescription: UILabel!
    @IBOutlet weak var statusIconImageview: UIImageView!
    var isLast: Bool = false // Do not draw the dotted line for the last row

    // For loading from storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadNibContent()
    }
    
    // For loading through code
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadNibContent()
    }
    
    private func loadNibContent() {
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: nil)
        if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
            self.addSubview(view)

            view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                view.topAnchor.constraint(equalTo: self.topAnchor),
                view.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
            
            /* An alternate to using autolayout constraints is to use resizing mask
              view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
              view.translatesAutoresizingMaskIntoConstraints = true
              view.frame = bounds
             */
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !isLast {
            self.drawConnectingLine()
        }
    }
    
    func drawConnectingLine() {
        let renderer = UIGraphicsImageRenderer(bounds: self.bounds)
        let pattern: [CGFloat] = [6,4] // Draw a dotted line
        
        backgroundImageview.image = renderer.image { ctx in
            ctx.cgContext.setLineDash(phase: 0, lengths: pattern)
            UIColor.blue.set()
            let startPoint = statusIconImageview.center
            let endPoint = CGPoint(x: statusIconImageview.center.x, y: self.bounds.height)
            ctx.cgContext.strokeLineSegments(between: [startPoint, endPoint])
        }
    }
}
