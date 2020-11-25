import 'package:clickncollect_app/ui/style_constants/form_style_constants.dart';
import 'package:clickncollect_app/ui/views/authentification/signin/signin_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

class SignInView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model = context.read(signInViewModelProvider);
    model.isBusy = false;
    print('build is busy ? ${model.isBusy}');
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration:
                    kTextFieldInputDecoration.copyWith(hintText: 'Email'),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: passwordController,
                decoration: kTextFieldInputDecoration.copyWith(
                    hintText: 'Mot de passe'),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  print('button pressed');
                  var res = await model.signIn(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  print(res);
                  if (res == 'success') {
                    model.navigateToHome();
                  }
                },
                child: Text('Se connecter'),
              ),
              Consumer(
                builder: (context, watch, child) {
                  bool isBusy = watch(signInViewModelProvider).isBusy;
                  if (isBusy) {
                    return CircularProgressIndicator();
                  } else {
                    return SizedBox(height: 1);
                  }
                },
              ),
              GestureDetector(
                onTap: () {
                  model.navigateToSignUp();
                  print('Navigate to signin view');
                },
                child: Text(
                  'Vous n\'avez pas de compte ? Cliquez ici pour vous inscrire !',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
