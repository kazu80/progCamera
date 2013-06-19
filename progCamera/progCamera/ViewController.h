//
//  ViewController.h
//  progCamera
//
//  Created by kazuyoshi kawakami on 13/06/19.
//  Copyright (c) 2013年 kazuyoshi kawakami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)clickCamera:(id)sender;
- (IBAction)clickGray:(id)sender;
- (IBAction)clickSepia:(id)sender;
- (IBAction)clickSave:(id)sender;

@end
