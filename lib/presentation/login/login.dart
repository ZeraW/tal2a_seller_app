import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:tal2a_seller_app/navigation_service.dart';
import 'package:tal2a_seller_app/presentation/resources/color_manager.dart';
import 'package:tal2a_seller_app/presentation/resources/styles_manager.dart';
import 'package:tal2a_seller_app/presentation/resources/values_manager.dart';

import '../../app/server/auth.dart';
import '../common/text_field.dart';
import '../home/home.dart';
import '../home/main.dart';
import '../resources/font_manager.dart';
import '../resources/responsive.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  final TextEditingController emailTEC = TextEditingController();
  final TextEditingController passwordTEC = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: SingleChildScrollView(
          child: FormBuilder(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Responsive.height(6 , context),
                ),

                 Text(
                  'طلقة اكسبرس للشحن السريع',
                  style: getBoldStyle(color: ColorManager.grey,fontSize:FontSize.s20,),
                ),
                SizedBox(
                  height: Responsive.height(2, context),
                ),
                 Text(
                  'أهلا!',
                  style: getBoldStyle(color: ColorManager.grey1,fontSize:FontSize.s17,),

                ),
                 Text(
                  'سعداء برؤيتك مرة أخرى!',
                   style: getBoldStyle(color: ColorManager.grey2,fontSize:FontSize.s17,),

                 ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                TextFieldWidget(
                  hint: "الايميل",
                  controller: emailTEC,
                  validator: (value) {
                    if (value!.isEmpty || !isEmail(value)) {
                      return "ادخل ايميل صحيح";
                    }
                    return null;
                  }, title: 'الايميل',
                ),

                TextFieldWidget(
                  hint: "كلمة المرور",
                  controller: passwordTEC,
                  isPassword: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "ادخل كلمة المرور";
                    }
                    return null;
                  }, title: 'كلمة المرور',
                ),
                const SizedBox(
                  height: AppPadding.p8,
                ),
                SizedBox(height: AppSize.s40,child: ElevatedButton(onPressed: (){signIn();}, child: const Text('تسجيل الدخول'))),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signIn() async {
    NavigationService.instance.navigateToWidget(MainScreen());
    /*debugPrint('signIn()');
    final form = formKey.currentState;
    if (form!.validate()) {
      String email = emailTEC.text;
      String password = passwordTEC.text;

      await AuthService().signInWithEmailAndPassword(
          email: email,
          password: password);

    } else {
      debugPrint('Form is invalid');
    }*/
  }

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(em);
  }
}
