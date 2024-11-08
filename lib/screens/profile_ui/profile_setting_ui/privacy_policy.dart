import 'package:flutter/material.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
        onTap: (){
          Navigator.pop(context);
        },
        title: 'Privacy Policy'
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Column(children: [
          Text('Effective Date : December 19, 2024',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),)
        ],),
      ),
    );
  }
}
