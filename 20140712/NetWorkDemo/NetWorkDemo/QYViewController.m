//
//  QYViewController.m
//  NetWorkDemo
//
//  Created by qingyun on 14-7-12.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"

@interface QYViewController () <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

@property (nonatomic, retain) NSMutableData *reciveData;

@end

@implementation QYViewController

- (void)write2FilesDocument
{
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response = nil;
    
    NSError *error = nil;
    
    NSData *reciveData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error != nil) {
        NSLog(@"%@,%@",error,response);
    } else {
        NSLog(@"%@", response);
    }
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *doucumentPath = paths[0];
    NSLog(@"%@", doucumentPath);
    
    NSString *filePathName = [NSString stringWithFormat:@"%@/baidu.html",doucumentPath];
    NSLog(@"%@", filePathName);
    
    NSString *reciveString = [[NSString alloc] initWithData:reciveData encoding:NSUTF8StringEncoding];
    
    [reciveString writeToFile:filePathName atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

- (void)write2DataFile:(NSData *)reciveData
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *doucumentPath = paths[0];
    NSLog(@"%@",doucumentPath);
    
    NSString *musicName = [NSString stringWithFormat:@"%@/xiaopingguo.mp3",doucumentPath];
    [reciveData writeToFile:musicName atomically:YES];

}

- (void)getDataFromNetWorkWithSyn
{
    NSString *strUrl = @"http://music.baidu.com/data/music/file?link=http://yinyueshiting.baidu.com/data2/music/121368038/12012502946800128.mp3?xcode=07163ceaff16b889147409900041a1574d1ead83690db72f&song_id=120125029";
    NSURL *url = [NSURL URLWithString:strUrl];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    
    NSData *reciveData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error != nil) {
        NSLog(@"%@", error);
    } else {
        NSLog(@"%@", response);
    }
    
    [self write2DataFile:reciveData];
}

- (void)getDataFromNetWorkWithAsyn
{
    NSString *strUrl = @"http://music.baidu.com/data/music/file?link=http://yinyueshiting.baidu.com/data2/music/121368038/12012502946800128.mp3?xcode=07163ceaff16b889147409900041a1574d1ead83690db72f&song_id=120125029";
    NSURL *url = [NSURL URLWithString:strUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
//	[self write2FilesDocument];
//    [self getDataFromNetWorkWithSyn];
    [self getDataFromNetWorkWithAsyn];
}

#pragma mark - NSURLConnectionDelegate

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"%@", error);
}

#pragma mark - NSURLConnectDataDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    self.reciveData = [[NSMutableData alloc] initWithCapacity:4000];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.reciveData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    [self write2DataFile:self.reciveData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
