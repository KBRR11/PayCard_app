import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:pay_card_app/bloc/pagar/pagar_bloc.dart';
import 'package:pay_card_app/data/tarjetas.dart';
import 'package:pay_card_app/helpers/helpers.dart';
import 'package:pay_card_app/pages/tarjeta_page.dart';
import 'package:pay_card_app/services/stripe_service.dart';
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
  
  final stripeService = new StripeService();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pagarBloc = BlocProvider.of<PagarBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Pagar'),
          actions: [
            IconButton( 
                icon: Icon(Icons.add),
                onPressed: () async {
                  final amount = pagarBloc.state.montoPagarString;
                  final currency = pagarBloc.state.tipoMoneda;
                 final resp = await this.stripeService.pagarConNuevaTarjeta(amount: amount, currency: currency);
                 if (resp.ok) {
                   mostrarAlerta(context, 'Tarjeta Ok', 'Todo Correcto');
                 } else {
                   mostrarAlerta(context, 'Algo salió mal', resp.msg);
                 }
                })
          ],
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Positioned(
              height: size.height,
              width: size.width,
              top: size.height * 0.22,
              child: PageView.builder(
                  controller: PageController(viewportFraction: 0.9),
                  physics: BouncingScrollPhysics(),
                  itemCount: tarjetas.length,
                  itemBuilder: (_, i) {
                    final tarjeta = tarjetas[i];
                    return GestureDetector(
                      onTap: () {
                        BlocProvider.of<PagarBloc>(context).add(OnSeleccionartarjeta(tarjeta));
                        Navigator.push(context, navegarFadeIn(context, TarjetaPage()));
                      },
                      child: Hero(
                        tag: tarjeta.cardNumber,
                        child: CreditCardWidget(
                          cardNumber: tarjeta.cardNumber,
                          expiryDate: tarjeta.expiracyDate,
                          cardHolderName: tarjeta.cardHolderName,
                          cvvCode: tarjeta.cvv,
                          showBackView: false,
                        ),
                      ),
                    );
                  }),
            ),
            Positioned(
                //height: size.height*0.11,
                //width: size.width,
                bottom: 0,
                child: TotalPayButon())
          ],
        ));
  }
}
