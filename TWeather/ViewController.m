//
//  ViewController.m
//  TWeather
//
//  Created by Nguyen Hieu Trung on 6/28/17.
//  Copyright © 2017 Nguyen Hieu Trung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *temperater;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation ViewController{
    NSArray *temp;
    NSArray *arrImage;
    Boolean isC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    isC = YES;
    temp = [NSArray arrayWithObjects:@"25",@"26",@"27",@"28",nil];
    arrImage = [NSArray arrayWithObjects:@"Sunny",@"Rainny",@"Cloudy",@"Thunder", nil];
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)ButtonPress:(id)sender {
    [self.temperater setTitle:[[NSNumber numberWithFloat:[self convertToF]] stringValue] forState:UIControlStateNormal];
}

- (IBAction)ButtonChange:(id)sender {
    int r = arc4random_uniform((int)(temp.count-1));
    
    [self.temperater setTitle:[[NSNumber numberWithFloat:[self getTemperater]] stringValue] forState:UIControlStateNormal];
    self.image.image = [UIImage imageNamed:[arrImage objectAtIndex:r]];
}

- (float)getTemperater{
    return (float)(14+arc4random_uniform(18));
}
- (float)convertToF{
    float t = 0;
    if(isC == YES){
        t = [self.temperater.titleLabel.text floatValue]*1.8 + 32;
        isC = NO;
    }else{
        t =([self.temperater.titleLabel.text floatValue]-32)/1.8;
        isC = YES;
    }
    return t;
}
@end
