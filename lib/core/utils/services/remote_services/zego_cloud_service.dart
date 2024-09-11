// zego_services.dart

/*
class ZegoServices {
  ZegoServices();
  static final service = ZegoUIKitPrebuiltCallInvitationService();
  static final plugin = ZegoUIKitSignalingPlugin();
  static void onUserLogout() async {
    service.uninit();
  }

  static Future<void> initZego(String userId, String userName) async {
    service.init(
      appID: int.tryParse(dotenv.get('ZegoAppID')) ?? 1,
      appSign: dotenv.get('ZegoAppSign'),
      userID: userId,
      userName: userName,
      plugins: [plugin],
      invitationEvents: ZegoUIKitPrebuiltCallInvitationEvents(
          onInvitationUserStateChanged: (info) {
        print("33333333333333333333333333333333333333333333333333333333");
        print(info.first.state);
        if (info.first.state ==
            ZegoSignalingPluginInvitationUserState.accepted) {
          isCallAccepted = true;
          overlayEntry.remove();
          acceptedCallStartTime = DateTime.now();
        } else if (info.first.state ==
            ZegoSignalingPluginInvitationUserState.ended) {
          print("call is ended++++++++++++++++++++++++++++++++++++++++++++++-");
          SetZegoCallTime.call((acceptedCallStartTime ?? DateTime.now())
              .difference(DateTime.now())
              .inMinutes);
        }
      }),
    );
  }

  static Future<void> callUsers(List<UserModel> users) async {
    List<ZegoCallUser> callees =
        users.map((e) => ZegoCallUser('${e.id}', e.name ?? '')).toList();
    await service.send(isVideoCall: false, invitees: callees);
  }

  static DateTime? acceptedCallStartTime;
  static bool isCallAccepted = false;
  static bool isCallCancelled = false;
  static late OverlayEntry overlayEntry;
  */ /* static void callUserPerUser(context, List<UserModel> users) async {
    isCallAccepted = false;
    isCallCancelled = false;
    overlayEntry = showCallingOverlay(context);
    for (int i = 0; i < users.length; i++) {
      acceptedCallStartTime = null;
      ZegoServices.callUsers([users[i]]);
      print('**************************************************');
      print(users[i].name);
      await Future.delayed(const Duration(seconds: 30));
      if (isCallAccepted || isCallCancelled) {
        print("call break -------------------------------------");
        break;
      } else {
        cancelCall();
      }
    }
    if (!isCallCancelled && !isCallAccepted) {
      print(
          "call not accepted and not cancelled 666666666666666666666666666666666666666666666");
      cancelCall();
      overlayEntry.remove();
    }
  }
*/ /*
  static Future cancelCall() async {
    print("nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn cancel cale");
    await service.cancel(callees: []);
  }

}*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

import '../../../../features/profile/data/models/user_model.dart';
import '../../functions/calling_overlay_screen.dart';
import '../../functions/set_call_time_serivce.dart';

class ZegoServices {
  ZegoServices();
  static final service = ZegoUIKitPrebuiltCallInvitationService();
  static final plugin = ZegoUIKitSignalingPlugin();
  static void onUserLogout() async {
    service.uninit();
  }

  static Future<void> initZego(String userId, String userName) async {
    service.init(
      appID: int.tryParse(dotenv.get('ZegoAppID')) ?? 1,
      appSign: dotenv.get('ZegoAppSign'),
      userID: userId,
      userName: userName,
      plugins: [plugin],
      requireConfig: (ZegoCallInvitationData data) {
        var config = ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall();
        config.duration.isVisible = true;
        config.duration.onDurationUpdate = (Duration duration) {
          callDurationInSeconds = duration.inSeconds;
        };
        return config;
      },
      events: ZegoUIKitPrebuiltCallEvents(
        onCallEnd: (e, defaultAction) async {
          debugPrint(
              'onCallEnd////////************************************onCallEnd');

          if (isCallAccepted) {
            SetZegoCallTime.call(((callDurationInSeconds ?? 0) / 60).ceil(),
                currentCalleeUserId ?? "0");
          }
          defaultAction.call();
        },
      ),
      invitationEvents: ZegoUIKitPrebuiltCallInvitationEvents(
          onIncomingCallReceived:
              (materialTextSelectionControls, user, g, k, kl) {
        currentCalleeUserId = user.id;
      }, onInvitationUserStateChanged: (info) {
        print("State changed: -------------------------------------------");
        print("State changed: ${info.first.state}");
        if (info.first.state ==
            ZegoSignalingPluginInvitationUserState.accepted) {
          isCallAccepted = true;
          if (info.first.userID != userId) {
            currentCalleeUserId = info.first.userID;
          }
          overlayEntry.remove();
        }
      }),
    );
  }

  static Future<void> callUsers(List<UserModel> users) async {
    List<ZegoCallUser> callees =
        users.map((e) => ZegoCallUser('${e.id}', e.name ?? '')).toList();
    callDurationInSeconds = null;
    await service.send(
        isVideoCall: false, invitees: callees, timeoutSeconds: 25);
  }

  static int? callDurationInSeconds;
  static bool isCallAccepted = false;
  static bool isCallCancelled = false;
  static late OverlayEntry overlayEntry;
  static String? currentCalleeUserId;
  static void callUserPerUser(context, List<UserModel> users) async {
    isCallAccepted = false;
    isCallCancelled = false;
    currentCalleeUserId = null;
    overlayEntry = showCallingOverlay(context);
    for (int i = 0; i < users.length; i++) {
      await ZegoServices.callUsers([users[i]]);
      print(
          '####################################################################');
      print(users[i].name);
      print(users[i].id);
      // Check for call acceptance in smaller intervals
      for (int j = 0; j < 25; j++) {
        await Future.delayed(const Duration(seconds: 1));
        if (isCallAccepted || isCallCancelled) {
          break;
        }
      }
      if (isCallAccepted || isCallCancelled) {
        break;
      }
    }
    if (!isCallCancelled && !isCallAccepted) {
      cancelCall();
      overlayEntry.remove();
    }
  }

  static Future cancelCall() async {
    await service.cancel(callees: []);
  }
}
