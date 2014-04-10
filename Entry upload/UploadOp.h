//
//  UploadOp.h
//  Entry upload
//
//  Created by 林晓龙 on 14-4-10.
//  Copyright (c) 2014年 qc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UploadOp : NSOperation
{
    UIImage *imageToSend;
    NSString *notesToSend;
}


@property (retain) UIImage *imageToSend;
@property (copy) NSString *notesToSend;

- (NSString *)uploading;
@end
