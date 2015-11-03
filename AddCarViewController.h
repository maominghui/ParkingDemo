//
//  AddCarViewController.h
//  RRTCC
//
//  Created by 鹿永超 on 15/7/16.
//  Copyright (c) 2015年 brzt.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BSKeyboardControls.h"
#import "iOSCombobox.h"

@interface AddCarViewController : UIViewController<BSKeyboardControlsDelegate,iOSComboboxDelegate,UITextFieldDelegate>

@property(nonatomic, strong) BSKeyboardControls *keybc;
@property (strong, nonatomic) IBOutlet UITextField *carNumber;

@end
