//
//  ViewController.m
//  Entry upload
//
//  Created by 林晓龙 on 14-4-10.
//  Copyright (c) 2014年 qc. All rights reserved.
//

#import "ViewController.h"

#define FIRST_BTN_RECT	CGRectMake(32, 380, 64, 64)
#define IMagephoto CGRectMake(0.0, 45.0, 300, 300)

@interface ViewController ()

@end

@implementation ViewController

@synthesize imagePicker;
@synthesize imagePicture;
@synthesize imagePhoto;
@synthesize notesToSend;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    imagePhoto=[[UIImageView alloc]initWithFrame:CGRectMake(0.0, 45.0, 300, 300)];
    
    //    imagePhoto.image = [UIImage imageNamed:@"布.png"];
    [self.view addSubview:imagePhoto];
    
    //选择照片
    UIButton *btnchoose = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnchoose.frame = CGRectMake(30, 420, 60, 35);
    
    
    [btnchoose setTitle:@"选择照片" forState:UIControlStateNormal];
    [btnchoose setTitle:@"选择照片" forState:UIControlStateHighlighted];
    [btnchoose addTarget:self action:@selector(pickImage) forControlEvents:UIControlEventTouchUpInside];
    
    
    //拍照
    UIButton *btnphoto = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnphoto.frame = CGRectMake(90, 420, 60, 35);
    
    [btnphoto setTitle:@"拍照" forState:UIControlStateNormal];
    [btnphoto setTitle:@"拍照" forState:UIControlStateHighlighted];
    [btnphoto addTarget:self action:@selector(takePhoto) forControlEvents:UIControlEventTouchUpInside];
    
    //上传
    UIButton *btnupload = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnupload.frame = CGRectMake(140,420, 60, 35);
    
    [btnupload setTitle:@"上传" forState:UIControlStateNormal];
    [btnphoto setTitle:@"上传" forState:UIControlStateHighlighted];
    [btnupload addTarget:self action:@selector(Uploadop) forControlEvents:UIControlEventTouchUpInside];
    //    UIButton * firstBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    firstBtn.frame = FIRST_BTN_RECT;
    //    [firstBtn addTarget:self action:@selector(pickImageFromCamera) forControlEvents:UIControlEventAllTouchEvents];
    //    [firstBtn setBackgroundImage:[UIImage imageNamed:@"布.png"] forState:UIControlStateNormal];
    //    [self.view addSubview:firstBtn];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:btnchoose];
    [self.view addSubview:btnphoto];
    [self.view addSubview:btnupload];
    //    [self.view addSubview:imagePhoto];
    
    
    
    [btnchoose release];
    [btnphoto release];
    [btnupload release];
    [imagePhoto release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)Uploadop
{
    UploadOp *op = [[[UploadOp alloc] init] autorelease];
    op.imageToSend = self.imagePicture;
    //op.imageToSend = [UIImage imageWithContentsOfFile:@"/Volumes/Projects/Projects/Sunyong/PhotoNotes/PhotoNotes/images/Default.png"];
    op.notesToSend = self.notesToSend;
    NSString *result = [op uploading];
    NSLog(@"Result of Uploading: %@", result);
}


//从相册中选取
- (void)pickImage
{
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    ipc.delegate =self;
    ipc.allowsEditing =NO;
    [self presentModalViewController:ipc animated:YES];
}

-(void)takePhoto
{
    
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    ipc.delegate =self;
    ipc.allowsEditing =NO;
    [self presentModalViewController:ipc animated:YES];
    //    [self presentModalViewController:imagePicker animated:YES];
}
-(void)dealloc
{
    [imagePicker release];
    [imagePicture release];
    [imagePhoto release];
    [notesToSend release];
    //    [btnchoose release];
    //    [btnchoose super];
}


#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    UIImage *originalImage, *editedImage, *imageToSave;
    
    // 处理静态照片
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeImage, 0) == kCFCompareEqualTo) {
        editedImage = (UIImage *) [info objectForKey:UIImagePickerControllerEditedImage];
        originalImage = (UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];
        if (editedImage) {
            imageToSave = editedImage;
        }
        else {
            imageToSave = originalImage;
        }
        // 将静态照片（原始的或者被编辑过的）保存到相册（Camera Roll）
        UIImageWriteToSavedPhotosAlbum (imageToSave, nil, nil , nil);
        // 根据图片控件的尺寸缩放照片（只是为了显示效果。实际传输时依然使用原始照片）
        UIImage* scaledImage = [self imageWithImage:imageToSave scaledToSize:self.imagePhoto.bounds.size];
        self.imagePhoto.image = scaledImage;
        // 缓存传输照片
        self.imagePicture = imageToSave;
    }
    [picker dismissModalViewControllerAnimated:YES];
    [picker release];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissModalViewControllerAnimated:YES];
    [picker release];
}

#pragma mark - Utilities

- (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}


@end
