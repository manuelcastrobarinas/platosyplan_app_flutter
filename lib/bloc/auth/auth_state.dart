part of 'auth_bloc.dart';

class AuthState {
  
  final UserModel? user;
  bool isLoadingRequest;

  AuthState({
    this.user,
    this.isLoadingRequest = false,
  });

  AuthState copyWith({
    UserModel? user,
    bool? isLoadingRequest
  }) => AuthState(
    user  : user ?? this.user,
    isLoadingRequest  : isLoadingRequest ?? this.isLoadingRequest 
  );
}
