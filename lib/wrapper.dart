import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tal2a_seller_app/presentation/login/login.dart';
import 'package:tal2a_seller_app/presentation/models/models.dart';
import 'package:tal2a_seller_app/presentation/models/models.dart';

import 'app/server/firebase/user_api.dart';
import 'navigation_service.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<User?>();

    // return either the Home or Authenticate widget
    if (user == null) {
      return LoginScreen();
    } else {
      return StreamBuilder<Client>(
          stream: null/*UserApi().getCurrentUser*/,
          builder: (context, snapshot) {
            Client? model = snapshot.data;
            if(model != null && model.userType == 'user'){
              return MultiProvider(providers: [], child: Container(),
              );
            }else{
              return const SizedBox();
            }
          });
    }
  }
}