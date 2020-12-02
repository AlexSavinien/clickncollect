import 'package:clickncollect_app/app/router.gr.dart';
import 'package:clickncollect_app/services/authentification_service.dart';
import 'package:clickncollect_app/services/firestore_service.dart';
import 'package:clickncollect_app/services/navigation_service.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:stacked_services/stacked_services.dart';

final customerProfileViewModelProvider =
    ChangeNotifierProvider<CustomerProfileViewModel>((ref) {
  return CustomerProfileViewModel(
    ref.read(authentificationServiceProvider),
    ref.read(navigationServiceProvider),
    ref.read(firestoreProvider),
  );
});

class CustomerProfileViewModel extends ChangeNotifier {
  final AuthentificationService _auth;
  final NavigationService _navigationService;
  final FirestoreService _firestore;

  CustomerProfileViewModel(
      this._auth, this._navigationService, this._firestore);

  Stream getCurrentCustomerInfo() {
    Stream customerStream = _firestore.watchCurrentCustomer();
    return customerStream;
  }

  updateInfo({String dataField, dataValue}) {
    _firestore.updateCurrentCustomerInfo(dataField, dataValue);
    // notifyListeners();
  }

  logOut() {
    _auth.signOut();
  }

  navigateToAddShop() {
    _navigationService.navigateTo(Routes.addShopView);
  }

  navigateToSignIn() {
    _navigationService.navigateTo(Routes.signInView);
  }
}
