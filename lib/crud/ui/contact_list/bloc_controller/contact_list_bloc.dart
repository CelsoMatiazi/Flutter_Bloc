import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_study/crud/models/contact_model.dart';
import 'package:flutter_bloc_study/crud/repositories/contact_repository.dart';
import 'contact_list_state.dart';
import 'contact_list_event.dart';

class ContactListBloc extends Bloc<ContactListEvent, ContactListState>{

  final ContactRepository _repository;

  ContactListBloc({
    required ContactRepository repository
  }): _repository = repository,
        super(ContactListStateInitial()){
          on<ContactListEventFindAll>(_findAll);
          on<ContactListEventRemove>(_remove);
  }

 Future<void> _findAll(
     ContactListEventFindAll event,
     Emitter<ContactListState> emit) async {
    try{
      emit(ContactListStateLoading());
      final contacts = await  _repository.findAll();
      //throw Exception();
      emit(ContactListStateData(contacts: contacts));
    }catch (e, s){
      log("Erro ao buscar contatos", error: e, stackTrace: s);
      emit(ContactListStateError(message: "Erro ou buscar"));
    }
  }


  Future<void> _remove(
      ContactListEventRemove event,
      Emitter<ContactListState> emit
      ) async {
        try{
          emit(ContactListStateLoading());
          await _repository.delete(event.contact);
          add(ContactListEventFindAll());
        }catch(e, s){
          log("Erro ao buscar contatos", error: e, stackTrace: s);
          emit(ContactListStateError(message: "Erro ou deletar contato"));
        }
  }

}