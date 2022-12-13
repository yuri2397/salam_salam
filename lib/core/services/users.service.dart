import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../models/user.model.dart';

class UserService extends GetxService {
  final user = User().obs;
  final _box = GetStorage();

  @override
  Future<void> onInit() async {
    super.onInit();
    var localUser = _box.read('user');
    if (localUser != null) {
      user.value = User.fromJson(localUser);
    }
  }

  Future<UserService> init() async {
    return this;
  }

  void setUser(User? user, {required String phoneNumber, String? smsCode}) {
    this.user.value = user!;
    _box.write('user', user.toJson());
  }

  void clearUser() {
    user.value = User();
    _box.remove('user');
  }

  bool isAuthed() {
    return user.value.authed;
  }

  // set User object model fields in named params
  void updateUser(
      {String? email,
      String? phoneNumber,
      String? smsCode,
      String? photoUrl,
      String? uid,
      String? token,
      bool? firstTime,
      bool? authed}) {
    if (email != null) {
      user.value.email = email;
    }
    if (phoneNumber != null) {
      user.value.phoneNumber = phoneNumber;
    }
    if (smsCode != null) {
      user.value.smsCode = smsCode;
    }
    if (photoUrl != null) {
      user.value.photoUrl = photoUrl;
    }
    if (uid != null) {
      user.value.uid = uid;
    }
    if (token != null) {
      user.value.token = token;
    }
    if (authed != null) {
      user.value.authed = authed;
    }
    if (firstTime != null) {
      user.value.firstTime = firstTime;
    }
    _box.write('user', user.value.toJson());
  }
}
