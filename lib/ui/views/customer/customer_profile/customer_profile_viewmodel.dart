import 'package:clickncollect_app/app/router.gr.dart';
import 'package:clickncollect_app/services/authentification_service.dart';
import 'package:clickncollect_app/services/navigation_service.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:stacked_services/stacked_services.dart';

final customerProfileProvider = ChangeNotifierProvider<CustomerProfile>((ref) {
  return CustomerProfile(
    ref.read(authentificationServiceProvider),
    ref.read(navigationServiceProvider),
  );
});

class CustomerProfile extends ChangeNotifier {
  final AuthentificationService _auth;
  final NavigationService _navigationService;

  CustomerProfile(this._auth, this._navigationService);

  logOut() {
    _auth.signOut();
  }

  navigateToSignIn() {
    _navigationService.navigateTo(Routes.signInView);
  }
}
