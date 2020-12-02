import 'package:clickncollect_app/ui/views/home/home_viewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

// HomeView accueil la navigation utilisateur via la [BottomNavigationBar]
// La navigation dépends de la propriété du customer hasAShop.
// Si hasAShop est vrai, alors il a un onglet de plus qui est le profile de sa boutique
// Pour avoir hasAShop, on passe par un stream qui target l'utilisateur actuellement connecté.
// Le stream permet d'être réactif et de tout de suite affiché l'onglet une fois la boutique enregistrée
class HomeView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var model = watch(homeViewModelProvider);
    return StreamBuilder<QuerySnapshot>(
        stream: model.getCustomerStream(),
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshots) {
          if (snapshots.hasError) {
            print('Something went wrong');
            return Text('Something went wrong');
          }
          if (snapshots.connectionState == ConnectionState.waiting) {
            print('waiting for firestore response');
          }
          if (snapshots.connectionState == ConnectionState.active) {
            var customerData = snapshots.data.docs.first;
            return Scaffold(
              resizeToAvoidBottomPadding: false,
              body: customerData['hasAShop']
                  ? model.getViewWithShopProfileForIndex(model.currentIndex)
                  : model.getViewForIndex(model.currentIndex),
              bottomNavigationBar: BottomNavigationBar(
                items: customerData['hasAShop']
                    ? model.navigationBarWithShopProfile
                    : model.navigationBar,
                currentIndex: model.currentIndex,
                selectedItemColor: Colors.grey[800],
                onTap: model.setIndex,
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
