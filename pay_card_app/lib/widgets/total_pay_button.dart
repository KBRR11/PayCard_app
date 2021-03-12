import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TotalPayButon extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
   final size = MediaQuery.of(context).size;

    return Container(
      child: Container(
        //margin: EdgeInsets.symmetric(horizontal:10),
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: size.width,
        height: size.height *0.12,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Total:', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            Text('520.20 USD', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),),
              ],
            ),
            _BtnPay()
          ],
        ),
      ),
    );
  }
}

class _BtnPay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return true
    ? buildButtonCreditCard(context)
    : buildAppleAndGooglePay(context);
  }

  Widget buildButtonCreditCard(BuildContext context) {
    return MaterialButton(
      shape: StadiumBorder(),
      height: 45,
      minWidth: 170,
      elevation: 0,
      color: Colors.black,
      child: Row(
        children: [
        Icon(FontAwesomeIcons.solidCreditCard , color: Colors.white,),
        Text('  Pagar', style: TextStyle(color: Colors.white, fontSize: 22),)
        ],
      ),
      onPressed: (){});
  }

  Widget buildAppleAndGooglePay(BuildContext context) {
    return MaterialButton(
      shape: StadiumBorder(),
      height: 45,
      minWidth: 150,
      elevation: 0,
      color: Colors.black,
      child: Row(
        children: [
        Icon(
          Platform.isAndroid
          ?FontAwesomeIcons.google
          :FontAwesomeIcons.apple
          , color: Colors.white,),
        Text(' Pay', style: TextStyle(color: Colors.white, fontSize: 22),)
        ],
      ),
      onPressed: (){});
  }
}