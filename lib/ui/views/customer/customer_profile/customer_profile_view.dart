import 'package:clickncollect_app/app/enums/info_tile_model_enum.dart';
import 'package:clickncollect_app/models/customer.dart';
import 'package:clickncollect_app/ui/views/customer/customer_profile/customer_profile_viewmodel.dart';
import 'package:clickncollect_app/ui/widgets/info_tile/info_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

class CustomerProfileView extends ConsumerWidget {
  final ScrollController listViewController = ScrollController();
  @override
  Widget build(BuildContext context, watch) {
    var model = watch(customerProfileViewModelProvider);
    var stream = model.getCurrentCustomerInfo();
    print('stream view est $stream');
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: StreamBuilder<QuerySnapshot>(
        stream: stream,
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
            print('Customer current data ${snapshot.data.docs.first.data()}');
            var customerData = snapshot.data.docs.first.data();
            Customer customer = Customer.fromJson(customerData);
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
                    title: Text(customer.fullName() ?? 'Votre profile'),
                    trailing: GestureDetector(
                      child: Icon(Icons.logout),
                      onTap: () {
                        model.logOut();
                        model.navigateToSignIn();
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
                        currentInfo: customer.firstname,
                        currentInfoPlaceholder: 'Prénom',
                        firestoreField: 'firstname',
                        infoTileModel: InfoTileModels.customer,
                      ),
                      InfoTile(
                        currentInfo: customer.lastname,
                        currentInfoPlaceholder: 'Nom',
                        firestoreField: 'lastname',
                        infoTileModel: InfoTileModels.customer,
                      ),
                      InfoTile(
                        currentInfo: customer.phoneNumber,
                        currentInfoPlaceholder: 'Téléphone',
                        firestoreField: 'phoneNumber',
                        infoTileModel: InfoTileModels.customer,
                      ),
                      InfoTile(
                        currentInfo: customer.email,
                        currentInfoPlaceholder: 'E-mail',
                        firestoreField: 'email',
                        infoTileModel: InfoTileModels.customer,
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
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Voulez-vous ajouter votre boutique ?'),
                      ElevatedButton(
                        onPressed: () async {
                          print('button pressed');
                          model.navigateToAddShop();
                        },
                        child: Text('Ajouter'),
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
