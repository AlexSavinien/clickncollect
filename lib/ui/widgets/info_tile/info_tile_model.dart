import 'package:clickncollect_app/services/firestore_service.dart';
import 'package:clickncollect_app/ui/views/customer/customer_profile/customer_profile_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/all.dart';

final infoTileModelProvider = ChangeNotifierProvider<InfoTileModel>((ref) {
  return InfoTileModel(
      ref.read(firestoreProvider), ref.read(customerProfileViewModelProvider));
});

class InfoTileModel extends ChangeNotifier {
  final FirestoreService _firestore;
  final CustomerProfileViewModel _customerProfileViewModel;

  InfoTileModel(this._firestore, this._customerProfileViewModel);

  Stream<QuerySnapshot> getCurrentCustomer() {
    Stream customer = _customerProfileViewModel.getCurrentCustomerInfo();
    return customer;
  }

  updateCurrentUserInfo(String dataField, dataValue) {
    _firestore.updateCurrentCustomerInfo(dataField, dataValue);
    notifyListeners();
  }
}
