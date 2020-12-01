import 'package:clickncollect_app/ui/style_constants/form_style_constants.dart';
import 'package:clickncollect_app/ui/views/shop/add_shop/add_shop_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

class AddShopView extends StatelessWidget {
  final emailController = TextEditingController();
  final adressController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var model = context.read(addShopViewModelProvider);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ajoutez votre boutique',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      // color: ThemeData.of,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: kTextFieldInputDecoration.copyWith(
                    hintText: 'Email de la boutique'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: adressController,
                decoration: kTextFieldInputDecoration.copyWith(
                    hintText: 'Adresse de la boutique'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: phoneController,
                decoration: kTextFieldInputDecoration.copyWith(
                    hintText: 'Téléphone de la boutique'),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  print('button pressed');
                  // var res = await model.signUp(
                  //   email: emailController.text,
                  //   password: passwordController.text,
                  // );
                  // print(res);
                  // if (res == 'success') {
                  //   model.navigateToHome();
                  // }
                },
                child: Text('S\'inscrire'),
              ),
              Consumer(
                builder: (context, watch, child) {
                  bool isBusy = watch(addShopViewModelProvider).isBusy;
                  if (isBusy) {
                    return CircularProgressIndicator();
                  } else {
                    return SizedBox(height: 1);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
