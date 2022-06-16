
part of 'contact_register_bloc.dart';

abstract class ContactRegisterEvent{}

class ContactRegisterEventSave extends ContactRegisterEvent{
  final String name;
  final String email;
  ContactRegisterEventSave({
    required this.name,
    required this.email,
  });
}