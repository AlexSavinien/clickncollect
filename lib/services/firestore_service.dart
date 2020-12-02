import 'package:clickncollect_app/services/authentification_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

import '../models/customer.dart';
import '../models/product.dart';
import '../models/shop.dart';

final firestoreProvider = Provider<FirestoreService>((ref) {
  return FirestoreService(
    ref.read(authentificationServiceProvider),
  );
});

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthentificationService _auth;

  FirestoreService(this._auth);

  CollectionReference getCollectionStream(String collection) =>
      _firestore.collection(collection);

  // ============================================= Products handling =============================================
  Future addProduct(Product product, Shop shop) async {
    // Todo add product to a shop and add product to products
  }

  Future updateProduct(Product product, Shop shop) async {
    // Todo
  }

  Future deleteProduct(Product product, Shop shop) async {
    // Todo
  }

  Future getProductFromAShop(Product product, Shop shop) async {
    // Todo
  }

  Future getProductsListFromAShop(Shop shop) async {
    // Todo
  }

  Future getProductsListFromACustomer(Customer customer) async {
    // Todo
  }

// ============================================= Shop handling =============================================
  Future<String> addShop(Shop shop) async {
    String uid = _auth.currentUser.uid;
    try {
      //Add the shop to Shops Collection
      DocumentReference newShop =
          await getCollection('shops').add(shop.toJson());

      // Add shopId to Customer's shop's info (if he has multiple shops)
      await getCollection('customers').doc(uid).update({
        'hasAShop': true,
        'shopInfo': {'shopId': newShop.id}
      });
      return 'success';
    } on FirebaseException catch (e) {
      print(e);
      return 'error';
    }
  }

  Future updateShopInfo(String dataField, dataValue) async {
    try {
      var customerData = await getCurrentCustomer();
      getCollection('shops')
          .doc(customerData['shopInfo']['shopId'])
          .update({dataField: dataValue});
      print(
          'Shop with id ${customerData['shopInfo']['shopId']} has updated his $dataField with $dataValue');
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  Future deleteShop(Shop shop) async {
    // Todo
  }

  Stream<QuerySnapshot> watchCurrentCustomerShopInfo() async* {
    try {
      var customerData = await getCurrentCustomer();
      yield* getCollection('shops')
          .where(FieldPath.documentId,
              isEqualTo: customerData['shopInfo']['shopId'])
          .snapshots();
    } on FirebaseException catch (e) {
      print(e);
    }
  }

// ============================================= Customer handling =============================================
  Future<String> createCustomer({@required String email}) async {
    String uid = _auth.currentUser.uid;
    print('user id is $uid');
    Customer customer = Customer(email: email, hasAShop: false);
    try {
      if (uid != null) {
        await getCollection('customers')
            .doc(uid)
            .set(customer.toJson())
            .whenComplete(() {
          print('user added to firestore');
        });
        return 'success';
      } else {
        return 'error';
      }
    } on FirebaseException catch (e) {
      print(e.message);
      return 'error';
    }
  }

  CollectionReference getCollection(String collection) =>
      _firestore.collection(collection);

  Future<Map<String, dynamic>> getCurrentCustomer() async {
    try {
      String uid = _auth.currentUser.uid;
      DocumentSnapshot customerFuture =
          await getCollection('customers').doc(uid).get();
      Map<String, dynamic> customer = customerFuture.data();
      return customer;
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  Stream<QuerySnapshot> watchCurrentCustomer() {
    try {
      String uid = _auth.currentUser.uid;
      print('current customer id is : $uid');
      Stream customerStream = getCollection('customers')
          .where(FieldPath.documentId, isEqualTo: uid)
          .snapshots(includeMetadataChanges: true);
      return customerStream;
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  Future updateCurrentCustomerInfo(String dataField, dataValue) async {
    try {
      var uid = _auth.currentUser.uid;
      await getCollection('customers')
          .doc(uid)
          .update({dataField: dataValue})
          .then((value) => print(
              'User with id $uid has updated his $dataField with $dataValue'))
          .catchError((error) => print("Failed to update user: $error"));
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  Future addCustomerToAShop(Customer customer, Shop shop) async {
    // Todo
  }

  Future deleteCustomer(Customer customer, Shop shop) async {
    // Todo
  }

  Future getCustomersListFromAShop(Shop shop) async {
    // Todo
  }

  Future getCustomerFromAShop(Customer customer, Shop shop) async {
    // Todo
  }
}
