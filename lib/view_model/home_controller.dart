import 'package:get/get.dart';

import 'database_service.dart';

class HomeController extends GetxController {
  Map data = {};
  bool isLoading = true;
  int completed = 1;
  int pending = 1;
  int total_data = 2;
  int percentage = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }

  void getData() async {
    data = await DatabaseService.getSessions();
    if (data != null) {
      completed = data.length;
    }
    pending = total_data - completed;
    percentage = ((completed / total_data) * 100).round();
    isLoading = false;
    update();
  }

  void startSession(String session) async {
    DatabaseService.startSession(session);
    getData();
  }
}