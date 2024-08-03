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
      invitationEvents: ZegoUIKitPrebuiltCallInvitationEvents(
          onInvitationUserStateChanged: (info) {
        print("State changed: ${info.first.state}");
        if (info.first.state ==
            ZegoSignalingPluginInvitationUserState.accepted) {
          isCallAccepted = true;
          overlayEntry.remove();
          acceptedCallStartTime = DateTime.now();
        } else if (info.first.state ==
                ZegoSignalingPluginInvitationUserState.ended ||
            info.first.state ==
                ZegoSignalingPluginInvitationUserState.timeout) {
          if (!isCallAccepted) {
            isCallCancelled = true;
          }
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
    await service.send(
        isVideoCall: false, invitees: callees, timeoutSeconds: 25);
  }

  static DateTime? acceptedCallStartTime;
  static bool isCallAccepted = false;
  static bool isCallCancelled = false;
  static late OverlayEntry overlayEntry;

  static void callUserPerUser(context, List<UserModel> users) async {
    isCallAccepted = false;
    isCallCancelled = false;
    overlayEntry = showCallingOverlay(context);
    for (int i = 0; i < users.length; i++) {
      acceptedCallStartTime = null;
      await ZegoServices.callUsers([users[i]]);
      print(
          '####################################################################');
      print(users[i].name);

      // Check for call acceptance in smaller intervals
      for (int j = 0; j < 25; j++) {
        await Future.delayed(const Duration(seconds: 1));
        if (isCallAccepted || isCallCancelled) {
          print("call break -------------------------------------");
          break;
        }
      }

      if (isCallAccepted || isCallCancelled) {
        break;
      } else {
        // cancelCall();
      }
    }

    if (!isCallCancelled && !isCallAccepted) {
      print(
          "call not accepted and not cancelled///////////////////////////////////////////////");
      cancelCall();
      overlayEntry.remove();
    }
  }

  static Future cancelCall() async {
    print(
        "Cancelling call***************************************************************");
    await service.cancel(callees: []);
  }
}
