class Customer {
  // String uid;
  String firstname;
  String lastname;
  String email;
  String phoneNumber;
  bool hasAShop = false;
  Map<String, dynamic> shopInfo;

  Customer({
    // this.uid,
    this.firstname,
    this.lastname,
    this.email,
    this.phoneNumber,
    this.hasAShop,
  });

  Customer.fromJson(Map<String, dynamic> data)
      // : uid = data['uid'],
      : firstname = data['firstname'],
        lastname = data['lastname'],
        email = data['email'],
        phoneNumber = data['phoneNumber'],
        hasAShop = data['hasAShop'];

  Map<String, dynamic> toJson() => {
        // 'uid': uid,
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'phoneNumber': phoneNumber,
        'hasAShop': hasAShop
      };

  String fullName() {
    if (firstname != null && lastname != null) {
      if (firstname != '' && lastname != '') {
        return '$firstname $lastname';
      }
    }
    return 'Éditez votre Profile';
  }
}
