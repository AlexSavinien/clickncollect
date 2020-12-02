import 'package:clickncollect_app/app/enums/info_tile_model_enum.dart';
import 'package:clickncollect_app/models/shop.dart';
import 'package:clickncollect_app/ui/views/shop/shop_profile/shop_profile_viewmodel.dart';
import 'package:clickncollect_app/ui/widgets/info_tile/info_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

class ShopProfileView extends ConsumerWidget {
  final ScrollController listViewController = ScrollController();
  @override
  Widget build(BuildContext context, watch) {
    var model = watch(shopProfileViewModelProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder<QuerySnapshot>(
        stream: model.watchShopInfoStream(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            print(snapshot.connectionState);
            return CircularProgressIndicator();
          }
          if (snapshot.connectionState == ConnectionState.active) {
            print(snapshot.connectionState);
            print('Current Shop data ${snapshot.data.docs.first.data()}');
            var shopInfos = snapshot.data.docs.first.data();
            Shop shop = Shop.fromJson(shopInfos);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.account_circle_rounded,
                      size: 100,
                    ),
                    title: Text(shop.name),
                    trailing: GestureDetector(
                      child: Icon(Icons.logout),
                      onTap: () {
                        // model.logOut();
                        // model.navigateToSignIn();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text('Vos informations'),
                  Column(
                    children: [
                      InfoTile(
                        currentInfo: shop.name,
                        currentInfoPlaceholder: 'Nom de votre boutique',
                        firestoreField: 'name',
                        infoTileModel: InfoTileModels.shop,
                      ),
                      InfoTile(
                        currentInfo: shop.horaires,
                        currentInfoPlaceholder: 'Indiquez vos horaires',
                        firestoreField: 'horaires',
                        infoTileModel: InfoTileModels.shop,
                      ),
                      InfoTile(
                        currentInfo: shop.phone,
                        currentInfoPlaceholder: 'Téléphone',
                        firestoreField: 'phone',
                        infoTileModel: InfoTileModels.shop,
                      ),
                      InfoTile(
                        currentInfo: shop.email,
                        currentInfoPlaceholder: 'E-mail',
                        firestoreField: 'email',
                        infoTileModel: InfoTileModels.shop,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Commandes passées'),
                  Container(
                    constraints: BoxConstraints(
                      maxHeight: 180,
                    ),
                    child: ListView(
                      controller: listViewController,
                      children: [
                        ListTile(
                          leading: Icon(Icons.shop_rounded),
                          title: Text('Customer Name'),
                          trailing: Icon(Icons.more_horiz),
                          onTap: () {
                            // Todo ouvre une modal avec un résumé de la commande passé
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.shop_rounded),
                          title: Text('Customer Name'),
                          trailing: Icon(Icons.more_horiz),
                          onTap: () {
                            // Todo ouvre une modal avec un résumé de la commande passé
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.shop_rounded),
                          title: Text('Customer Name'),
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
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          print('Ajouter un produit');
                          model.navigateToAddProduct();
                        },
                        child: Text('Ajouter'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          print('button pressed');
                          model.navigateToShopProductsList();
                        },
                        child: Text('Voir vos produits'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
