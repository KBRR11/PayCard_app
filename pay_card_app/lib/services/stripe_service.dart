import 'package:meta/meta.dart';
import 'package:stripe_payment/stripe_payment.dart';

class StripeService{
  //Singleton
  StripeService._privateConstructor();
  static final _instance = StripeService._privateConstructor();
  factory StripeService() => _instance;

  String _paymentApiUrl = 'https://api.stripe.com/v1/payment_intents';
  String _secretKey = '--Your stripe secretKey--';
  String _publishableKey = '--Your stripe publishableKey--';

  void init (){

  }

  Future pagarConTarjetaExistente({
    @required String amount,
    @required String currency,
    @required CreditCard card
}) async{

}

  Future pagarConNuevaTarjeta({
    @required String amount,
    @required String currency
  }) async{

  }

  Future pagarApplePayGooglePay({
    @required String amount,
    @required String currency
  }) async{

  }

  Future _crearPaymentIntent({
    @required String amount,
    @required String currency
    }) async{

    }

  Future _realizarPago({
    @required String amount,
    @required String currency,
    @required PaymentMethod paymentMethod
  }) async{

  }

}

