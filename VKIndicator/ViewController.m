//
//  ViewController.m
//  VKIndicator
//
//  Created by Vinay Nation on 02/12/15.
//  Copyright © 2015 Vinay Nation. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self animation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)animation{
    CAReplicatorLayer *clyaer =  [CAReplicatorLayer new];
    clyaer.bounds = CGRectMake(0, 0, 200, 200);
    clyaer.cornerRadius = 10.0;
    clyaer.backgroundColor = [UIColor grayColor].CGColor;
    clyaer.position = self.view.center;
    [self.view.layer addSublayer:clyaer];
    
    
    
    CALayer *dot =[CALayer new] ;
    dot.bounds = CGRectMake(0, 8,14-7, 14+8);
    dot.position = CGPointMake(100, 40);
    dot.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1].CGColor;
    dot.borderColor = [UIColor colorWithWhite:1.0 alpha:1.0].CGColor;
    dot.borderWidth = 1.0;
    dot.cornerRadius = 2.0;
    [clyaer addSublayer:dot];
    
    
    
    int nrDots = 15;
    clyaer.instanceCount = nrDots;
    
    CGFloat angle = (CGFloat)2*M_PI / (CGFloat)nrDots;
    clyaer.instanceTransform = CATransform3DMakeRotation(angle, 0.0, 0.0, 1.0);
    
    
    
    
    CFTimeInterval duration = 1.5;
    CABasicAnimation *shrink = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    shrink.fromValue = @1.0;
    shrink.toValue =  @0.1;
    shrink.duration = duration;
    shrink.repeatCount = INFINITY;
    
    [dot addAnimation:shrink forKey:@"basic"];
    
    clyaer.instanceDelay =  duration/(double)nrDots;
    dot.transform = CATransform3DMakeScale(0.01, 0.01, 0.01);
}


@end
