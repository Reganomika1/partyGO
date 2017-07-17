//
//  PageContentViewController.m
//  MyParty
//
//  Created by Admin on 15.07.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "PageContentViewController.h"
#import "AuthorizationViewController.h"
#import "SWRevealViewController.h"


typedef enum {
    RoundedCornerTOP,
    RoundedCornerLEFT,
    RoundedCornerRIGHT,
    RoundedCornerBOTTOM
} RoundedCorner;

@interface PageContentViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *decriptionImageView;
@property (weak, nonatomic) IBOutlet UIButton *skipButton;
@property (weak, nonatomic) IBOutlet UIButton *registrationButton;
@property (weak, nonatomic) IBOutlet UIView *descriptionView;


@end

@implementation PageContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(self.pageIndex == 3){
        self.registrationButton.hidden = NO;
        [self.skipButton setTitle:@"Начать" forState:UIControlStateNormal];
    } else {
        self.registrationButton.hidden = YES;
        [self.skipButton setTitle:@"Пропустить" forState:UIControlStateNormal];
    }
    self.decriptionImageView.image = [UIImage imageNamed:self.imageURL];
}


- (void)viewDidLayoutSubviews{
    self.descriptionView.layer.cornerRadius = 10;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}




#pragma mark - Customize -

-(void)makeRoundedCornerRadius:(RoundedCorner)side withRadius:(CGFloat)radius forView:(UIView*)view{
    UIBezierPath *maskPath;
    if (side == RoundedCornerTOP){
        maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(radius, radius)];
    } else if (side == RoundedCornerLEFT){
        maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerTopLeft| UIRectCornerBottomLeft cornerRadii:CGSizeMake(radius, radius)];
    } else if (side == RoundedCornerRIGHT){
        maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerBottomRight| UIRectCornerTopRight cornerRadii:CGSizeMake(radius, radius)];
    } else if (side == RoundedCornerBOTTOM){
        maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:UIRectCornerBottomLeft| UIRectCornerBottomRight cornerRadii:CGSizeMake(radius, radius)];
    }
    
    CAShapeLayer *maskLayer = [CAShapeLayer new];
    maskLayer.frame = view.bounds;
    maskLayer.path = maskPath.CGPath;
    view.layer.mask = maskLayer;
}



#pragma mark - Actions -

- (IBAction)skipButtonPressed:(UIButton *)sender {
    if([sender.titleLabel.text isEqualToString:@"Пропустить"]){
            [[NSNotificationCenter defaultCenter] postNotificationName:@"indexChange" object:@(self.pageIndex)];
    } else {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Reveal" bundle:[NSBundle mainBundle]];
        SWRevealViewController *revealViewController = [storyboard instantiateViewControllerWithIdentifier:@"RevealViewController"];
        revealViewController.rearViewRevealWidth = self.view.frame.size.width - 58;
        [self presentViewController:revealViewController animated:YES completion:nil];
    }
}


- (IBAction)registrationButtonPressed:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Authorization" bundle:[NSBundle mainBundle]];
    AuthorizationViewController *authorizationViewController = [storyboard instantiateViewControllerWithIdentifier:@"authorizationViewController"];

    [self presentViewController:authorizationViewController animated:YES completion:nil];
}


@end
