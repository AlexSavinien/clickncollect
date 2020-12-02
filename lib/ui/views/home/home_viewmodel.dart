import 'package:clickncollect_app/services/firestore_service.dart';
import 'package:clickncollect_app/ui/views/customer/customer_profile/customer_profile_view.dart';
import 'package:clickncollect_app/ui/views/shop/shop_profile/shop_profile_view.dart';
import 'package:clickncollect_app/ui/views/shop/shops_list/shops_list_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

final homeViewModelProvider = ChangeNotifierProvider<HomeViewModel>((ref) {
  return HomeViewModel(
    ref.read(firestoreProvider),
  );
});

class HomeViewModel extends ChangeNotifier {
  final FirestoreService _firestore;

  int _currentIndex = 0;

  HomeViewModel(this._firestore);
  get currentIndex => _currentIndex;

  /// Indicates whether we're going forward or backward in terms of the index we're changing.
  /// This is very helpful for the page transition directions.
  bool _reverse = false;
  bool get reverse => _reverse;

  setIndex(int value) {
    if (value < _currentIndex) {
      _reverse = true;
    } else {
      _reverse = false;
    }
    _currentIndex = value;
    notifyListeners();
  }

  Stream<QuerySnapshot> getCustomerStream() {
    print('_firestore is $_firestore');
    Stream<QuerySnapshot> customerStream = _firestore.watchCurrentCustomer();
    return customerStream;
  }

  Widget getViewWithShopProfileForIndex(int index) {
    switch (index) {
      case 0:
        return ShopsListView();
      case 1:
        return CustomerProfileView();
      case 2:
        return ShopProfileView();
      default:
        return ShopsListView();
    }
  }

  List<BottomNavigationBarItem> navigationBarWithShopProfile = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle_rounded),
      label: 'Profile',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shop_rounded),
      label: 'Ma Boutique',
    ),
  ];

  List<BottomNavigationBarItem> navigationBar = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle_rounded),
      label: 'Profile',
    ),
  ];

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return ShopsListView();
      case 1:
        return CustomerProfileView();
      default:
        return ShopsListView();
    }
  }
}
