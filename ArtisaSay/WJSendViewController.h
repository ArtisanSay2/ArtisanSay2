//
//  WJSendViewController.h
//  ArtisaSay
//
//  Created by Apple on 16/5/10.
//  Copyright © 2016年 YiJiangTianCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WJSendViewController : UIViewController
- (IBAction)dismissBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *textView;
- (IBAction)sendBtn:(id)sender;

@end
