import 'package:get/get.dart';
import '../utils/helpers/network_manager.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put(NetworkManager());
  }
}
