import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:greenchargehub/auth/helper.dart';

import 'model.dart';

class OnBoardNotifier extends ChangeNotifier {
  late Future<List<Booking>> bookingData;

  userconfslots(Booking model) {
    AuthHelper.booking(model).then((response) {
      if (response) {
        Get.snackbar("done", "Your are done");
      } else if (!response) {
        Get.snackbar("error", "error");
      }
    }).catchError((error) {
      Get.snackbar(' failed', 'Invalid');
    });
  }
}
