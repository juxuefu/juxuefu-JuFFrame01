
CocoaPods发布框架步骤:
[1](注册)：(需要Xcode的正式版,不能用beta版)
a)   在终端输入:  pod trunk register  juxtfu@sina.com "Juxtfu"
b)   进入juxtfu@sina.com-->查看邮件-->得到连接: https://trunk.cocoapods.org/sessions/verify/5904b1f6
c)   在浏览器中输入连接地址：https://trunk.cocoapods.org/sessions/verify/5904b1f6 -->
d)   看到CocoaPods的页面，说明注册完成了
[2](检查是否注册成功)，在终端输入：pod trunk me    -->得到如下信息
- Name:     Juxtfu
- Email:    juxtfu@sina.com
- Since:    December 23rd, 19:53
- Pods:     None
- Sessions:
- December 23rd, 19:53 - April 30th, 2019 20:03. IP: 183.206.6.151
[3](进入github) 创建项目
a)  点击`+`-->`New repository`-->`Repository Name=JuFFrame01`
b)  在终端搜索是否有同名的框架，输入：pod search JuFFrame  -->
[!] Unable to find a pod with name, author, summary, or description matching `JuFFrame01`
说明没人使用过。
c) 继续 a) 创建新项目--> 选中`Poblic`-->在`Add.gitignore`添加`Objective-C`-->
    在`Add a license`添加`MIT License`-->
    选中`Initialize this repository with a README`-->
    点击`Create repository`(创建)
d) 继续 c) --> 点击`clone or download` -->得到代码仓库地址：
    https://github.com/juxuefu/juxuefu-JuFFrame01.git
[4](进入SourceTree)
a) 点击`新仓库`-->`从URL克隆`-->
    在`源url`中输入:`https://github.com/juxuefu/juxuefu-JuFFrame01.git`-->
    在目标路径输入: /Users/xuefuju/01_SWIFT/JuFFrame (注:预先要创建目录)-->
    点击`克隆`按钮-->生成名为`JuFFrame01`的本地代码仓库
b) 我们要发布框架就放在`/Users/xuefuju/01_SWIFT/JuFFrame01`目录下
[5](在正式版Xcode创建一个OC项目MyProject)
a) 创建一个Xcode的OC项目保存在/Users/xuefuju/01_SWIFT/JuFFrame01目录下
b) 在黄色的`MyProject`目录下建子目录`MyProject`
c) 进入`SourceTree`-->在说明栏输入`初始化项目`-->提交到`github`-->
   (如果需要可以输入开机密码-->点击`始终允许`)
[6](正式开始写项目)
0）在`MyProject/MyProject/`创建一个子目录`MyFrame`
1）在`MyProject/MyProject/MyFrame`创建一个继承自`NSObject`的`FFPerson`
a)在`FFPerson.h`中增加:
`@interface FFPerson : NSObject
@property(nonatomic,copy) NSString *name;
-(void)eat;
@end`
b)   在`FFPerson.m`中增加:
`@implementation FFPerson
-(void)eat{
    NSLog(@"%@ 正在吃...",_name);
}
@end`
2）在`MyProject/MyProject/ViewController.m`
a)  在类外增加:`#import "FFPerson.h"`
b)  在`viewDidLoad`方法中增加:
`- (void)viewDidLoad {
    [super viewDidLoad];
   FFPerson *p = [FFPerson new];
   p.name = @"小芳";
 [p eat];
}`
[7](进入SourceTree)
1）在说明栏输入：`框架开发完成`-->提交
[8](回到github主页)
1）在浏览器地址栏刷新`JuFFrame`-->点击项目名称-->浏览器地址中就是项目地址:
`https://github.com/juxuefu/juxuefu-JuFFrame01`
[9](进入终端)
1）进入本机项目目录: cd  /Users/xuefuju/01_SWIFT/JuFFrame01/MyProject
2）输入: pod spec create https://github.com/juxuefu/juxuefu-JuFFrame01 -->
3）项目目录下多了一个`JuFFrame01.podspec`文件-->打开-->
     参照`JuFFDemo.podspec.png`编辑，完成如下:
     `Pod::Spec.new do |s|
     s.name         = "JuFFDemo"
     s.version      = "0.0.1"
     s.summary      = ""
     s.homepage     = "https://github.com/juxuefu/JuFFDemo"
     s.license      = "MIT"
     s.author             = { "juxuefu" => "juxtfu@sina.com" }
     s.platform     = :ios, "8.0"
     s.source       = { :git => "https://github.com/juxuefu/JuFFDemo.git", :tag => s.version }
     s.source_files  = "JuFFDemo", "MyProject/MyProject/MyProject/*.{h,m}"
     s.requires_arc = true
     end`
[10](进入SourceTree)
1）点击左栏`master`-->点击上栏`标签`-->显示对话框: 标签名称=0.01,选中`工作副本父节点`->
      选中`推送标签=origin`--> 点击`添加`按钮
2）如果我们要升级JuFFDemo框架,可以更改`JuFFDemo.podspec`文件中的
     s.version      = "0.0.1"   =>   s.version      = "0.0.2"
3）在按1）方法进行,建立 `0.02`标签
4）继续编辑`JuFFDemo.podspec`文件，
     s.source_files  = "Classes", "Classes/**/*.{h,m}"    更改成 ==>
     s.source_files  = "JuFFDemo", "MyProject/MyProject/MyProject/*.{h,m}"  
    (注意是在Xcode项目保存的`/Users/xuefuju/01_SWIFT/JuFFDemo`目录下的
    `MyProject/MyProject/MyProject/*.{h,m}`）所有.h .m文件   
 [11](验证.spec文件)    
 1）在终端-->cd  /Users/xuefuju/01_SWIFT/JuFFDemo/MyProject  -->
       输入：pod spec lint

       
     
