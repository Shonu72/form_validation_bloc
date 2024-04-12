import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation/screens/signIn/bloc/login_event.dart';
import 'package:form_validation/screens/signIn/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitialState()) {
    on<LoginTextChangedEvent>((event, emit) {
      if (EmailValidator.validate(event.email) == false) {
        emit(LoginErrorState(
            errorMessage: "Please enter a valid email address"));
      } else if (event.password == "" && event.password.length < 6) {
        emit(LoginErrorState(errorMessage: "Enter a valid password "));
      } else {
        emit(LoginValidState());
      }
    });

    on<LoginTextSubmittedEvent>(((event, emit) {
      emit(LoginLoadingState());
    }));
  }
}
