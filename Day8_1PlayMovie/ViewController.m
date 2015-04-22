//
//  ViewController.m
//  Day8_1PlayMovie
//
//  Created by tarena on 15-3-23.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong)MPMoviePlayerController *player;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSURL *url = [NSURL fileURLWithPath:@"/Users/tarena04/Desktop/mtv.mp4"];
    self.player = [[MPMoviePlayerController alloc]initWithContentURL:url];
    
    self.player.view.frame = CGRectMake(0, 0, 320, 200);
    [self.view addSubview:self.player.view];
    
    [self.player setControlStyle:MPMovieControlStyleFullscreen];
    [self.player play];
    
    //监听截屏通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(didReceiveImage:) name:MPMoviePlayerThumbnailImageRequestDidFinishNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(didfinishedAction:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
}
-(void)didfinishedAction:(NSNotification *)noti{
    
    [self.player.view removeFromSuperview];
}
-(void)didReceiveImage:(NSNotification *)noti{
    NSLog(@"%@",noti);
    UIImage *image = [noti.userInfo objectForKey:MPMoviePlayerThumbnailImageKey];
    UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 300, 320, 200)];
        iv.image = image;
    [self.view addSubview:iv];
}

- (IBAction)clicked:(UIButton *)sender {
    
//    UIImage *image = [self.player thumbnailImageAtTime:self.player.currentPlaybackTime timeOption:MPMovieTimeOptionExact];
//    
//    
//    UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 300, 320, 200)];
//    iv.image = image;
//    [self.view addSubview:iv];

    
    
  [self.player requestThumbnailImagesAtTimes:@[@(self.player.currentPlaybackTime)] timeOption:MPMovieTimeOptionExact];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
