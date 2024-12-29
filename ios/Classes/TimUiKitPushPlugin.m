//
// TimUiKitPushPlugin.m
// tim_ui_kit_push_plugin
//
// Created by owennwang on 2022/05/10
// Copyright (c) 2022 Tencent. All rights reserved.
//
#import "TimUiKitPushPlugin.h"
#if __has_include(<tim_ui_kit_push_plugin/tim_ui_kit_push_plugin-Swift.h>)
#import <tim_ui_kit_push_plugin/tim_ui_kit_push_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "tim_ui_kit_push_plugin-Swift.h"
#endif

@implementation TimUiKitPushPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTimUiKitPushPlugin registerWithRegistrar:registrar];
}
@end
