class Customer {
  String uid;
  String firstname;
  String lastname;
  String email;
  String phoneNumber;

  Customer.fromJson(Map<String, dynamic> data)
      : uid = data['uid'],
        firstname = data['firstname'],
        lastname = data['lastname'],
        email = data['email'],
        phoneNumber = data['phoneNumber'];

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'phoneNumber': phoneNumber,
      };
}
