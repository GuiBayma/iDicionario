//
//  ImagemGrandeViewController.h
//  Navigation
//
//  Created by Guilherme Bayma on 3/17/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Alfabeto.h"
#import "Letra.h"

@interface ImagemGrandeViewController : UIViewController <UITextFieldDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property Letra *letra;

@end
