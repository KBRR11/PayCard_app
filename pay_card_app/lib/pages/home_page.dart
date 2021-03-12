import 'package:flutter/material.dart';

import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:pay_card_app/data/tarjetas.dart';
import 'package:pay_card_app/widgets/total_pay_button.dart';
import 'package:flutter/services.dart';
class HomePage extends StatefulWidget {

  
   
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 //  @override
 // void initState() { 
 //   setState(() {
 //     
 //    SystemChrome.setEnabledSystemUIOverlays([]);
 //   });
 //   super.initState();
 // }
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text('Pagar'),
          actions: [IconButton(icon: Icon(Icons.add), onPressed: () {})],
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Positioned(
              height: size.height,
              width: size.width,
              top: size.height *0.22,
              child: PageView.builder(
                  controller: PageController(viewportFraction: 0.9),
                  physics: BouncingScrollPhysics(),
                  itemCount: tarjetas.length,
                  itemBuilder: (_, i) {
                    final tarjeta = tarjetas[i];
                    return CreditCardWidget(,
                      cardNumber: tarjeta.cardNumber,
                      expiryDate: tarjeta.expiracyDate,
                      cardHolderName: tarjeta.cardHolderName,
                      cvvCode: tarjeta.cvv,
                      showBackView: false,
                    );
                  }),
            ),
            Positioned(
              //height: size.height*0.11,
              //width: size.width,
              bottom:0 ,
              child: TotalPayButon())
          ],
        ));
  }
}
