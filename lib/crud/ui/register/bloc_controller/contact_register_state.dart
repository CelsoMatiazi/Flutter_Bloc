

part of 'contact_register_bloc.dart';

abstract class ContactRegisterState{
  final String? message;
  ContactRegisterState({
    this.message
  });

}

class ContactRegisterStateInitial extends ContactRegisterState{
  ContactRegisterStateInitial() : super();
}

class ContactRegisterStateLoading extends ContactRegisterState{
  ContactRegisterStateLoading() : super();
}

class ContactRegisterStateSuccess extends ContactRegisterState{
  ContactRegisterStateSuccess() : super();
}

class ContactRegisterStateError extends ContactRegisterState{
  ContactRegisterStateError({required String message}) : super(message: message);
}