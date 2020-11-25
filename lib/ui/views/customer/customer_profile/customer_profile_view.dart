import 'package:clickncollect_app/ui/views/customer/customer_profile/customer_profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

class CustomerProfileView extends StatelessWidget {
  final ScrollController listViewController = ScrollController();
  @override
  Widget build(BuildContext context) {
    var model = context.read(customerProfileProvider);
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(
              Icons.account_circle_rounded,
              size: 100,
            ),
            title: Text('Username Profile'),
            trailing: GestureDetector(
              child: Icon(Icons.logout),
              onTap: () {
                model.logOut();
                model.navigateToSignIn();
              },
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Vos informations'),
              ListTile(
                title: Text('User full name'),
                trailing: Icon(Icons.edit),
                onTap: () {},
              ),
              ListTile(
                title: Text('User email'),
                trailing: Icon(Icons.edit),
                onTap: () {},
              ),
              ListTile(
                title: Text('User phone'),
                trailing: Icon(Icons.edit),
                onTap: () {},
              ),
              SizedBox(
                height: 30,
              ),
              Text('Commandes passées'),
              SizedBox(
                height: 10,
              ),
              Container(
                constraints: BoxConstraints(
                  maxHeight: 200,
                ),
                child: ListView(
                  controller: listViewController,
                  children: [
                    ListTile(
                      leading: Icon(Icons.shop_rounded),
                      title: Text('ShopName'),
                      trailing: Icon(Icons.more_horiz),
                      onTap: () {
                        // Todo ouvre une modal avec un résumé de la commande passé
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.shop_rounded),
                      title: Text('ShopName'),
                      trailing: Icon(Icons.more_horiz),
                      onTap: () {
                        // Todo ouvre une modal avec un résumé de la commande passé
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.shop_rounded),
                      title: Text('ShopName'),
                      trailing: Icon(Icons.more_horiz),
                      onTap: () {
                        // Todo ouvre une modal avec un résumé de la commande passé
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.shop_rounded),
                      title: Text('ShopName'),
                      trailing: Icon(Icons.more_horiz),
                      onTap: () {
                        // Todo ouvre une modal avec un résumé de la commande passé
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.shop_rounded),
                      title: Text('ShopName'),
                      trailing: Icon(Icons.more_horiz),
                      onTap: () {
                        // Todo ouvre une modal avec un résumé de la commande passé
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
