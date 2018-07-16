//
//  ViewController.m
//  Theme
//
//  Created by 陆久银 on 2018/7/13.
//  Copyright © 2018年 lujiuyin. All rights reserved.
//

#import "ViewController.h"
#import "HQThemeManager.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.btn.theme_backgroundColor = @"text_h1";
    self.btn.theme_tintColor = @"titleColor";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)change:(id)sender {
    [[HQThemeManager manager] changeTheme];
}

@end
