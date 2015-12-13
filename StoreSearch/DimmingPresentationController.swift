//
//  DimmingPresentationController.swift
//  StoreSearch
//
//  Created by Shaohui Yang on 12/12/15.
//  Copyright © 2015 Shaohui Yang. All rights reserved.
//

import UIKit

class DimmingPresentationController: UIPresentationController {
    override func shouldRemovePresentersView() -> Bool {
        return false
    }
}
