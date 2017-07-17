//
//  AuthorizationViewController.m
//  MyParty
//
//  Created by Admin on 16.07.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "AuthorizationViewController.h"
#import <VMaskTextField/VMaskTextField.h>


@interface AuthorizationViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *viewAroundSentSmsButton;
@property (weak, nonatomic) IBOutlet VMaskTextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UIView *backgroundView;

@end

@implementation AuthorizationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setGradientBackground];
    
    self.title = @"Вход";
    
    self.phoneNumberTextField.mask = @"### (##) ###-##-##";
    self.phoneNumberTextField.delegate = self;
}


- (void)viewDidLayoutSubviews{
    self.viewAroundSentSmsButton.layer.cornerRadius = 10;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



#pragma mark - VMaskTextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return [self.phoneNumberTextField shouldChangeCharactersInRange:range replacementString:string];
}



#pragma mark - Other -

- (void) setGradientBackground{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.backgroundView.bounds;
    gradient.startPoint = CGPointZero;
    gradient.endPoint = CGPointMake(1, 1);
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:34.0/255.0 green:211/255.0 blue:198/255.0 alpha:1.0] CGColor],(id)[[UIColor colorWithRed:145/255.0 green:72.0/255.0 blue:203/255.0 alpha:1.0] CGColor], nil];
    [self.backgroundView.layer addSublayer:gradient];
}


- (UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}


@end
