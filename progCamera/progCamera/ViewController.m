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
}

- (IBAction)clickSepia:(id)sender {
}

- (IBAction)clickSave:(id)sender {
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    [self dismissViewControllerAnimated:YES completion:nil];
    self.imageView.image = image;
}

@end
