//
//  QYViewController.m
//  PlaySystemsoundsDemo
//
//  Created by qingyun on 14-7-11.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface QYViewController ()
@property (weak, nonatomic) IBOutlet UISlider *progressSlider;
@property (weak, nonatomic) IBOutlet UISlider *volumeSlider;

@property (weak, nonatomic) IBOutlet UILabel *labelStartProgress;
@property (weak, nonatomic) IBOutlet UILabel *labelEndProgress;
@property (weak, nonatomic) IBOutlet UIButton *btnPlay;

@property (nonatomic, retain) AVAudioPlayer *audioPlay;
@property (weak, nonatomic) IBOutlet UILabel *minVolumeLabel;
@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"信仰" withExtension:@"mp3"];
    NSError *error = nil;
    self.audioPlay = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&error];
    if (error != nil) {
        NSLog(@"%@", error);
    }
    
    [self.audioPlay prepareToPlay];
    
    self.progressSlider.minimumValue = 0;
    self.progressSlider.maximumValue = self.audioPlay.duration;
    self.volumeSlider.minimumValue = 0;
    self.volumeSlider.maximumValue = 100;
    self.volumeSlider.value = 0;
    self.audioPlay.volume = self.volumeSlider.value/100;
    
    _minVolumeLabel.text = [NSString stringWithFormat:@"%d", (int)self.volumeSlider.value];
}
- (IBAction)onProgressSlider:(UISlider *)sender {
    
    self.audioPlay.currentTime = sender.value;
}
- (IBAction)playMusic:(UIButton *)sender {
    
    if ([self.audioPlay isPlaying]) {
        [sender setTitle:@"播放" forState:UIControlStateNormal];
        [self.audioPlay pause];
    } else {
        
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateProgressSlider:) userInfo:nil repeats:YES];
        [sender setTitle:@"暂停" forState:UIControlStateNormal];
        [self.audioPlay play];
    }
}
- (IBAction)stopMusic:(UIButton *)sender {
    
    [self.audioPlay stop];
    self.audioPlay.currentTime = 0;
    [self.btnPlay setTitle:@"播放" forState:UIControlStateNormal];
}

- (void)updateProgressSlider:(NSTimer *)timer
{
    NSString *startLaberText = [NSString stringWithFormat:@"%.2d:%.2d", (int)_progressSlider.value/60, (int)_progressSlider.value % 60];
    int totalTime = (int)_audioPlay.duration - (int)_audioPlay.currentTime;
    NSMutableString *endLabelText = [NSMutableString stringWithFormat:@"%.2d", totalTime/60];
    [endLabelText appendFormat:@":%.2d", totalTime%60];
   _labelStartProgress.text = startLaberText;
    _labelEndProgress.text = endLabelText;
    
    _progressSlider.value = _audioPlay.currentTime;
}
- (IBAction)onVolumeSlider:(UISlider *)sender {
    
    self.audioPlay.volume = sender.value/100;
    NSString *minvolumeLabelText = [NSString stringWithFormat:@"%d", (int)sender.value];
    _minVolumeLabel.text = minvolumeLabelText;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
