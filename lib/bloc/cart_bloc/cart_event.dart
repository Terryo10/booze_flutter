part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddToCart extends CartEvent {
  final Product product;

  const AddToCart(this.product);
}

class RemoveFromToCart extends CartEvent {
  final Product product;

  const RemoveFromToCart(this.product);
}

class CartStarted extends CartEvent {}

class DecrementFromToCart extends CartEvent {
  final Product product;

  const DecrementFromToCart(this.product);
  @override
  List<Object> get props => [];
}
