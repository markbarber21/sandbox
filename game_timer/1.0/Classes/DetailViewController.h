//
//  DetailViewController.h
//  GameTimer
//
//  Created by Mark Barber on 4/28/10.
//  Copyright Mark Barber  2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfigViewController.h"

@interface DetailViewController : ConfigViewController {
    UILabel *detailDescriptionLabel;
}

@property (nonatomic, retain) IBOutlet UILabel *detailDescriptionLabel;

@end
