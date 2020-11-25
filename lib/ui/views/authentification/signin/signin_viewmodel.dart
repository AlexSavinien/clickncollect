import 'package:clickncollect_app/app/router.gr.dart';
import 'package:clickncollect_app/services/authentification_service.dart';
import 'package:clickncollect_app/services/navigation_service.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:stacked_services/stacked_services.dart';

final signInViewModelProvider = ChangeNotifierProvider<SignInViewModel>((ref) {
  return SignInViewModel(
    ref.read(navigationServiceProvider),
    ref.read(authentificationServiceProvider),
  );
});

class SignInViewModel extends ChangeNotifier {
  final NavigationService _navigationService;
  final AuthentificationService _auth;

  SignInViewModel(this._navigationService, this._auth);

  // ======================== UI ========================

  bool isBusy = false;

  updateBusy() {
    isBusy = !isBusy;
    notifyListeners();
  }

  // ======================== Sign In ========================
  Future<String> signIn({@required email, @required password}) async {
    updateBusy();
    print('isBusy ? $isBusy.');
    notifyListeners();
    String authRes = await _auth.signIn(email: email, password: password);
    print(authRes);
    if (authRes == 'sucess') {
      updateBusy();
      print('is busy ? $isBusy');
      return 'success';
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

  navigateToSignUp() {
    _navigationService.navigateTo(Routes.signUpView);
  }
}
