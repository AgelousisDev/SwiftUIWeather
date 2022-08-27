//
//  Extensions.swift
//  SwiftUIWeather
//
//  Created by Vagelis Agelousis on 03/08/2022.
//

import UserNotifications
import UIKit
import Foundation
import SwiftUI

typealias DownloadImageCompletionBlock = (UIImage) -> Void

var isOnPreview: Bool {
    return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
}

extension UNNotificationAttachment {

    static func create(identifier: String, image: UIImage, options: [NSObject : AnyObject]?) -> UNNotificationAttachment? {
            let fileManager = FileManager.default
            let tmpSubFolderName = ProcessInfo.processInfo.globallyUniqueString
            let tmpSubFolderURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(tmpSubFolderName, isDirectory: true)
            do {
                try fileManager.createDirectory(at: tmpSubFolderURL, withIntermediateDirectories: true, attributes: nil)
                let imageFileIdentifier = "\(identifier).png"
                let fileURL = tmpSubFolderURL.appendingPathComponent(imageFileIdentifier)
                let imageData = UIImage.pngData(image)
                try imageData()?.write(to: fileURL)
                let imageAttachment = try UNNotificationAttachment.init(identifier: imageFileIdentifier, url: fileURL, options: options)
                return imageAttachment
            } catch {
                print("error " + error.localizedDescription)
            }
            return nil
        }
    
}

extension URL {
 
    func downloadImage(downloadImageCompletionBlock: @escaping DownloadImageCompletionBlock) {
        URLSession.shared.dataTask(with: self) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async {
                downloadImageCompletionBlock(image)
            }
        }.resume()
    }
    
}
