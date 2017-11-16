//
//  STChoiceView.h
//  Broker-Swift
//
//  Created by 石函东 on 2017/8/24.
//  Copyright © 2017年 万圣. All rights reserved.
//

#import <UIKit/UIKit.h>
@class STFitlerView;
typedef void (^SelectBlock)(NSInteger index,NSString * title);

@interface STFitlerView : UIView
@property (strong,nonatomic) UITableView * tableview;


-(instancetype)initWithFrame:(CGRect)frame WithTitleArray:(NSArray *)titleArray WithImageArray:(NSArray *)imageArray WithSelectImageArray:(NSArray *)selectImageArray WithIndex:(NSInteger)index WithBackColor:(UIColor* )color WithBlock:(SelectBlock)block;
@end
