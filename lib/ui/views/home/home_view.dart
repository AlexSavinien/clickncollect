import 'package:clickncollect_app/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

class HomeView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    var model = watch(homeViewModelProvider);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: model.getViewForIndex(model.currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Profile',
          ),
        ],
        currentIndex: model.currentIndex,
        selectedItemColor: Colors.grey[800],
        onTap: model.setIndex,
      ),
    );
  }
}
