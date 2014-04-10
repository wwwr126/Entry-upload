//
//  ViewController.h
//  Entry upload
//
//  Created by 林晓龙 on 14-4-10.
//  Copyright (c) 2014年 qc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import "UploadOp.h"

@interface ViewController : UIViewController{
    UIImagePickerController *imagePicker;
    UIImage *imagePicture;
    UIImageView *imagePhoto;
    NSString *notesToSend;
}

@property(nonatomic, retain) UIImagePickerController *imagePicker;

@property (copy) NSString *notesToSend;

@property (nonatomic, retain) UIImageView *imagePhoto;


@property (nonatomic, retain) UIImage *imagePicture;

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;

@end
