#import "DesiredriveApiFlutterPlugin.h"
#import <desiredrive_api_flutter/desiredrive_api_flutter-Swift.h>

@implementation DesiredriveApiFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDesiredriveApiFlutterPlugin registerWithRegistrar:registrar];
}
@end
