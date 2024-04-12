abstract class LoginEvent {}

class LoginTextChangedEvent extends LoginEvent {
  final String email;
  final String password;

  LoginTextChangedEvent({required this.email, required this.password});
}

class LoginTextSubmittedEvent extends LoginEvent {
  final String email;
  final String password;

  LoginTextSubmittedEvent({required this.email, required this.password});
}
