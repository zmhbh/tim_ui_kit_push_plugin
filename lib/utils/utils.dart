import 'package:flutter/services.dart';
import 'package:tencent_cloud_chat_sdk/enum/message_elem_type.dart';
import 'package:tencent_cloud_chat_sdk/models/v2_tim_message.dart';
import 'package:tim_ui_kit_push_plugin/model/appInfo.dart';

class Utils{
  /// Set appinfo for each channel manualy
  static Future<void> setAppInfoForChannel(MethodChannel _channel, PushAppInfo appInfo) async {
    if(await _channel.invokeMethod("isOppoRom") && appInfo.oppo_app_key != null && appInfo.oppo_app_secret != null){
      await _channel.invokeMethod("setOppoPushAppId", {
        "appId": appInfo.oppo_app_key!,
      });
      await _channel.invokeMethod("setOppoPushAppKey", {
        "appKey": appInfo.oppo_app_secret!,
      });
      return;
    }else if(await _channel.invokeMethod("isMiuiRom") && appInfo.mi_app_id != null && appInfo.mi_app_key != null){
      print("TUIKitPush | init | setMiPushAppId");
      await _channel.invokeMethod("setMiPushAppId", {
        "appId": appInfo.mi_app_id!,
      });
      print("TUIKitPush | init | setMiPushAppKey");
      await _channel.invokeMethod("setMiPushAppKey", {
        "appKey": appInfo.mi_app_key!,
      });
      return;
    }else if(await _channel.invokeMethod("isMeizuRom") && appInfo.mz_app_id != null && appInfo.mz_app_key != null){
      await _channel.invokeMethod("setMzPushAppId", {
        "appId": appInfo.mz_app_id!,
      });
      await _channel.invokeMethod("setMzPushAppKey", {
        "appKey": appInfo.mz_app_key!,
      });
      return;
    }
  }

  static String createExtForMessage(V2TimMessage message){
    String createJSON(String convID) {
      return "{\"conversationID\": \"$convID\"}";
    }

    String ext = ((message.groupID != null && message.groupID != "")
        ? createJSON("group_${message.groupID}")
        : createJSON("c2c_${message.sender}"));

    return ext;
  }
}