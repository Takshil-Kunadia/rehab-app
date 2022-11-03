import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DatabaseService {
  static DatabaseReference ref = FirebaseDatabase.instance.ref("sessions");
  static String day = DateFormat("dd-MM-yyyy").format(DateTime.now());
  static String time = DateFormat("hh:mm a").format(DateTime.now());

  static void startSession(String session) async {
    await ref.child(day).update(
      {
        session: time,
      },
    );
  }

  static Future<Map> getSessions() async {
    final snapshot = await ref.child(day).get();
    final result = snapshot.value as Map;
    Get.log(result.toString());
    return result;
  }
}