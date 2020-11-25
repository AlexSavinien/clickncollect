import 'package:clickncollect_app/app/router.gr.dart';
import 'package:clickncollect_app/services/authentification_service.dart';
import 'package:clickncollect_app/services/firestore_service.dart';
import 'package:clickncollect_app/services/navigation_service.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:stacked_services/stacked_services.dart';

final signUpViewModelProvider = ChangeNotifierProvider<SignUpViewModel>((ref) {
  return SignUpViewModel(
    ref.read(navigationServiceProvider),
    ref.read(authentificationServiceProvider),
    ref.read(firestoreProvider),
  );
});

class SignUpViewModel extends ChangeNotifier {
  final NavigationService _navigationService;
  final AuthentificationService _auth;
  final FirestoreService _firestoreService;

  SignUpViewModel(this._navigationService, this._auth, this._firestoreService);

  // ========================== UI ==========================
  bool isBusy = false;

  updateBusy() {
    isBusy = !isBusy;
    notifyListeners();
  }

  // ======================== Sign Up ========================
  Future<String> signUp({@required email, @required password}) async {
    updateBusy();
    print('isBusy ? $isBusy.');
    notifyListeners();
    String authRes = await _auth.signUp(email: email, password: password);
    print(authRes);
    if (authRes == 'sucess') {
      String firestoreRes =
          await _firestoreService.createCustomer(email: email);
      print(firestoreRes);
      if (firestoreRes == 'success') {
        updateBusy();
        print('isBusy ? $isBusy.');
        notifyListeners();
        print('success');
        return 'success';
      }
    } else {
      updateBusy();
      print('isBusy ? $isBusy.');
      return 'error';
    }
  }

  // ======================== Navigation ========================
  navigateToHome() {
    _navigationService.navigateTo(Routes.homeView);
  }

  navigateToSignIn() {
    _navigationService.navigateTo(Routes.signInView);
  }
}
