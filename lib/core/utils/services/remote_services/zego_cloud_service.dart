// zego_services.dart

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kolayca/features/profile/data/models/user_model.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class ZegoServices {
  ZegoServices();
  static final service = ZegoUIKitPrebuiltCallInvitationService();
  static final plugin = ZegoUIKitSignalingPlugin();
  static Future<void> initZego(String userId, String userName) async {
    service.init(
      appID: int.tryParse(dotenv.get('ZegoAppID')) ?? 1,
      appSign: dotenv.get('ZegoAppSign'),
      userID: userId,
      userName: userName,
      plugins: [
        plugin
      ], /* 
      notificationConfig: ZegoCallInvitationNotificationConfig(
        androidNotificationConfig: ZegoCallAndroidNotificationConfig(
          showFullScreen: true,
        ),
      ), */
    );
  }

  static Future<void> callUsers(List<UserModel> users) async {
    await service.send(
      isVideoCall: false,
      invitees:
          users.map((e) => ZegoCallUser('${e.id}', e.name ?? '')).toList(),
    );
  }

  static Future<void> endCall(String invitationID, List<String> userIds) async {
    ZegoUIKitSignalingPlugin()
        .cancelInvitation(invitationID: invitationID, invitees: userIds);
  }

  static void onUserLogout() {
    ZegoUIKitPrebuiltCallInvitationService().uninit();
  }
}