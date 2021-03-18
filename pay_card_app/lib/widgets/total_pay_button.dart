import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pay_card_app/bloc/pagar/pagar_bloc.dart';
import 'package:pay_card_app/helpers/helpers.dart';
import 'package:pay_card_app/services/stripe_service.dart';
import 'package:stripe_payment/stripe_payment.dart';

class TotalPayButon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pagarBloc = BlocProvider.of<PagarBloc>(context).state;

    return Container(
      child: Container(
        //margin: EdgeInsets.symmetric(horizontal:10),
        padding: EdgeInsets.symmetric(horizontal: 15),
        width: size.width,
        height: size.height * 0.12,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${pagarBloc.montoPagar} ${pagarBloc.tipoMoneda}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
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
    return BlocBuilder<PagarBloc, PagarState>(
        builder: (_, state) => (state.tarjetaActiva)
            ? buildButtonCreditCard(context)
            : buildAppleAndGooglePay(context));
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
            Icon(
              FontAwesomeIcons.solidCreditCard,
              color: Colors.white,
            ),
            Text(
              '  Pagar',
              style: TextStyle(color: Colors.white, fontSize: 22),
            )
          ],
        ),
        onPressed: () async {
          mostrarLoading(context);
          final stripeService = new StripeService();
          final state = BlocProvider.of<PagarBloc>(context).state;
          final tarjeta = state.tarjeta;
          final montYear = tarjeta.expiracyDate.split('/');

          final resp = await stripeService.pagarConTarjetaExistente(
              amount: state.montoPagarString,
              currency: state.tipoMoneda,
              card: CreditCard(//TODO: cvv 
                  number: tarjeta.cardNumber,
                  expMonth: int.parse(montYear[0]),
                  expYear: int.parse(montYear[1])));
          Navigator.pop(context);
          if (resp.ok) {
            //mostrarAlerta(context, 'Tarjeta Ok', 'Todo Correcto');
            Navigator.pushReplacementNamed(context, 'pago_completo');
          } else {
            mostrarAlerta(context, 'Algo salió mal', resp.msg);
          }
        });
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
                  ? FontAwesomeIcons.google
                  : FontAwesomeIcons.apple,
              color: Colors.white,
            ),
            Text(
              ' Pay',
              style: TextStyle(color: Colors.white, fontSize: 22),
            )
          ],
        ),
        onPressed: () {
        final stripeService = new StripeService();
        final state = BlocProvider.of<PagarBloc>(context).state;

        final resp = stripeService.pagarApplePayGooglePay(
          amount: state.montoPagarString, 
          currency: state.tipoMoneda
          );
        });
  }
}
