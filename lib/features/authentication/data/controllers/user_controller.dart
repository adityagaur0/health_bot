import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/popups/loader.dart';
import '../model/user_modal.dart';
import '../repo/user_repository.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  final imageUplaoding = false.obs;
  RxBool isNewUser = false.obs;
  Rx<UserModel> user =
      UserModel.empty().obs; //initially user has usermodel which is empty.
  // has obs class and return type is Rx(usermodel)
  // so using getx here we create a user which retians its state and
  // help us to update  the front end whenever needed

  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  // Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      // First update the Rx user and then check if the user data is already stored. if not ,store new data
      await fetchUserRecord();
      print("user id " + user.value.id);

      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          isNewUser.value = true;
          // Convert the names to first and last name
          final nameParts =
              UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredentials.user!.displayName ?? '');

          // Map Data
          final user = UserModel(
              id: userCredentials.user!.uid,
              firstName: nameParts[0],
              lastName:
                  nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
              username: username,
              email: userCredentials.user!.email ?? '',
              phoneNo: userCredentials.user!.phoneNumber ?? '',
              profilePicture: userCredentials.user!.photoURL ?? '');
          print("user id not present ");
          print(user.id);
          print(user.toJson());

          // Save User data
          await userRepository.saveUserRecord(user);
          // print("AAAAAAAAAAAAA");
          // print(user.firstName);
        }
        print("save urser :  id present");
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Data not saved',
        message:
            'Something went wrong while saving your information. You can re-save your data in your Profile.',
      );
    }
  }

  /// Check if the user is new?
  // Future<bool> isNewUser(UserCredential? userCredential) async {
  //   await fetchUserRecord();
  //   if (userCredential == null)
  //     return false; // Return false if no user credential

  //   // If user does not exist, return true indicating it's a new user
  //   return true;
  // }

  /// Upload Profile Image
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      );
      if (image != null) {
        imageUplaoding.value = true;
        //uplaod Image
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile/', image);
        // Update User Image Record
        Map<String, dynamic> json = {'Profile picture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();

        //success snackbar
        TLoaders.successSnackBar(
            title: 'Congratulations',
            message: 'Your Profile Image has been updated!');
      }
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'OhSnap', message: 'Something went wrong: $e');
    } finally {
      imageUplaoding.value = false;
    }
  }
}
