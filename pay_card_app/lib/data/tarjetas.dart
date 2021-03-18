import '../models/tarjeta_credito.dart';

final List<TarjetaCredito> tarjetas = <TarjetaCredito>[
    TarjetaCredito(
      cardNumberHidden: '4242',
      cardNumber: '4242424242424242',
      brand: 'visa',
      cvv: '213',
      expiracyDate: '01/25',
      cardHolderName: 'Fulano Ramírez'
    ),
    TarjetaCredito(
      cardNumberHidden: '5555',
      cardNumber: '5555555555554444',
      brand: 'mastercard',
      cvv: '213',
      expiracyDate: '01/25',
      cardHolderName: 'Sócrates Pérez'
    ),
    TarjetaCredito(
      cardNumberHidden: '3782',
      cardNumber: '378282246310005',
      brand: 'american express',
      cvv: '2134',
      expiracyDate: '01/25',
      cardHolderName: 'James Rodríguez'
    ),
    TarjetaCredito(
      cardNumberHidden: '6011',
      cardNumber: '6011111111111117',
      brand: 'Discover',
      cvv: '365',
      expiracyDate: '01/25',
      cardHolderName: 'Leonel Messi'
    ),
    
  ];