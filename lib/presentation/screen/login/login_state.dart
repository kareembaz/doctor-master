part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}


class CodeSent extends LoginState {}


class CodeAutoRetrievalTimeout extends LoginState {}

class Animate extends LoginState {}
