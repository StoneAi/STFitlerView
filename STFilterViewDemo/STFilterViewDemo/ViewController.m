//
//  ViewController.m
//  STFilterViewDemo
//
//  Created by 石函东 on 2017/11/16.
//  Copyright © 2017年 石函东. All rights reserved.
//

#import "ViewController.h"
#import "STFitlerView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *noImageBtn;
@property (weak, nonatomic) IBOutlet UIButton *imageBtn;

@end

@implementation ViewController
{
    NSInteger selectIndex;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.noImageBtn addTarget:self action:@selector(noimageClick) forControlEvents:UIControlEventTouchUpInside];
    [self.imageBtn addTarget:self action:@selector(imageClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)noimageClick
{
    __weak typeof(self) weakself = self;
    STFitlerView * fitlerview = [[STFitlerView alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(self.noImageBtn.frame)+10, self.view.frame.size.width-100, 150) WithTitleArray:@[@"你好",@"我好",@"他好"] WithImageArray:nil WithSelectImageArray:nil WithIndex:selectIndex WithBackColor:nil WithBlock:^(NSInteger index,NSString * text) {
        selectIndex = index;
        [weakself.noImageBtn setTitle:text forState:0];
    }];
    [self.view addSubview:fitlerview];
}
-(void)imageClick
{
    __weak typeof(self) weakself = self;
    STFitlerView * fitlerview = [[STFitlerView alloc] initWithFrame:CGRectMake(50, CGRectGetMaxY(self.imageBtn.frame)+10, self.view.frame.size.width-100, 150) WithTitleArray:@[@"你好",@"我好",@"他好"] WithImageArray:@[@"不限",@"不限",@"不限"] WithSelectImageArray:nil WithIndex:selectIndex WithBackColor:nil WithBlock:^(NSInteger index,NSString * text) {
        selectIndex = index;
        [weakself.imageBtn setTitle:text forState:0];
    }];
    [self.view addSubview:fitlerview];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
