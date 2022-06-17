

part of 'contact_update_bloc.dart';

abstract class ContactUpdateState{
  final String? message;
  ContactUpdateState({this.message});
}

class ContactUpdateStateInitial extends ContactUpdateState{}

class ContactUpdateStateLoading extends ContactUpdateState{}
class ContactUpdateStateError extends ContactUpdateState{
  ContactUpdateStateError({required String message}) : super(message: message);
}
class ContactUpdateStateSuccess extends ContactUpdateState{}