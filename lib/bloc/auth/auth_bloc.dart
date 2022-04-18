import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/auth/auth_model.dart';
import '../../repositories/auth/authentication_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthenticationRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        AuthModel data = await authRepository.login(
            email: event.email, password: event.password);
        emit(AuthLoadedState(authModel: data));
      } catch (e) {
        emit(AuthErrorState(message: e.toString()));
      }
    });
  }
}
