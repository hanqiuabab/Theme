//
//  SecondViewController.m
//  Theme
//
//  Created by 陆久银 on 2018/7/16.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import "SecondViewController.h"
#import "HQThemeManager.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)change:(id)sender {
    [[HQThemeManager manager] changeTheme];

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
