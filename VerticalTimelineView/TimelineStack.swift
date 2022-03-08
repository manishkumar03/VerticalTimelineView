//
//  TimelineStack.swift
//  VerticalTimelineView
//
//  Created by Manish Kumar on 2022-03-06.
//

import UIKit

class TimelineStack: UIView {
    @IBOutlet weak var timelineStackview: UIStackView!
    
    var timelineInputData: [TimelineRowModel]? {
        didSet {
            populateRowData()
        }
    }

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
        }
    }
    
    func populateRowData() {
        if let timelineInputData = self.timelineInputData {
            for (idx, timelineRowModel) in timelineInputData.enumerated() {
                let timelineRow = TimelineRow()
                timelineRow.isComplete = timelineRowModel.isComplete
                timelineRow.rowDate.text = timelineRowModel.date
                timelineRow.rowTitle.text = timelineRowModel.title
                timelineRow.rowDescription.text = timelineRowModel.description
                if idx == timelineInputData.count - 1 {
                    timelineRow.isLast = true
                }
                self.timelineStackview.addArrangedSubview(timelineRow)
            }
        }
    }
}
