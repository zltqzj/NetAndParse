//
//  ViewController.h
//  NetAndParse
//
//  Created by ZKR on 9/15/13.
//  Copyright (c) 2013 ZKR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDataXMLNode.h"
@interface ViewController : UIViewController<NSURLConnectionDataDelegate>

@property(nonatomic,retain)NSMutableData * recieveData;//接受异步连接数据

@end
