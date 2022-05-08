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

  const CartLoadedState({required this.cartItems, required this.cartCount});

  @override
  List<Object> get props => [cartCount, cartItems];
}
