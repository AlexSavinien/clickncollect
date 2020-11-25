import 'package:auto_route/auto_route_annotations.dart';
import 'package:clickncollect_app/ui/views/authentification/signin/signin_view.dart';
import 'package:clickncollect_app/ui/views/authentification/signup/signup_view.dart';
import 'package:clickncollect_app/ui/views/home/home_view.dart';
import 'package:clickncollect_app/ui/views/startup/startup_view.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: StartUpView),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: SignInView),
  MaterialRoute(page: SignUpView, initial: true),
  // MaterialRoute(page: SignInView),
  // MaterialRoute(page: SignInView),
  // MaterialRoute(page: SignInView),
])
class $Router {}
