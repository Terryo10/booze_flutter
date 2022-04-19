part of 'cache_bloc.dart';

abstract class CacheState extends Equatable {
  const CacheState();
  
  @override
  List<Object> get props => [];
}

class CacheInitial extends CacheState {}

class CacheFoundState extends CacheState{
  final String token;

  const CacheFoundState({required this.token});

    @override
  List<Object> get props => [token];
}

class CacheNotFoundState extends CacheState{}
