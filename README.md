# ios_phphotolibrary_demo
### What?
Save/Delete the images from the photo library.

### How?
Since iOS8, you can Delete the images using the [PHPhotoLibrary](https://developer.apple.com/library/prerelease/ios/documentation/Photos/Reference/PHAssetChangeRequest_Class/index.html#//apple_ref/doc/uid/TP40014384-CH1-SW2) class:

Save images:
```sh
PHPhotoLibrary.sharedPhotoLibrary().performChanges({ () -> Void in
    PHAssetChangeRequest.creationRequestForAssetFromImage(image)
    }, completionHandler: { (success, error) -> Void in
        if success {
            println("save image success")
         } else {
            println("save image faild")
         }
    })
```

Delete images:
```sh
PHPhotoLibrary.sharedPhotoLibrary().performChanges({
    PHAssetChangeRequest.deleteAssets([lastImageAsset])
    }, completionHandler: { (success, error) -> Void in
        if success {
           println("delete image success")
        } else {
           println("delete image faild")
        }
    })
```

### More about the PHPhotoLibrary class:
* https://codeandrelax.wordpress.com/2014/09/18/getting-the-last-photo-from-the-users-library-in-ios8/
* http://stackoverflow.com/questions/28724105/deleting-a-camera-roll-asset-using-photos-framework
* http://stackoverflow.com/questions/12127004/delete-an-asset-picture-or-video-from-iphone-in-ios
* http://stackoverflow.com/questions/29982064/how-to-delete-an-image-from-photolibrary-after-i-pick-it-up-using-uiimagepickerc
