import 'package:clickncollect_app/services/authentification_service.dart';
import 'package:clickncollect_app/services/firestore_service.dart';
import 'package:clickncollect_app/services/navigation_service.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:stacked_services/stacked_services.dart';

final addShopViewModelProvider =
    ChangeNotifierProvider<AddShopViewModel>((ref) {
  return AddShopViewModel(
    ref.read(navigationServiceProvider),
    ref.read(authentificationServiceProvider),
    ref.read(firestoreProvider),
  );
});

class AddShopViewModel extends ChangeNotifier {
  final NavigationService _navigationService;
  final AuthentificationService _auth;
  final FirestoreService _firestoreService;

  AddShopViewModel(this._navigationService, this._auth, this._firestoreService);

  bool isBusy = false;

  updateBusy() {
    isBusy = !isBusy;
    notifyListeners();
  }
}
