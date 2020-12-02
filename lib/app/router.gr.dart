// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/authentification/signin/signin_view.dart';
import '../ui/views/authentification/signup/signup_view.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/shop/add_product/add_product_view.dart';
import '../ui/views/shop/add_shop/add_shop_view.dart';
import '../ui/views/shop/shop_products_list/shop_products_list_view.dart';
import '../ui/views/shop/shop_profile/shop_profile_view.dart';
import '../ui/views/startup/startup_view.dart';

class Routes {
  static const String startUpView = '/';
  static const String homeView = '/home-view';
  static const String signInView = '/sign-in-view';
  static const String addShopView = '/add-shop-view';
  static const String signUpView = '/sign-up-view';
  static const String shopProfileView = '/shop-profile-view';
  static const String addProductView = '/add-product-view';
  static const String shopProductsListView = '/shop-products-list-view';
  static const all = <String>{
    startUpView,
    homeView,
    signInView,
    addShopView,
    signUpView,
    shopProfileView,
    addProductView,
    shopProductsListView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.signInView, page: SignInView),
    RouteDef(Routes.addShopView, page: AddShopView),
    RouteDef(Routes.signUpView, page: SignUpView),
    RouteDef(Routes.shopProfileView, page: ShopProfileView),
    RouteDef(Routes.addProductView, page: AddProductView),
    RouteDef(Routes.shopProductsListView, page: ShopProductsListView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    StartUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StartUpView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    SignInView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignInView(),
        settings: data,
      );
    },
    AddShopView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddShopView(),
        settings: data,
      );
    },
    SignUpView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpView(),
        settings: data,
      );
    },
    ShopProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ShopProfileView(),
        settings: data,
      );
    },
    AddProductView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddProductView(),
        settings: data,
      );
    },
    ShopProductsListView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ShopProductsListView(),
        settings: data,
      );
    },
  };
}
