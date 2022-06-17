
part of 'contact_update_bloc.dart';

abstract class ContactUpdateEvent{}

class ContactUpdateEventSave extends ContactUpdateEvent{
  final ContactModel contact;
  ContactUpdateEventSave({required this.contact});
}