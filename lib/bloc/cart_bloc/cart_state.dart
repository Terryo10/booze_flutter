part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoadingState extends CartState {}

class CartLoadedState extends CartState {
  final List<CartItems> cartItems;
  final int cartCount;
  final double total;

  const CartLoadedState(
      {required this.cartItems, required this.cartCount, this.total = 0});

  @override
  List<Object> get props => [cartCount, cartItems];
}
