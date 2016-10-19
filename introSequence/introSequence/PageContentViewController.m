//
//  PageContentViewController.m
//  introSequence
//
//  Created by Jason Owen on 10/17/16.
//  Copyright © 2016 Jason Owen. All rights reserved.
//

#import "PageContentViewController.h"

@interface PageContentViewController ()

@end

@implementation PageContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.introImage = [UIImage imageNamed:self.imageFile];
    self.welcomeLabel.text = self.welcomeText;
    self.headerLabel.text = self.headerText;
    self.bodyLabel.text = self.bodyText;
    self.footerLabel.text = self.footerText;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
