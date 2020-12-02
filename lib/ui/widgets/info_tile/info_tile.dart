import 'package:clickncollect_app/app/enums/info_tile_model_enum.dart';
import 'package:clickncollect_app/ui/views/customer/customer_profile/customer_profile_viewmodel.dart';
import 'package:clickncollect_app/ui/views/shop/shop_profile/shop_profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

/// [CurrentInfo] = valeur sur firestore
/// [CurrentInfoPlaceHolder] = placeholder lorqu'on veut éditer le champs
/// [Firestorefield] = champs à updater dans le document firestore
/// [infoTileModel] = enums InfoTileModels, indique quel model regarder pour
/// updater le document de la bonne collection
class InfoTile extends StatelessWidget {
  final String currentInfo;
  final String currentInfoPlaceholder;
  final String firestoreField;
  final InfoTileModels infoTileModel;

  // final Stream customerInfoStream;
  const InfoTile({
    Key key,
    @required this.currentInfo,
    @required this.currentInfoPlaceholder,
    @required this.firestoreField,
    @required this.infoTileModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      var shopModel = watch(shopProfileViewModelProvider);
      var customerModel = watch(customerProfileViewModelProvider);
      return ListTile(
        title: TextField(
          decoration: InputDecoration(
            labelText: currentInfo,
            hintText: currentInfoPlaceholder,
          ),
          onSubmitted: (newText) {
            if (infoTileModel == InfoTileModels.shop) {
              shopModel.updateInfo(
                  dataField: firestoreField, dataValue: newText);
            }
            if (infoTileModel == InfoTileModels.customer) {
              shopModel.updateInfo(
                  dataField: firestoreField, dataValue: newText);
            }
          },
        ),
      );
    });
  }
}
