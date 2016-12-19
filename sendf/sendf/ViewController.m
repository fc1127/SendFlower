//
//  ViewController.m
//  sendf
//
//  Created by 方超 on 16/9/12.
//  Copyright © 2016年 FC. All rights reserved.
//

#import "ViewController.h"
#import "PresentView.h"
#import "GiftModel.h"
#import "AnimOperation.h"
#import "AnimOperationManager.h"
#import "GSPChatMessage.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

// 模拟收到礼物消息的回调
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // IM 消息
    GSPChatMessage *msg = [[GSPChatMessage alloc] init];
    msg.text = @"1个【鲜花】";
    // 模拟 n 个人在送礼物
    int x = 1;
    msg.senderChatID = [NSString stringWithFormat:@"%d",x];
    msg.senderName = msg.senderChatID;
    NSLog(@"id %@ -------送了1个【鲜花】--------",msg.senderChatID);
    
    // 礼物模型
    GiftModel *giftModel = [[GiftModel alloc] init];
    giftModel.headImage = [UIImage imageNamed:@"luffy"];
    giftModel.name = msg.senderName;
    giftModel.giftImage = [UIImage imageNamed:@"flower"];
    giftModel.giftName = msg.text;
    giftModel.giftCount = 1;
    
    
    AnimOperationManager *manager = [AnimOperationManager sharedManager];
    manager.parentView = self.view;
    // 用用户唯一标识 msg.senderChatID 存礼物信息,model 传入礼物模型
    [manager animWithUserID:[NSString stringWithFormat:@"%@",msg.senderChatID] model:giftModel finishedBlock:^(BOOL result) {
        
    }];
}

@end
