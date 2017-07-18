//
//  SideMenuViewController.m
//  MyParty
//
//  Created by Zakhar on 7/17/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "SideMenuViewController.h"

@interface SideMenuViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userPhoneNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *userSexLabel;

@property (strong, nonatomic) NSArray *names;
@property (strong, nonatomic) NSArray *identifiers;
@property (strong, nonatomic) NSArray *images;
@property (assign, nonatomic) NSInteger selectedIndex;

@end

@implementation SideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.backgroundColor = [UIColor colorWithRed:145/255.0 green:72.0/255.0 blue:203/255.0 alpha:1];
    
    self.identifiers = @[@"Profile", @"MakeParty", @"SearchParty", @"Settings", @"Authorization"];
    self.names = @[@"Профиль", @"Создать вечеринку", @"Найти вечеринку", @"Настройки", @"Вход"];
    self.images = @[
                    [UIImage imageNamed:@"ic_menu"],
                    [UIImage imageNamed:@"ic_menu"],
                    [UIImage imageNamed:@"ic_menu"],
                    [UIImage imageNamed:@"ic_menu"],
                    [UIImage imageNamed:@"ic_menu"]
                    ];
    
    self.userImageView.layer.cornerRadius = self.userImageView.frame.size.width/2;
    self.userImageView.clipsToBounds = YES;
    self.selectedIndex = -1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



#pragma mark - UITableViewDatasource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.identifiers count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:self.identifiers[indexPath.row]];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.identifiers[indexPath.row]];
    }
    
    cell.textLabel.text = self.names[indexPath.row];
    cell.imageView.image = self.images[indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    if(self.selectedIndex == indexPath.row){
        cell.contentView.backgroundColor = [UIColor colorWithRed:145/255.0 green:72.0/255.0 blue:203/255.0 alpha:0.8];
    } else {
        cell.contentView.backgroundColor = [UIColor colorWithRed:145/255.0 green:72.0/255.0 blue:203/255.0 alpha:1];
    }
    
    return cell;
}



#pragma mark - UITableViewDelegate -

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedIndex = indexPath.row;
    [self.tableView reloadData];
}



#pragma mark - Other -

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
