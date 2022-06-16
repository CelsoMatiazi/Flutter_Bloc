

import 'package:flutter_bloc_study/crud/models/contact_model.dart';

abstract class ContactListEvent{}

class ContactListEventFindAll extends ContactListEvent{}

class ContactListEventRemove  extends ContactListEvent{
  final ContactModel contact;
  ContactListEventRemove({required this.contact});
}