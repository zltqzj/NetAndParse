//
//  ViewController.m
//  NetAndParse
//
//  Created by ZKR on 9/15/13.
//  Copyright (c) 2013 ZKR. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize recieveData = _recieveData;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL* url = [NSURL URLWithString:@"http://api.hudong.com/iphonexml.do?type=focus-c"];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
    
    
    // Do any additional setup after loading the view from its nib.
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _recieveData = [[NSMutableData alloc] init];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.recieveData  appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString* str = [[NSString alloc] initWithData:self.recieveData encoding:NSUTF8StringEncoding];
    
    _recieveData = nil;
    

    GDataXMLDocument* doc = [[GDataXMLDocument alloc] initWithXMLString:str options:0 error:nil];
    GDataXMLElement* root = [doc rootElement];
    
 
    NSArray* array =[root nodesForXPath:@"//response/docList/docInfo" error:nil];
    for (int i =0; i<array.count; i++) {
         NSLog(@"每项内容的题目：%@",[[[[array objectAtIndex:i] elementsForName:@"docTitle"] objectAtIndex:0] stringValue] );
    }
    
    
   
    
    
    _recieveData = nil;
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
