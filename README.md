# WXSpecificationDemo

----

#规格模式的实践

在iOS[精益编程](http://blog.csdn.net/uxyheaven/article/details/49226175/)这篇文章中介绍了一种有趣的过滤实现模式，该方式解耦了我们的过滤代码，而且还实现了And、Or、Not几种复合操作，DSL让程序阅读性也更好。推荐大家去看看这篇文章，但今天写这篇文章是因为我在设计模式之禅中看到了规格模式，上面作者的方法就这种模式的一种实践，将条件操作封装，使得条件的变化不用增加数据的修改，实现了开闭原则。看到上面这句话，是不是想到了bridge模式。

设计模式之禅的实现代码是java，我今天就用objective－c来实现，实现以下接口以实现简单的复合操作。


```
@protocol IWXSpecification <NSObject>

- (BOOL)isSatisfiedBy:(id)candidate;
- (id<IWXSpecification>)andAction:(id<IWXSpecification>)spec;
- (id<IWXSpecification>)orAction:(id<IWXSpecification>)spec;
- (id<IWXSpecification>)notAction;

@end

```

####使用示例

```
NSArray* origin = [self createUserInfo:10];
    
NSArray* forFilter = [self createUserInfo:3];
    
NSArray* forFilter1 = [self createUserInfo:5];
    
NSArray* forFilter2 = [self createUserInfo:7];
    
NSMutableArray* filter = [ NSMutableArray array];
WXSubFilter* subtract = [WXSubFilter new];
subtract.subData = forFilter;
    
WXSubFilter* subtract1 = [WXSubFilter new];
subtract1.subData = forFilter1;
    
WXSubFilter* subTract2 = [WXSubFilter new];
subTract2.subData = forFilter2;
    
for (YYChannelUserInfo* item in origin) {
        //if ([[subtract orAction:subtract1]  isSatisfiedBy:item]) {
        //if ([[[subtract andAction:subtract1] orAction:subTract2]  isSatisfiedBy:item]) {
        if ([[subtract notAction] isSatisfiedBy:item]) {
        //if ([subtract isSatisfiedBy:item]) {
            [filter addObject:item];
        }
}

```

####one more thing
如精益编程作者所言，iOS提供NSPredicate标准库，这个也是一个非常强大的库，我所做的只是在没有标准库可参考的情况下，我们也可以自己实现高內聚低耦合的代码。
