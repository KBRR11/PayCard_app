import 'package:flutter/material.dart';
import 'package:pay_card_app/models/tarjeta_credito.dart';
import 'package:pay_card_app/widgets/total_pay_button.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class TarjetaPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    final tarjeta = new TarjetaCredito(
      cardNumberHidden: '4242',
      cardNumber: '4242424242424242',
      brand: 'visa',
      cvv: '213',
      expiracyDate: '01/25',
      cardHolderName: 'Keny Ramírez'
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagar'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(),

        Hero(
          tag: tarjeta.cardNumber,
                  child: CreditCardWidget(
                          cardNumber: tarjeta.cardNumber,
                          expiryDate: tarjeta.expiracyDate,
                          cardHolderName: tarjeta.cardHolderName,
                          cvvCode: tarjeta.cvv,
                          showBackView: false,
                        ),
        ),
                    


          
          Positioned(
              
              bottom:0 ,
              child: TotalPayButon())
        ],
      )
    );
  }
}