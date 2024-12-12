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

  Future<void> registerNewUser({required String name, required String email, required String password,required String phone}) async {
    final UserModel userModel = await authService.register(name: name, email: email, password: password, phone: phone);
    add(OnGetUserAuthEvent(user: userModel));
  }
  
  Future<void> loginSesion({required String email, required String password }) async {
    final  user = await authService.login(email: email, password: password);
    add(OnGetUserAuthEvent(user: user));
  }

  Future<void> loadCredentials() async {
    final UserModel user = await authService.getUserProfile();
    add(OnGetUserAuthEvent(user: user));
  }

  Future<void> updateUser({required String? name, required String? email, required String? password, required String? phone}) async {
    final UserModel updatedUser = await authService.updateUser(email: email, name: name, password: password, phone: phone);
    add(OnGetUserAuthEvent(user: updatedUser));
  }

  void setIsLoadingRequest({required bool isLoadingRequest}) => add(OnSetLoadingRequestEvent(isLoadRequest: isLoadingRequest));
  void showPassword({required bool showPassword}) => add(OnSetShowPasswordEvent(showPassword: showPassword));
}
