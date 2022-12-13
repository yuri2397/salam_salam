class User {
  String? uid;
  String? email;
  String? phoneNumber;
  String? displayName;
  String? photoURL;
  String? providerId;
  String? smsCode;
  bool authed = false;
  bool firstTime = true;

  String? token;

  String? photoUrl;

  User({
    this.uid,
    this.email,
    this.phoneNumber,
    this.displayName,
    this.photoURL,
    this.providerId,
    this.smsCode,
    this.token,
    this.photoUrl,
    this.authed = false,
    this.firstTime = true,
  });

  User.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    displayName = json['displayName'];
    photoURL = json['photoURL'];
    smsCode = json['smsCode'];
    providerId = json['providerId'];
    authed = json['authed'];
    token = json['token'];
    photoUrl = json['photoUrl'];
    firstTime = json['firstTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['uid'] = uid;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    data['displayName'] = displayName;
    data['photoURL'] = photoURL;
    data['smsCode'] = smsCode;
    data['providerId'] = providerId;
    data['authed'] = authed;
    data['firstTime'] = firstTime;
    data['token'] = token;
    data['photoUrl'] = photoUrl;
    return data;
  }
}
