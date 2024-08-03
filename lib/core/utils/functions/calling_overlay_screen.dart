import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolayca/core/utils/services/remote_services/zego_cloud_service.dart';

OverlayEntry showCallingOverlay(BuildContext context) {
  OverlayState? overlayState = Overlay.of(context);
  late OverlayEntry overlayEntry;
  void cancelCall() {
    overlayEntry.remove();
    ZegoServices.isCallCancelled = true;
    ZegoServices.cancelCall();
  }

  overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      child: Material(
        color: Colors.grey.shade900,
        child: AnnotatedRegion(
          value: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light),
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            decoration: BoxDecoration(color: Colors.grey.shade900),
            child: Center(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(height: 50.h),
                  const Text(
                    'Calling...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 50.h),
                  FilledButton(
                    style: FilledButton.styleFrom(
                        padding: EdgeInsets.all(8.r),
                        shape: CircleBorder(),
                        backgroundColor: Colors.red),
                    onPressed: () {
                      cancelCall();
                    },
                    child: Icon(
                      Icons.call_end,
                      color: Colors.white,
                      size: 50.r,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );

  overlayState.insert(overlayEntry);
  return overlayEntry;
}
