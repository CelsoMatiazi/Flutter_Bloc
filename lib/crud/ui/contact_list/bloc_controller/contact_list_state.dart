
import 'package:flutter_bloc_study/crud/models/contact_model.dart';

abstract class ContactListState{
  final List<ContactModel>? contacts;
  final String? message;
  final ContactModel? contact;
  ContactListState({
    this.contacts,
    this.message,
    this.contact
  });
}

class ContactListStateInitial extends ContactListState{
  ContactListStateInitial() : super(contacts: []);
}

class ContactListStateData extends ContactListState{
    ContactListStateData({
      required List<ContactModel> contacts
    }) : super(contacts: contacts,);
}


class ContactListStateRemove extends ContactListState{
  ContactListStateRemove({
    required ContactModel contact
  }) : super(contact: contact);
}

class ContactListStateError extends ContactListState{
  ContactListStateError({
    required String message}) : super(message: message);

}

class ContactListStateLoading extends ContactListState{
  ContactListStateLoading() : super();
}
