import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter/widgets.dart';
import 'package:found_legacy/admin_app/enums/device_screen_type.dart';

//import 'package:responsive_app/enums/device_screen_type.dart';

class SizingInformation {
  final Orientation orientation;
  final DeviceOrientation deviceOrientation;
  final Size screenSize;
  final Size localWidgetSize;

  SizingInformation(
      {this.orientation,
      this.deviceOrientation,
      this.screenSize,
      this.localWidgetSize,
      DeviceScreenType deviceScreenType});

  @override
  String toString() {
    return 'Orientation:$orientation  DeviceOrientation:$deviceOrientation ScreenSize:$screenSize LocalWidgetSize:$localWidgetSize';
  }
}
