//
//  ViewController.swift
//  VerticalTimelineView
//
//  Created by Manish Kumar on 2022-03-06.
//

import UIKit

class ViewController: UIViewController {

    let timelineInputData: [TimelineRowModel] = [
        TimelineRowModel(isComplete: true,
                         date: "2022-02-10",
                         title: "Label Created",
                         description: "A label has been created by shipper using an online process and paying the postage for the shipment, but we have not yet received the item. It could also mean that the package has been shipped, but has not yet been scanned into the USPS tracking system."),
        TimelineRowModel(isComplete: true,
                         date: "2022-02-14",
                         title: "Item Received",
                         description: "The parcel has reached the Post Office near your destination on the expected day. Also, USPS has scheduled its delivery."),
        TimelineRowModel(isComplete: false,
                         date: "2022-03-03",
                         title: "Item Shipped",
                         description: "USPS has done the procedure to ship the package to the destination hub. Here also, USPS would mention the package’s ZIP code, city, and state’s name."),
        TimelineRowModel(isComplete: false,
                         date: "2022-03-12",
                         title: "Item Delivered",
                         description: "USPS has successfully delivered the item at its destination address.")
    ]
    
    @IBOutlet weak var timelineStack: TimelineStack!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timelineStack.timelineInputData = self.timelineInputData
    }
}

