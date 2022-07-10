import 'package:bloc/bloc.dart';
import 'package:booze_flutter/models/checkout/checkout_model.dart';
import 'package:booze_flutter/models/checkout/extras_cart.dart';
import 'package:booze_flutter/repositories/checkout/checkout_repository.dart';
import 'package:equatable/equatable.dart';

import '../../models/checkout/address.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CheckoutRepository checkoutRepository;
  CheckoutBloc({required this.checkoutRepository}) : super(CheckoutInitial()) {
    on<GetcheckoutDetailsEvent>((event, emit) async {
      emit(CheckoutLoadingState());
      List<ExtrasCart> extraCart = [];
      await checkoutRepository.getCheckoutDetails().then((checkoutModel) {
        emit(
          CheckoutLoadedState(
            checkoutModel: checkoutModel,
            extras: extraCart,
            address: Address(
              cityId: 1,
              name: 'New York',
              street: '123 Main St',
              phoneNumber: '10001',
            ),
          ),
        );
      }).catchError((error) {
        emit(CheckoutErrorState(error.toString()));
      });
    });

    on<AddExtras>((event, emit) async {
      emit(CheckoutLoadingState());
      try {
        List<ExtrasCart> extraCart = event.extraCart;

        var contain =
            extraCart.where((element) => element.extra.id == event.extra.id);
        if (contain.isEmpty) {
          extraCart.add(ExtrasCart(extra: event.extra, quantity: 1));
        } else {
          //increment
          contain.first.quantity = contain.first.quantity + 1;
        }
        //add extra to state
        emit(CheckoutLoadedState(
            checkoutModel: event.checkoutDetailsModel, extras: extraCart));
      } catch (e) {
        throw "";
      }
    });

    on<RemoveExtras>((event, emit) async {
      emit(CheckoutLoadingState());
      try {
        List<ExtrasCart> extraCart = event.extraCart;

        var contain =
            extraCart.where((element) => element.extra.id == event.extra.id);
        if (contain.isEmpty) {
        } else {
          //increment
          if (contain.first.quantity <= 1) {
            extraCart.remove(contain.first);
          } else {
            contain.first.quantity = contain.first.quantity - 1;
          }
        }
        emit(CheckoutLoadedState(
            checkoutModel: event.checkoutDetailsModel, extras: extraCart));
      } catch (e) {
        throw "";
      }
    });
  }
}
