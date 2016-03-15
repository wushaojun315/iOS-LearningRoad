//
//  ViewController.m
//  iOS-LearningRoad
//
//  Created by 吴少军 on 16/3/3.
//  Copyright © 2016年 George. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *labText;

- (IBAction)selectDateTime:(UIButton *)sender;
- (IBAction)showAlertView:(UIButton *)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"主界面"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    //下面添加其他UI控件
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)selectDateTime:(UIButton *)sender
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"这里是标题" message:@"这里是具体信息！\n\n\n\n\n\n\n\n\n\n" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode = UIDatePickerModeDateAndTime;
//    datePicker.frame = CGRectMake(0, 0, 200, 200);//使用frame调整date选择器的大小
//    CGRect rect = datePicker.frame;               //使用frame调整date选择器的位置（原点）
//    rect.origin = CGPointMake(0, 40);
//    datePicker.frame = rect;

    [alertController.view addSubview:datePicker];
    
    //使用第三方库#import "Masonry.h"     手动添加约束
    [datePicker mas_makeConstraints:^(MASConstraintMaker *make)
    {
        //设置时间选择器居中于alertController
        make.centerX.equalTo(alertController.view.mas_centerX);
        //时间选择器宽度不要超过alertController
        make.width.equalTo(alertController.view).with.offset(-2);//与屏幕大小有关？5s无效，6sP有效，可能5s的最大宽度小于iOS时间选择器的最小宽度
        //时间选择弃顶部距离alertController顶部40距离（用于显示“title”和“message”）
        make.top.equalTo(alertController.view).with.offset(40);
    }];
    
    //点击“确定”按钮后执行，handler代码块
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //获取选中的日期
        NSDate *selectedDate = datePicker.date;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"YYYY-MM-dd HH:mm";//"YYYY-MM-DD HH:mm",用大写D好像显示不实正常的几月几号，未探究
        NSString *strSelectedDate = [dateFormatter stringFromDate:selectedDate];
        _labText.text = strSelectedDate;
    }];
    //取消按钮
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消 " style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        _labText.text = @"点击了－－取消按钮";
    }];
    //破坏性按钮
    UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:@"破坏性按钮" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        _labText.text = @"点击了－－破坏性按钮";
    }];
    
    [alertController addAction:sureAction];
    [alertController addAction:cancelAction];
    [alertController addAction:destructiveAction];
    
    [self presentViewController:alertController animated:YES completion:^{
        self.view.backgroundColor = [UIColor greenColor];
    }];
}

- (IBAction)showAlertView:(UIButton *)sender
{
    UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:@"这是Alert视图" message:@"这里是Alert的Message!这里是Alert的Message!这里是Alert的Message!这里是Alert的Message!这里是Alert的Message!" preferredStyle:UIAlertControllerStyleAlert];
    
    //添加用户名，密码的输入框
    [alertViewController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        //内部可以为textField设置各种属性
        textField.backgroundColor = [UIColor redColor];
        textField.placeholder = @"请输入用户名";
        /**
         如果我们想要实现UIAlertView中的委托方法alertViewShouldEnableOtherButton:方法的话可能会有一些复杂。假定我们
         要让“用户名”文本框中至少有3个字符才能激活“登录”按钮。很遗憾的是，在UIAlertController中并没有相应的委托方法，
         因此我们需要向“登录”文本框中添加一个Observer。
         
         Observer模式定义对象间的一对多的依赖关系,当一个对象的状态发生改变时,所有依赖于它的对象都得到通知并被自动更新。我们可以在构造代码块中添加如下的代码片段来实现。
         */
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didEnterUserName:) name:UITextFieldTextDidChangeNotification object:textField];

    }];
    [alertViewController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.backgroundColor = [UIColor greenColor];
        textField.placeholder = @"请输入密码";
        textField.secureTextEntry = YES;
        textField.keyboardType = UIKeyboardTypeNumberPad;
    }];
    
    //当视图控制器释放的时候我们需要移除这个Observer，我们通过在每个按钮动作的handler代码块（还有其他任何可能释放视图控制器的地方）中添加合适的代码来实现它。比如说在按钮动作中移除observer
    
    //点击“登录”按钮后执行，handler代码块
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //在“登录”按钮按下时，我们让程序读取文本框中的值。
        NSString *userName = alertViewController.textFields[0].text;
        NSString *passWord = alertViewController.textFields[1].text;
        _labText.text = [NSString stringWithFormat:@"欢迎您，%@！您的密码为：%@",userName,passWord];
        //移除observer
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    }];
    //取消按钮
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消 " style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        _labText.text = @"点击了－－取消按钮, 登录失败!";
        //移除observer
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
    }];
    
    [alertViewController addAction:cancelAction];
    [alertViewController addAction:sureAction];
    
    //在显示对话框之前，我们要冻结“登录”按钮
    sureAction.enabled = NO;
    [self presentViewController:alertViewController animated:YES completion:^{
        self.view.backgroundColor = [UIColor blueColor];
    }];
}

//接下来，在通知观察者（notification observer）中，我们需要在激活按钮状态前检查“用户名”文本框的内容。
- (void)didEnterUserName:(NSNotification *)notification
{
    UIAlertController *alertController = (UIAlertController *)self.presentedViewController;
    if (alertController) {
        UITextField *login = alertController.textFields.firstObject;
        UIAlertAction *sureAction = alertController.actions.lastObject;
        sureAction.enabled = login.text.length > 2;
    }
}

@end
