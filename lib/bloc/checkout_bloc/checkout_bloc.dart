import 'package:bloc/bloc.dart';
import 'package:booze_flutter/models/checkout/checkout_model.dart';
import 'package:booze_flutter/repositories/checkout/checkout_repository.dart';
import 'package:equatable/equatable.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CheckoutRepository checkoutRepository;
  CheckoutBloc({required this.checkoutRepository}) : super(CheckoutInitial()) {
    on<GetcheckoutDetailsEvent>((event, emit) async{
      emit(CheckoutLoadingState());
     await checkoutRepository.getCheckoutDetails().then((checkoutModel) {
        emit(CheckoutLoadedState(checkoutModel));
      }).catchError((error) {
        emit(CheckoutErrorState(error.toString()));
      });
    });
  }
}
