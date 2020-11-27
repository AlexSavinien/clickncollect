import 'package:clickncollect_app/ui/views/customer/customer_profile/customer_profile_view.dart';
import 'package:clickncollect_app/ui/views/shop/shops_list/shops_list_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

final homeViewModelProvider = ChangeNotifierProvider<HomeViewModel>((ref) {
  return HomeViewModel();
});

class HomeViewModel extends ChangeNotifier {
  int _currentIndex = 0;
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
