//
//  KeyBoardViewController.h
//  iGaoKao
//
//  Created by apple on 15/3/30.
//  Copyright (c) 2015年 wangxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyBoardViewController : UIViewController<UITextFieldDelegate>
//当键盘显示时当键盘盖住输入框时调用该方法
-(void)moveInputBarWithKeyboardHeight:(CGRect)keyBoardHeight withDuration:(NSTimeInterval)animationDuration;
//键盘即将显示与隐藏时调用
- (void)keyboardWillShow:(NSNotification *)notification;
- (void)keyboardWillHide:(NSNotification *)notification;
@end
