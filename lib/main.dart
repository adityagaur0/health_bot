import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:health_bot/features/authentication/data/repo/authentication_repository.dart';
import 'package:health_bot/firebase_options.dart';
import 'package:health_bot/main_page.dart';

Future<void> main() async {
  // 1.enable widget binding
  WidgetsFlutterBinding.ensureInitialized();
  //2. enable screen util
  await ScreenUtil.ensureScreenSize();
  //3. enable get storage
  await GetStorage.init();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  runApp(const MyApp());
}
