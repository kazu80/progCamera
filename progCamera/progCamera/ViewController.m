//
//  ViewController.m
//  progCamera
//
//  Created by kazuyoshi kawakami on 13/06/19.
//  Copyright (c) 2013年 kazuyoshi kawakami. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickCamera:(id)sender {
    
    UIImagePickerController *ip = [[UIImagePickerController alloc] init];
//    ip.sourceType = UIImagePickerControllerSourceTypeCamera;
//    ip.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    ip.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    ip.allowsEditing = YES;
    ip.delegate = self;
    [self presentViewController:ip animated:YES completion:nil];
    
}

- (IBAction)clickGray:(id)sender {
    // 白黒
    // 
    CIImage * ci = [[CIImage alloc] initWithImage:self.imageView.image];
    CIFilter * filter = [CIFilter filterWithName:@"CIColorMonochrome" keysAndValues:kCIInputImageKey,
                         ci,
                         @"inputColor",
                         [CIColor colorWithRed:0.75 green:0.75 blue:0.75],
                         @"inputIntensity",
                         [NSNumber numberWithFloat:1.0],
                         nil];
    CIContext * context = [CIContext contextWithOptions:nil];
    CGImageRef cgimg = [context createCGImage:[filter outputImage] fromRect:[[filter outputImage] extent]];
    UIImage * img = [UIImage imageWithCGImage:cgimg
                     scale:1.0
                                  orientation:UIImageOrientationUp];
    CGImageRelease(cgimg);
    self.imageView.image = img;
    
                         
    
}

- (IBAction)clickSepia:(id)sender {
    // セピア色に変換
    CIImage * ci = [[CIImage alloc] initWithImage:self.imageView.image];
    CIFilter * filter = [CIFilter filterWithName:@"CISepiaTone"
                         keysAndValues:kCIInputImageKey,
                         ci,
                         @"inputIntensity",
                         [NSNumber numberWithFloat:0.8],
                         nil];
    CIContext * context = [CIContext contextWithOptions:nil];
    CGImageRef cgimg = [context createCGImage:[filter outputImage] fromRect:[[filter outputImage] extent]];
    UIImage * img = [UIImage imageWithCGImage:cgimg
                     scale:1.0
                                  orientation:UIImageOrientationUp];
    CGImageRelease(cgimg);
    self.imageView.image = img;
    
}

- (IBAction)clickSave:(id)sender {
    // 保存
    UIImage * image = self.imageView.image;
//    UIImageWriteToSavedPhotosAlbum(image, self, @selector(targetImage:didFinishedSaveingWithError:contextInfo:), nil);
    
    UIImageWriteToSavedPhotosAlbum(image,
                                   self,
                                   @selector(targetImage:didFinishedSaveingWithError:contextInfo:),
                                   nil);
}

- (void)targetImage:(UIImage*)image didFinishedSaveingWithError:(NSError*)error contextInfo:(void*)context
{
    if ( error) {
        // 保存に失敗
        UIAlertView * alert = [[UIAlertView alloc]
                               initWithTitle:@"" message:@"保存に失敗しました" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    } else {
        // 保存に成功
        UIAlertView * alert = [[UIAlertView alloc]
                               initWithTitle:@"" message:@"保存しました" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    [self dismissViewControllerAnimated:YES completion:nil];
    self.imageView.image = image;
}

@end
