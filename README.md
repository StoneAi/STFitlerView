# STFitlerView
简单的筛选栏
/**
 展示一个不可scroller的简易的筛选栏,通过frame的height和titleArray的count计算cell的高度

 @param frame <#frame description#>
 @param titleArray cell的文案
 @param imageArray 未选中的图片数组
 @param selectImageArray 选中的图片数组
 @param index 选中的下标  从0 开始
 @param color 可以为nil
 @param block <#block description#>
 @return <#return value description#>
 */
-(instancetype)initWithFrame:(CGRect)frame WithTitleArray:(NSArray *)titleArray WithImageArray:(NSArray *)imageArray WithSelectImageArray:(NSArray *)selectImageArray WithIndex:(NSInteger)index WithBackColor:(UIColor* )color WithBlock:(SelectBlock)block;
