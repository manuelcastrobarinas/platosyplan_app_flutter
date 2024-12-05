part of 'auth_bloc.dart';

sealed class AuthEvent {}

class OnGetUserAuthEvent extends AuthEvent {
  final UserModel user;
  OnGetUserAuthEvent({required this.user});
}


class OnSetLoadingRequestEvent extends AuthEvent {
  final bool isLoadRequest;

  OnSetLoadingRequestEvent({required this.isLoadRequest});
} 