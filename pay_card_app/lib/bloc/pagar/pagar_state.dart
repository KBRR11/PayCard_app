part of 'pagar_bloc.dart';

@immutable
class PagarState {
  final double montoPagar;
  final String tipoMoneda;
  final bool tarjetaActiva;
  final TarjetaCredito tarjeta;

  String get montoPagarString => '${ (montoPagar * 100).floor() }'; 

  PagarState({
    this.montoPagar = 375.55, 
    this.tipoMoneda = 'USD', 
    this.tarjetaActiva = false, 
    this.tarjeta
    });

  PagarState copyWith({
    double montoPagar,
    String tipoMoneda,
    bool tarjetaActiva,
    TarjetaCredito tarjeta
  })  => PagarState(
    montoPagar   : montoPagar ?? this.montoPagar,
    tipoMoneda   : tipoMoneda ?? this.tipoMoneda,
    tarjetaActiva: tarjetaActiva ?? this.tarjetaActiva,
    tarjeta      : tarjeta ?? this.tarjeta
  );

}
