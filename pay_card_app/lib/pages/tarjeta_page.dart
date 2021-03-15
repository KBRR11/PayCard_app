import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pay_card_app/bloc/pagar/pagar_bloc.dart';

import 'package:pay_card_app/widgets/total_pay_button.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class TarjetaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pagar'),
          centerTitle: true,
          leading: IconButton(icon: Icon(
            (!Platform.isAndroid)
            ?Icons.arrow_back_rounded
            :Icons.arrow_back_ios),
            onPressed: (){
              BlocProvider.of<PagarBloc>(context).add(OnDesactivarTarjeta());
              Navigator.pop(context);
            },

          ),
        ),
        body: Stack(
          children: [
            Container(),
            BlocBuilder<PagarBloc, PagarState>(
              builder: (_, state) {
                final tarjeta = state.tarjeta;
               return Hero(
                tag: tarjeta.cardNumber,
                child: CreditCardWidget(
                  cardNumber: tarjeta.cardNumber,
                  expiryDate: tarjeta.expiracyDate,
                  cardHolderName: tarjeta.cardHolderName,
                  cvvCode: tarjeta.cvv,
                  showBackView: false,
                  obscureCardNumber: false,
                ),
              );
              },
               
              ),
            
            Positioned(bottom: 0, child: TotalPayButon())
          ],
        ));
  }
}
