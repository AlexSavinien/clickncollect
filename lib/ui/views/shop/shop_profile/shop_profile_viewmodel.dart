import 'package:clickncollect_app/app/router.gr.dart';
import 'package:clickncollect_app/services/authentification_service.dart';
import 'package:clickncollect_app/services/bottom_sheet_service.dart';
import 'package:clickncollect_app/services/firestore_service.dart';
import 'package:clickncollect_app/services/navigation_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:stacked_services/stacked_services.dart';

final shopProfileViewModelProvider =
    ChangeNotifierProvider<ShopProfileViewModel>((ref) {
  return ShopProfileViewModel(
    ref.read(firestoreProvider),
    ref.read(navigationServiceProvider),
    ref.read(bottomSheetProvider),
    ref.read(authentificationServiceProvider),
  );
});

class ShopProfileViewModel extends ChangeNotifier {
  final FirestoreService _firestore;
  final NavigationService _navigationService;
  final BottomSheetService _bottomSheetService;
  final AuthentificationService _auth;

  ShopProfileViewModel(this._firestore, this._navigationService,
      this._bottomSheetService, this._auth);

  Stream<QuerySnapshot> watchShopInfoStream() {
    Stream<QuerySnapshot> shopStream =
        _firestore.watchCurrentCustomerShopInfo();
    return shopStream;
  }

  updateInfo({String dataField, dataValue}) {
    _firestore.updateShopInfo(dataField, dataValue);
  }

  void logOut() {
    _auth.signOut();
    _navigationService.navigateTo(Routes.signInView);
  }

  void navigateToAddProduct() {
    _navigationService.navigateTo(Routes.addProductView);
  }

  void navigateToShopProductsList() {
    _navigationService.navigateTo(Routes.shopProductsListView);
  }
}
