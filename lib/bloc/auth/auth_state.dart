part of 'auth_bloc.dart';

class AuthState {
  
  final UserModel? user;
  bool isLoadingRequest;
  bool hidePassword;

  AuthState({
    this.user,
    this.isLoadingRequest = false,
    this.hidePassword = true,
  });

  AuthState copyWith({
    UserModel? user,
    bool? isLoadingRequest,
    bool? hidePassword
  }) => AuthState(
    user  : user ?? this.user,
    hidePassword : hidePassword ?? this.hidePassword,
    isLoadingRequest  : isLoadingRequest ?? this.isLoadingRequest 
  );
}
