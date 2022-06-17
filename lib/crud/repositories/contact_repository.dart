import 'package:flutter_bloc_study/crud/models/contact_model.dart';

class ContactRepository{

  List<ContactModel> contacts = [
    ContactModel(name: "Celso Ricardi", email: "celso@gmail.com", id: "0"),
    ContactModel(name: "Pat Metheny", email: "pat@gmail.com", id: "1"),
    ContactModel(name: "Paco de Lucia", email: "paco@gmail.com", id: "2"),
  ];

  Future<List<ContactModel>> findAll() async {
    await Future.delayed(const Duration(seconds: 3));
    return contacts;
  }

  Future<void> create(ContactModel contact) async {
    await Future.delayed(const Duration(seconds: 2));
    contacts.add(contact);
  }

  Future<void> update(ContactModel contactUpdate) async {
    for(int i = 0; i < contacts.length; i++){
      if(contacts[i].id == contactUpdate.id){
        contacts[i] = contactUpdate;
      }
    }
  }

  Future<void> delete(ContactModel contactDelete) async {
    contacts.remove(contactDelete);
  }

}

