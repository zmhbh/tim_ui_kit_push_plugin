//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<firebase_core/FLTFirebaseCorePlugin.h>)
#import <firebase_core/FLTFirebaseCorePlugin.h>
#else
@import firebase_core;
#endif

#if __has_include(<firebase_messaging/FLTFirebaseMessagingPlugin.h>)
#import <firebase_messaging/FLTFirebaseMessagingPlugin.h>
#else
@import firebase_messaging;
#endif

#if __has_include(<flutter_apns_only/FlutterApnsPlugin.h>)
#import <flutter_apns_only/FlutterApnsPlugin.h>
#else
@import flutter_apns_only;
#endif

#if __has_include(<path_provider_foundation/PathProviderPlugin.h>)
#import <path_provider_foundation/PathProviderPlugin.h>
#else
@import path_provider_foundation;
#endif

#if __has_include(<plain_notification_token_for_us/PlainNotificationTokenPlugin.h>)
#import <plain_notification_token_for_us/PlainNotificationTokenPlugin.h>
#else
@import plain_notification_token_for_us;
#endif

#if __has_include(<tencent_cloud_chat_sdk/TencentCloudChatSdkPlugin.h>)
#import <tencent_cloud_chat_sdk/TencentCloudChatSdkPlugin.h>
#else
@import tencent_cloud_chat_sdk;
#endif

#if __has_include(<tim_ui_kit_push_plugin/TimUiKitPushPlugin.h>)
#import <tim_ui_kit_push_plugin/TimUiKitPushPlugin.h>
#else
@import tim_ui_kit_push_plugin;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTFirebaseCorePlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseCorePlugin"]];
  [FLTFirebaseMessagingPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseMessagingPlugin"]];
  [FlutterApnsPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterApnsPlugin"]];
  [PathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"PathProviderPlugin"]];
  [PlainNotificationTokenPlugin registerWithRegistrar:[registry registrarForPlugin:@"PlainNotificationTokenPlugin"]];
  [TencentCloudChatSdkPlugin registerWithRegistrar:[registry registrarForPlugin:@"TencentCloudChatSdkPlugin"]];
  [TimUiKitPushPlugin registerWithRegistrar:[registry registrarForPlugin:@"TimUiKitPushPlugin"]];
}

@end
