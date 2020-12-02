class Shop {
  String shopId;
  String name;
  String email;
  String phone;
  String adress;
  String horaires;
  String ownerId;

  Shop(
      {this.name,
      this.email,
      this.phone,
      this.adress,
      this.horaires,
      this.ownerId});

  Shop.fromJson(Map<String, dynamic> data)
      : name = data['name'],
        email = data['email'],
        phone = data['phone'],
        adress = data['adress'],
        horaires = data['horaires'],
        ownerId = data['ownerId'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'phone': phone,
        'adress': adress,
        'horaires': horaires,
        'ownerId': ownerId,
      };
}
