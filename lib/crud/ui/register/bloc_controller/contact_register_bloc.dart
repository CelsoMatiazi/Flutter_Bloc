
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_study/crud/models/contact_model.dart';
import 'package:flutter_bloc_study/crud/repositories/contact_repository.dart';
part 'contact_register_state.dart';
part 'contact_register_event.dart';

class ContactRegisterBloc extends Bloc<ContactRegisterEvent, ContactRegisterState>{

  final ContactRepository _repository;

  ContactRegisterBloc({
    required ContactRepository repository
}) : _repository = repository,
    super(ContactRegisterStateInitial()) {
      on<ContactRegisterEventSave>(_save);
    }

  Future<void> _save(
      ContactRegisterEventSave event,
       Emitter<ContactRegisterState> emit) async {
    try{
      emit(ContactRegisterStateLoading());
      await Future.delayed(const Duration(seconds: 2));
      final contactModel = ContactModel(
          id: DateTime.now().toString(),
          name: event.name,
          email: event.email
      );
      //throw Exception();
      await  _repository.create(contactModel);
      emit(ContactRegisterStateSuccess());
    }catch (e, s){
      log("erro ao salvar contato", error: e, stackTrace: s );
      emit(ContactRegisterStateError(message: "Erro ao salvar contato"));
    }

  }

}