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
  final PaymentMethod paymentMethod;
  final DeliveryTime deliveryTime;

  double extrasTotal() {
    double total = 0;
    for (var extra in extras) {
      total += (extra.extra.price ?? 0) * extra.quantity;
    }
    return total;
  }

  double get total => extrasTotal();
  const CheckoutLoadedState({
    required this.paymentMethod,
    required this.address,
    required this.checkoutModel,
    required this.extras,
    required this.deliveryTime
  });

  @override
  List<Object> get props => [checkoutModel, extras, total, address, paymentMethod, deliveryTime];
}

class CheckoutErrorState extends CheckoutState {
  final String errorMessage;

  const CheckoutErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
