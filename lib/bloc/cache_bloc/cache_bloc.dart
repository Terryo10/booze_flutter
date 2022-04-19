import 'package:bloc/bloc.dart';
import 'package:booze_flutter/bloc/auth/auth_bloc.dart';
import 'package:booze_flutter/repositories/cache_repository/cache_repository.dart';
import 'package:equatable/equatable.dart';

part 'cache_event.dart';
part 'cache_state.dart';

class CacheBloc extends Bloc<CacheEvent, CacheState> {
  final AuthBloc authBloc;
  final CacheRepository cacheRepository;
  CacheBloc({required this.cacheRepository,required this.authBloc}) : super(CacheInitial()) {
    on<AppStarted>((event, emit) {
      
    });
  }
}
