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
    on<OnSetShowPasswordEvent>  ((event, emit) => emit(state.copyWith(hidePassword: event.showPassword)));
  }

  Future<String> registerNewUser({required String name, required String email, required String password,required String phone}) async {
    final String response = await authService.register(name: name, email: email, password: password, phone: phone);
    if (response != 'success') return response;
    add(OnGetUserAuthEvent(user: authService.user!));
    return response; 
  }
  
  Future<String> loginSesion({required String email, required String password }) async {
    final String response = await authService.login(email: email, password: password);
    if (response != 'success' ) return response;
    add(OnGetUserAuthEvent(user: authService.user!));
    return response;
  }

  Future<String> loadCredentials() async {
    final String response = await authService.getUserCredentials();
    if (response != 'success') return response;
    add(OnGetUserAuthEvent(user: authService.user!));
    return response;
  }

  void setIsLoadingRequest({required bool isLoadingRequest}) => add(OnSetLoadingRequestEvent(isLoadRequest: isLoadingRequest));
  void showPassword({required bool showPassword}) => add(OnSetShowPasswordEvent(showPassword: showPassword));
}
