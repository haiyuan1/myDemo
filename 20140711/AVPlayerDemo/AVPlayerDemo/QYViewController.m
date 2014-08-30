//
//  QYViewController.m
//  AVPlayerDemo
//
//  Created by qingyun on 14-7-11.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface QYViewController ()

@property (nonatomic, retain) AVPlayer *musicPlayer;

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    NSError *error = nil;
    [audioSession setCategory:AVAudioSessionCategoryPlayback error:&error];
    if (error != nil) {
        NSLog(@"ERROR:%@", error);
    }
    [audioSession setActive:YES error:nil];
    
    //播放本地歌曲
    NSURL *musicURL = [[NSBundle mainBundle] URLForResource:@"小苹果" withExtension:@"mp3"];
    self.musicPlayer = [[AVPlayer alloc] initWithURL:musicURL];
    [self.musicPlayer play];
    
    
#if 0
    //播放网络歌曲
    NSURL *musicURL = [NSURL URLWithString:@"http://music.baidu.com/data/music/file?link=http://yinyueshiting.baidu.com/data2/music/120001125/113333032230400128.mp3?xcode=1d70a0b1de7a949283dcca194910e68085948bce3caa271f&song_id=113333032"];
    self.musicPlayer = [[AVPlayer alloc] initWithURL:musicURL];
    [self.musicPlayer play];
#endif
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
