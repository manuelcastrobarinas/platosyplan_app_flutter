import 'package:bloc/bloc.dart';
import 'package:platosyplan/models/auth/auth.dart';
import 'package:platosyplan/services/auth/auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc({required this.authService}) : super(AuthState()) {
    on<OnGetUserAuthEvent>      ((event, emit) => emit(state.copyWith(user: event.user)));
    on<OnSetLoadingRequestEvent>((event, emit) => emit(state.copyWith(isLoadingRequest: event.isLoadRequest)));
  }

  Future<String> registerNewUser({required String name, required String email, required String password,required String phone}) async {
    final String response = await authService.register(name: name, email: email, password: password, phone: phone);
    if (response != 'success') return response;
    add(OnGetUserAuthEvent(user: authService.user!));
    return response; 
  }
  
  void setIsLoadingRequest({required bool isLoadingRequest}) => add(OnSetLoadingRequestEvent(isLoadRequest: isLoadingRequest));
}
