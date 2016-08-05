//
//  AIRMapUrlTile.m
//  AirMaps
//
//  Created by Frank Rowe on 8/5/16.
//  Copyright © 2016 Christopher. All rights reserved.
//

#import "AIRMapUrlTile.h"
#import "UIView+React.h"

@implementation AIRMapUrlTile {
  BOOL _urlTemplateSet;
}


- (void)setUrlTemplate:(NSString *)urlTemplate{
  _urlTemplate = urlTemplate;
  _urlTemplateSet = YES;
  [self createTileOverlayAndRendererIfPossible];
  [self update];
}

- (void) createTileOverlayAndRendererIfPossible
{
  if (!_urlTemplateSet) return;
  self.tileOverlay = [[MKTileOverlay alloc] initWithURLTemplate:self.urlTemplate];
  self.tileOverlay.canReplaceMapContent = YES;
  self.renderer = [[MKTileOverlayRenderer alloc] initWithTileOverlay:self.tileOverlay];
}

- (void) update
{
  if (!_renderer) return;
  
  if (_map == nil) return;
  [_map removeOverlay:self];
  [_map addOverlay:self level:MKOverlayLevelAboveLabels];
}

#pragma mark MKOverlay implementation

- (CLLocationCoordinate2D) coordinate
{
  return self.tileOverlay.coordinate;
}

- (MKMapRect) boundingMapRect
{
  return self.tileOverlay.boundingMapRect;
}

- (BOOL)canReplaceMapContent
{
  return self.tileOverlay.canReplaceMapContent;
}

@end