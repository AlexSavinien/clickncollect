import 'package:clickncollect_app/models/shop.dart';
import 'package:clickncollect_app/services/authentification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

class ShopsListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Shop shop = Shop();
    return Center(
      child: Container(
        child: GestureDetector(
          child: Text('ShopsListView'),
          onTap: () => context.read(authentificationServiceProvider).signOut(),
        ),
      ),
    );
  }
}
