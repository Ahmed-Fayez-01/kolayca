import 'package:flutter/material.dart';

import '../../../profile/data/models/user_model.dart';

class LiveTranslatorZgoCallView extends StatefulWidget {
  const LiveTranslatorZgoCallView({super.key, required this.users});
  final List<UserModel> users;
  @override
  State<LiveTranslatorZgoCallView> createState() =>
      _LiveTranslatorZgoCallViewState();
}

class _LiveTranslatorZgoCallViewState extends State<LiveTranslatorZgoCallView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Calling ...')),
    );
  }

  // late ZegoUIKitPrebuiltCall zegoCall;
  // bool isCallAccepted = false;
  // void callUserPerUser(List<UserModel> users) async {
  //   for (int i = 0; i < users.length; i++) {
  //     final userId = users[i].id;
  //     ZegoServices.callUsers(
  //       [users[i]],
  //     );
  //     /*zegoCall = ZegoUIKitPrebuiltCall(
  //       appID: int.tryParse(dotenv.get('ZegoAppID')) ?? 1,
  //       appSign: dotenv.get('ZegoAppSign'),
  //       userID: userId.toString(),
  //       userName: users[i].name ?? '',
  //       callID: generateRandomSixDigitNumber().toString(),
  //       config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall(),
  //       events: ZegoUIKitPrebuiltCallEvents(
  //         user: ZegoCallUserEvents(
  //           onEnter: (zegoUser) {
  //             // zegoUser.toZegoUser().
  //             setState(() {
  //               isCallAccepted = true;
  //             });
  //           },
  //         ),
  //       ),
  //     );*/
  //     setState(() {});
  //
  //     await Future.delayed(Duration(seconds: 35));
  //     print('************************************');
  //     print('${userId} ${users[i].name}');
  //     await ZegoServices.service.cancel(
  //         callees: [ZegoCallUser(userId.toString(), users[i].name ?? '')]);
  //   }
  // }
  //
  // int generateRandomSixDigitNumber() {
  //   Random random = Random();
  //   return 100000 + random.nextInt(900000); // 100000 + (0 to 899999)
  // }
}
