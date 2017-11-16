# STFitlerView <br />
简单的筛选栏 <br />
/** <br />
 展示一个不可scroller的简易的筛选栏,通过frame的height和titleArray的count计算cell的高度 <br />
 @param frame <#frame description#> <br />
 @param titleArray cell的文案 <br />
 @param imageArray 未选中的图片数组 <br />
 @param selectImageArray 选中的图片数组 <br />
 @param index 选中的下标  从0 开始 <br />
 @param color 可以为nil <br />
 @param block <#block description#> <br />
 @return <#return value description#> <br />
 */ <br />
-(instancetype)initWithFrame:(CGRect)frame WithTitleArray:(NSArray *)titleArray WithImageArray:(NSArray *)imageArray WithSelectImageArray:(NSArray *)selectImageArray WithIndex:(NSInteger)index WithBackColor:(UIColor* )color WithBlock:(SelectBlock)block;
