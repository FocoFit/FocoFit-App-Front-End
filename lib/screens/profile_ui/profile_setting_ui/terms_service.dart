import 'package:flutter/material.dart';
import 'package:focofit/extensions/extension.dart';
import 'package:focofit/utils/k_text_styles.dart';
import 'package:focofit/widgets/k_app_bar.dart';

class TermsAndService extends StatelessWidget {
  const TermsAndService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar(
          onTap: (){
            Navigator.pop(context);
          },
          title: 'Terms of Service'
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text('Effective Date : December 19, 2024',style: primaryTextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
            20.height,
            Text('These Terms Of Service("Terms") govern tour access to and use of the Fostify mobile application("the app")'
              'developed by Focofit ',style: primaryTextStyle(fontSize: 14,fontWeight: FontWeight.w400),)
        ],),
      ),
    );
  }
}
