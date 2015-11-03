//
//  KeyBoardViewController.m
//  iGaoKao
//
//  Created by apple on 15/3/30.
//  Copyright (c) 2015年 wangxi. All rights reserved.
//

#import "KeyBoardViewController.h"

@interface KeyBoardViewController ()
{
    BOOL _flagHide;
}
@property (strong,nonatomic) UITextField *tempTextField;

@end

@implementation KeyBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tapGr.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGr];
}

-(void)viewTapped:(UITapGestureRecognizer*)tapGr
{
    if (_flagHide)
    {
        CGRect viewRect = self.view.bounds;
        viewRect.origin.y = 0;
        _flagHide = false;
    }
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UITextFieldDelegate方法
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.tempTextField = textField;
}
#pragma mark -
#pragma mark 当用户按下return键或者按回车键，keyboard消失
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_tempTextField resignFirstResponder];
    return YES;
}
#pragma mark -
#pragma mark 键盘即将显示时调用
- (void)keyboardWillShow:(NSNotification *)notification {
    _flagHide = TRUE;
    NSDictionary *userInfo = [notification userInfo];
    // Get the origin of the keyboard when it's displayed.
    NSValue* aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    // Get the top of the keyboard as the y coordinate of its origin in self's view's coordinate system. The bottom of the text view's frame should align with the top of the keyboard's final position.
    CGRect keyboardRect = [aValue CGRectValue];
    // Get the duration of the animation.
    NSValue *animationDurationValue = [userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration;
    [animationDurationValue getValue:&animationDuration];
    // Animate the resize of the text view's frame in sync with the keyboard's appearance.
    [self moveInputBarWithKeyboardHeight:keyboardRect withDuration:animationDuration];
}
#pragma mark -
#pragma mark 键盘隐藏时调用
- (void)keyboardWillHide:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    // Get the origin of the keyboard when it's displayed.
    NSValue* aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];//获取键盘的尺寸
    CGRect tempFrame = [self.view convertRect:_tempTextField.frame fromView:_tempTextField];
    int offset = tempFrame.origin.y + _tempTextField.frame.size.height - (self.view.frame.size.height - keyboardRect.size.height);
    [UIView animateWithDuration:0.30f animations:^{
        //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
        if(offset > 0)
        {
            CGRect tempRect = self.view.frame;
            tempRect.origin.y = 64;
            self.view.frame = tempRect;
        }
    }];
}
#pragma mark -
#pragma mark 增加键盘的点击监听事件
-(void)viewDidAppear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillChangeFrameNotification
                                               object:nil];
}
#pragma mark -
#pragma mark 移除键盘的监听事件
- (void)viewDidDisappear:(BOOL)animated
{
    CGRect viewRect = self.view.bounds;
    viewRect.origin.y = 0;
    _flagHide = false;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.view endEditing:YES];
}
#pragma mark -
#pragma mark 改变键盘的位置-防止键盘遮住文本输入框
-(void)moveInputBarWithKeyboardHeight:(CGRect)keyBoardHeight withDuration:(NSTimeInterval)animationDuration
{
    CGRect frame;
    if ([[[_tempTextField superview] superview] isKindOfClass:[UITableViewCell class]]) {
        frame = [self.view convertRect:_tempTextField.frame fromView:_tempTextField];
    }
    else
    {
        frame = _tempTextField.frame;
    }
    int offset = frame.origin.y + _tempTextField.frame.size.height - (self.view.frame.size.height - keyBoardHeight.size.height);
    [UIView animateWithDuration:animationDuration animations:^{
        //将视图的Y坐标向上移动offset个单位，以使下面腾出地方用于软键盘的显示
        if(offset > 0)
        {
            CGRect tempRect = self.view.frame;
            tempRect.origin.y = -offset;
            self.view.frame = tempRect;
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
