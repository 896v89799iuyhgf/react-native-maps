//
//  AIRMapUrlTileManager.m
//  AirMaps
//
//  Created by Frank Rowe on 8/5/16.
//  Copyright © 2016 Christopher. All rights reserved.
//


#import "RCTConvert.h"
#import "RCTConvert+CoreLocation.h"
#import "RCTEventDispatcher.h"
#import "UIView+React.h"
#import "AIRMapMarker.h"
#import "RCTViewManager.h"
#import "AIRMapUrlTile.h"

#import "AIRMapUrlTileManager.h"

@interface AIRMapUrlTileManager()

@end

@implementation AIRMapUrlTileManager


RCT_EXPORT_MODULE()

- (UIView *)view
{
  AIRMapUrlTile *tile = [AIRMapUrlTile new];
  return tile;
}

RCT_EXPORT_VIEW_PROPERTY(urlTemplate, NSString)

@end