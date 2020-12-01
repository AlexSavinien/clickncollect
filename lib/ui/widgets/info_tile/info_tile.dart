import 'package:clickncollect_app/ui/views/customer/customer_profile/customer_profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

class InfoTile extends StatelessWidget {
  final String currentInfo;
  final String currentInfoPlaceholder;
  final String firestoreField;
  final Function onTap;

  // final Stream customerInfoStream;
  const InfoTile({
    Key key,
    @required this.currentInfo,
    @required this.currentInfoPlaceholder,
    this.onTap,
    @required this.firestoreField,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      var parentModel = watch(customerProfileViewModelProvider);
      return ListTile(
        title: TextField(
          decoration: InputDecoration(
            labelText: currentInfo,
            hintText: currentInfoPlaceholder,
          ),
          onSubmitted: (newText) {
            print('submitted');
            parentModel.updateCurrentUserInfo(
              dataField: firestoreField,
              dataValue: newText,
            );
            FocusScope.of(context).unfocus();
          },
        ),
      );
    });
  }
}
