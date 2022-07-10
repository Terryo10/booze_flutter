part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  const CheckoutState();

  @override
  List<Object> get props => [];
}

class CheckoutInitial extends CheckoutState {}

class CheckoutLoadingState extends CheckoutState {}

class CheckoutLoadedState extends CheckoutState {
  final CheckoutDetailsModel checkoutModel;
  final List<ExtrasCart> extras;
  final Address address;

  const CheckoutLoadedState(
      {required this.address,
      required this.checkoutModel,
      required this.extras});

  @override
  List<Object> get props => [checkoutModel, extras];
}

class CheckoutErrorState extends CheckoutState {
  final String errorMessage;

  const CheckoutErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
