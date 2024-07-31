import 'package:get/get.dart';
import '../controllers/controller.dart';
import '../services/network_service.dart';

class Base {
  Base._();
  static final networkService = Get.find<NetworkService>();
  static final taskTwoController = Get.find<Controller>();
}
