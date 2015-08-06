//
//  ViewController.swift
//  phphotolibrary_demo
//
//  Created by Carl.Yang on 8/6/15.
//  Copyright (c) 2015 Carl.Yang. All rights reserved.
//

import UIKit
//import AssetsLibrary
import Photos

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func remove(sender: AnyObject) {
        self.removeImage()
    }
    
    @IBAction func save(sender: AnyObject) {
        
        let image1 = UIImage(named: "dongman0805.jpg")
//        image1?.accessibilityIdentifier = "carl"
        let image2 = UIImage(named: "fengjing0805.jpg")
        let image3 = UIImage(named: "huaqiangu0805.jpg")
        let image4 = UIImage(named: "mingxing0805.jpg")
        let image5 = UIImage(named: "xiaoqingxin0805.jpg")
        let image6 = UIImage(named: "chongwu0805.jpg")
        let image7 = UIImage(named: "jiguang805.jpg")
        let image8 = UIImage(named: "sheying0805.jpg")
        let image9 = UIImage(named: "touxiang0805.jpg")
        
        UIImageWriteToSavedPhotosAlbum(image1, nil, nil, nil)
        
        let imageList: NSArray = [image1!]//, image2!, image3!, image4!, image5!, image6!, image7!, image8!, image9!]
        
        for item in imageList {
            self.addImage(item as! UIImage)
        }
    }
    
    func addImage(image: UIImage) {
        PHPhotoLibrary.sharedPhotoLibrary().performChanges({ () -> Void in
            PHAssetChangeRequest.creationRequestForAssetFromImage(image)
            }, completionHandler: { (success, error) -> Void in
                if success {
                    println("success")
                } else {
                    println("失败")
                }
        })
    }
    
    func removeImage()
    {
        var fetchOptions: PHFetchOptions = PHFetchOptions.new()
//        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
        var fetchResult: PHFetchResult = PHAsset.fetchAssetsWithMediaType(PHAssetMediaType.Image, options: fetchOptions)
        if fetchResult.lastObject == nil {
            return
        }
        var lastImageAsset: PHAsset = fetchResult.lastObject as! PHAsset
        println("fetchResult.count: \(fetchResult.count)")
        
//        PHImageManager.defaultManager().requestImageForAsset(lastImageAsset,
//            targetSize: PHImageManagerMaximumSize,
//            contentMode: PHImageContentMode.AspectFill,
//            options: nil) { (image, info) -> Void in
//            println("image: \((image as UIImage).accessibilityIdentifier)")
//        }
        
        PHPhotoLibrary.sharedPhotoLibrary().performChanges({
            
            PHAssetChangeRequest.deleteAssets([lastImageAsset])
            }, completionHandler: { (success, error) -> Void in
                if success {
                    println("delete success")
                } else {
                    println("delete faild")
                }
        })
    }
}

