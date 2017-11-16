//
//  STChoiceView.m
//  Broker-Swift
//
//  Created by 石函东 on 2017/8/24.
//  Copyright © 2017年 万圣. All rights reserved.
//

#import "STFitlerView.h"
@interface STFitlerView()<UITableViewDelegate,UITableViewDataSource>
@end


@implementation STFitlerView
{
    NSArray * _titleArray;
    NSArray * _imageArray;
    NSArray * _selectImageArray;
    NSInteger _index;
    UIColor * _color;
    SelectBlock _block;
    
}
-(instancetype)initWithFrame:(CGRect)frame WithTitleArray:(NSArray *)titleArray WithImageArray:(NSArray *)imageArray WithSelectImageArray:(NSArray *)selectImageArray WithIndex:(NSInteger)index WithBackColor:(UIColor* )color WithBlock:(SelectBlock)block
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        self.tableview = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
        self.tableview.delegate = self;
        self.tableview.dataSource = self;
        self.tableview.scrollEnabled = NO;
        
        self.tableview.separatorInset = UIEdgeInsetsZero;
        self.tableview.layer.cornerRadius = 3;
        self.tableview.layer.masksToBounds = YES;
        
        _titleArray = titleArray;
        _imageArray = imageArray;
        _selectImageArray = selectImageArray;
        _index = index;
        _color = color;
        _block = block;
        if (color!=nil) {
            self.tableview.backgroundColor = color;
        }
        else
            self.tableview.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.tableview];
    }
    
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self menuHide];
    
}
- (void)menuHide{
    
    [UIView animateWithDuration:.2f animations:^{
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        self.tableview.transform = CGAffineTransformMakeScale(0.001, 0.001);
        self.tableview.alpha = 0.0f;
        
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
}

- (void)willMoveToSuperview:(nullable UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
    
    if (newSuperview) {
        if (_color==nil) {
            self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        }
    
        
        self.tableview.alpha = 0.0f;
        self.tableview.transform = CGAffineTransformMakeScale(0.001, 0.001);
        
        [UIView animateWithDuration:.2f animations:^{
            if (_color == nil) {
                self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.3f];
            }
            else
                self.backgroundColor = [UIColor clearColor];
            self.tableview.transform = CGAffineTransformMakeScale(1, 1);
            self.tableview.alpha = 1.0f;
        }];
    }
}

#pragma mark delegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    _block(indexPath.row,cell.textLabel.text);
    [self menuHide];
}

#pragma mark datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return self.tableview.frame.size.height/_titleArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    if (_index == indexPath.row) {
        cell.textLabel.textColor =  [UIColor colorWithRed:37/255.0 green:180/255.0 blue:165/255.0 alpha:1/1.0];
    }
    else
        cell.textLabel.textColor =  [UIColor colorWithRed:35/255.0 green:44/255.0 blue:55/255.0 alpha:1/1.0];
    if (_imageArray.count) {
        if (_index == indexPath.row&&_selectImageArray.count) {
            cell.imageView.image = [UIImage imageNamed:_selectImageArray[indexPath.row]];
        }
        else
            cell.imageView.image = [UIImage imageNamed:_imageArray[indexPath.row]];
    }
    cell.textLabel.text = _titleArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_color !=nil)
        cell.backgroundColor  = _color;
//        cell.backgroundColor = [UIColor redColor];
}



@end
