import 'package:plain_notification_token_for_us/plain_notification_token_for_us.dart';
import 'package:tencent_flutter_apns/tencent_flutter_apns.dart';
import 'package:tim_ui_kit_push_plugin/channel/flutter_push_base_impl.dart';
import 'package:tim_ui_kit_push_plugin/tim_ui_kit_push_plugin.dart';

class AppleAPNSImpl extends FlutterPushBase{

  /// [Developers should not use this field directly] Initialize APPLE Push Plug-in
  final PushConnector applePushConnector = createPushConnector();

  /// [Developers should not use this field directly] Initialize APPLE Token Plug-in
  final PlainNotificationToken getAppleNotificationToken = PlainNotificationToken();

  /// [Developers should not use this field directly] Initialize APPLE APNS Push
  @override
  Future<void> init(PushClickAction onClickNotificationFunction) async {
    applePushConnector.configure(
      onLaunch: (RemoteMessage message) async {
        onClickNotificationFunction(message.data);
        return;
      },
      onResume: (RemoteMessage message) async {
        onClickNotificationFunction(message.data);
        return;
      },
    );
    return;
  }

  /// [Developers should not use this field directly] Get Appple APNS Token
  @override
  Future<String?> getToken() async {
    getAppleNotificationToken.requestPermission();
    await getAppleNotificationToken.onIosSettingsRegistered.first;
    return await getAppleNotificationToken.getToken();
  }

  /// [Developers should not use this field directly] Require APPLE iOS Push permission
  @override
  void requirePermission() {
    applePushConnector.requestNotificationPermissions();
  }

  /// [Developers should not use this field directly] Determine whether the device supports Apple APNS push
  @override
  Future<bool> isSupport() async {
    return true;
  }
}