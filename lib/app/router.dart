import 'package:auto_route/auto_route_annotations.dart';
import 'package:clickncollect_app/ui/views/authentification/signin/signin_view.dart';
import 'package:clickncollect_app/ui/views/authentification/signup/signup_view.dart';
import 'package:clickncollect_app/ui/views/home/home_view.dart';
import 'package:clickncollect_app/ui/views/shop/add_product/add_product_view.dart';
import 'package:clickncollect_app/ui/views/shop/add_shop/add_shop_view.dart';
import 'package:clickncollect_app/ui/views/shop/shop_products_list/shop_products_list_view.dart';
import 'package:clickncollect_app/ui/views/shop/shop_profile/shop_profile_view.dart';
import 'package:clickncollect_app/ui/views/startup/startup_view.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: StartUpView, initial: true),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: SignInView),
  MaterialRoute(page: AddShopView),
  MaterialRoute(page: SignUpView),
  MaterialRoute(page: ShopProfileView),
  MaterialRoute(page: AddProductView),
  MaterialRoute(page: ShopProductsListView),
])
class $Router {}
