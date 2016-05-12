//
//  WJSendViewController.m
//  ArtisaSay
//
//  Created by Apple on 16/5/10.
//  Copyright © 2016年 YiJiangTianCheng. All rights reserved.
//

#import "WJSendViewController.h"
#import "AppShare.h"
@interface WJSendViewController ()<UITextFieldDelegate,UITextViewDelegate,UIActionSheetDelegate>
@property (nonatomic, strong) NSMutableDictionary *infoDic;
@property (nonatomic, strong) NSMutableArray *mutablePhoto;
@end

@implementation WJSendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor colorWithRed:236/255.0 green:237/255.0 blue:237/255.0 alpha:1];
    _mutablePhoto = [NSMutableArray array];
    _infoDic = [NSMutableDictionary dictionaryWithDictionary:@{@"forumContent":@"",
                                                               @"locationStr":@"",
                                                               @"isAllowLocation":@"0",
                                                               @"picture":@[]
                                                               }];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
}

- (IBAction)dismissBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (IBAction)sendBtn:(id)sender {
    NSString *forumContent = [_infoDic objectForKey:@"forumContent"];
    if (forumContent.length > 0 && forumContent) {
        if(![AppShare checkNewForumContent:[_infoDic objectForKey:@"forumContent"]]){
            return;
        }
        if (_mutablePhoto.count > 0) {
            [self uploadImageBeforCreate];
        }

    }
}
- (void)remindUserAboutNewWithoutImages {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"新建内容中没有添加图片,你是否继续上传?" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:nil style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }]];
}
- (void)uploadImageBeforCreate {
    
//    NSDate *date = [NSDate date];
//    NSDateFormatter *formate = [[NSDateFormatter alloc]init];
//    formate.dateFormat = @"YYYYMMddHHmmssSSS";
//    NSString *filePath2 =[NSString stringWithFormat:@"%@_%@",[AppShare shareInstance].user.account,[formate stringFromDate:date]];
//    [_infoDic setObject:filePath2 forKey:@"picture"];
//    
//    NSString *filePath1 = _type == CreatNewTypeForum ? @"VCP" : @"schoolTaobao";
//    
//    for(NSInteger i = 0 ; i < _selectedPhotos.count ; i ++){
//        [_uploadQueue addObject:[_selectedPhotos objectAtIndex:i]];
//        [self uploadImgae:[_selectedPhotos objectAtIndex:i] filePath1:filePath1 filePath2:filePath2 imgName:nil location:i];
//    }
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
