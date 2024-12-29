
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:tim_ui_kit_push_plugin/channel/flutter_push_base_impl.dart';
import 'package:tim_ui_kit_push_plugin/tim_ui_kit_push_plugin.dart';

class GoogleFCMImpl extends FlutterPushBase{

  /// [Developers should not use this field directly] Initialize Google Firebase Messaging Plug-in
  final FirebaseMessaging googleFCMMessaging = FirebaseMessaging.instance;

  /// [Developers should not use this field directly] Get Google FCM Token
  @override
  Future<String?> getToken() async {
    print("TUIKitPush | Dart | getGoogleToken");
    return await FirebaseMessaging.instance.getToken();
  }

  /// [Developers should not use this field directly] Initialize Google FCM
  @override
  Future<void> init(PushClickAction onClickNotificationFunction) async {
    onClickNotification = onClickNotificationFunction;
    await setupGoogleInteractedMessage();
    return;
  }

  /// [Developers should not use this field directly] Require push permission via Google
  @override
  void requirePermission() async {
    if(await googleFCMMessaging.isSupported()){
      print("TUIKitPush | Dart | getGooglePermission");
      NotificationSettings settings = await googleFCMMessaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        print('User granted permission');
      } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
        print('User granted provisional permission');
      } else {
        print('User declined or has not accepted permission');
      }
    }
  }

  /// [Developers should not use this field directly] Listen notification message from Google FCM
  Future<void> setupGoogleInteractedMessage() async {
    RemoteMessage? initialMessage =
    await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleGoogleMessage(initialMessage);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(_handleGoogleMessage);
    return;
  }

  /// [Developers should not use this field directly] Deal with click event from notification via Google FCM
  void _handleGoogleMessage(RemoteMessage message) {
    return onClickNotification!(message.data);
  }

  /// [Developers should not use this field directly] Determin whether the device support Google Service and Google FCM
  @override
  Future<bool> isSupport() async {
    try{
      googleFCMMessaging.setAutoInitEnabled(true);
      final res = await googleFCMMessaging.deleteToken();
      return await googleFCMMessaging.isSupported();
    }catch(e){
      print("TUIKitPush | Dart | Do not support Google Firebase, as ${e.toString()}");
      return false;
    }
  }
}