part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();

  @override
  List<Object> get props => [];
}

class GetcheckoutDetailsEvent extends CheckoutEvent {
  @override
  List<Object> get props => [];
}

class AddExtras extends CheckoutEvent {
  final CheckoutDetailsModel checkoutDetailsModel;
  final Extra extra;
  final List<ExtrasCart> extraCart;
  final Address address;
  final PaymentMethod paymentMethod;
  final DeliveryTime deliveryTime;
  const AddExtras({
    required this.paymentMethod,
    required this.extraCart,
    required this.checkoutDetailsModel,
    required this.extra,
    required this.address,
    required this.deliveryTime,
  });
  @override
  List<Object> get props => [extra];
}

class RemoveExtras extends CheckoutEvent {
  final CheckoutDetailsModel checkoutDetailsModel;
  final Extra extra;
  final List<ExtrasCart> extraCart;
  final Address address;
  final PaymentMethod paymentMethod;
  final DeliveryTime deliveryTime;
  const RemoveExtras({
    required this.paymentMethod,
    required this.extraCart,
    required this.checkoutDetailsModel,
    required this.extra,
    required this.address,
    required this.deliveryTime,
  });
  @override
  List<Object> get props => [extra];
}

class AddAddress extends CheckoutEvent {
  final CheckoutDetailsModel checkoutDetailsModel;
  final List<ExtrasCart> extraCart;
  final Address address;
  final PaymentMethod paymentMethod;
  final DeliveryTime deliveryTime;
  const AddAddress({
    required this.paymentMethod,
    required this.extraCart,
    required this.checkoutDetailsModel,
    required this.address,
    required this.deliveryTime,
  });
  @override
  List<Object> get props => [address];
}

class AddPaymentMethod extends CheckoutEvent {
  final CheckoutDetailsModel checkoutDetailsModel;
  final List<ExtrasCart> extraCart;
  final Address address;
  final PaymentMethod paymentMethod;
  final DeliveryTime deliveryTime;
  const AddPaymentMethod({
    required this.paymentMethod,
    required this.extraCart,
    required this.checkoutDetailsModel,
    required this.address,
    required this.deliveryTime,
  });
  @override
  List<Object> get props =>
      [address, extraCart, checkoutDetailsModel, paymentMethod];
}


class AddDeliveryTime extends CheckoutEvent {
  final CheckoutDetailsModel checkoutDetailsModel;
  final List<ExtrasCart> extraCart;
  final Address address;
  final PaymentMethod paymentMethod;
  final DeliveryTime deliveryTime;
  const AddDeliveryTime({
    required this.paymentMethod,
    required this.extraCart,
    required this.checkoutDetailsModel,
    required this.address,
    required this.deliveryTime,
  });
  @override
  List<Object> get props =>
      [address, extraCart, checkoutDetailsModel, paymentMethod];
}
