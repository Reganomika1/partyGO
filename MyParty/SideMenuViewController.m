//
//  SideMenuViewController.m
//  MyParty
//
//  Created by Zakhar on 7/17/17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "SideMenuViewController.h"
#import "SideBarTableViewCell.h"

@interface SideMenuViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userPhoneNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *userSexLabel;

@property (strong, nonatomic) NSArray *names;
@property (strong, nonatomic) NSArray *identifiers;
@property (strong, nonatomic) NSArray *images;

@end

@implementation SideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.names = @[@"Профиль", @"Создать тусу", @"Найти тусу", @"Настройки", @"Вход"];
    self.identifiers = @[@"Profile", @"MakeParty", @"SearchParty", @"Settings", @"Authorization"];
    
    self.userImageView.layer.cornerRadius = self.userImageView.frame.size.width/2;
    self.userImageView.clipsToBounds = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



#pragma mark - UITableViewDatasource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.names count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SideBarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[self.identifiers objectAtIndex:indexPath.row] forIndexPath:indexPath];
    cell.cellTextLabel.text = [self.names objectAtIndex:indexPath.row];
    
    return cell;
}


@end
