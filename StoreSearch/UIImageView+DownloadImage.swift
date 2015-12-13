//
//  UIImageView+DownloadImage.swift
//  StoreSearch
//
//  Created by Shaohui Yang on 12/12/15.
//  Copyright © 2015 Shaohui Yang. All rights reserved.
//

import UIKit

extension UIImageView {
    func loadImageWithURL(url: NSURL) -> NSURLSessionDownloadTask {
        let session = NSURLSession.sharedSession()
        let downloadTask = session.downloadTaskWithURL(url) {
            [weak self] url, response, error in
            if error == nil, let url = url, let data = NSData(contentsOfURL: url), let image = UIImage(data: data) {
                dispatch_async(dispatch_get_main_queue()) {
                    if let strongSelf = self {
                        strongSelf.image = image
                    }
                }
            }
        }
        downloadTask.resume()
        return downloadTask
    }
}
