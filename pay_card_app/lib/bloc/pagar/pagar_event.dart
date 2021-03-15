part of 'pagar_bloc.dart';

@immutable
abstract class PagarEvent {}

class OnSeleccionartarjeta extends PagarEvent{
 final TarjetaCredito tarjeta;

  OnSeleccionartarjeta(this.tarjeta);
}

class OnDesactivarTarjeta extends PagarEvent{}