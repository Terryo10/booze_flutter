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

class AddExtras extends CheckoutEvent{
  final CheckoutDetailsModel checkoutDetailsModel;
  final Extra extra;
  final List<ExtrasCart> extraCart; 
  const AddExtras({required this.extraCart, required this.checkoutDetailsModel, required this.extra});
    @override
  List<Object> get props => [extra];

}


