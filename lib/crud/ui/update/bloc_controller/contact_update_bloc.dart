
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_study/crud/models/contact_model.dart';
import 'package:flutter_bloc_study/crud/repositories/contact_repository.dart';
part 'contact_update_event.dart';
part 'contact_update_state.dart';

class ContactUpdateBloc extends Bloc<ContactUpdateEvent, ContactUpdateState>{
  final ContactRepository _repository;

  ContactUpdateBloc({required ContactRepository repository })
    :    _repository = repository,
        super(ContactUpdateStateInitial()){
          on<ContactUpdateEventSave>(_save);
  }


  Future<void> _save(
      ContactUpdateEventSave event,
      Emitter<ContactUpdateState> emit) async {
    try{
      emit(ContactUpdateStateLoading());
      await Future.delayed(const Duration(seconds: 2));
      //throw Exception();
      await  _repository.update(event.contact);
      emit(ContactUpdateStateSuccess());
    }catch (e, s){
      log("erro ao atualizar contato", error: e, stackTrace: s );
      emit(ContactUpdateStateError(message: "Erro ao atualizar contato"));
    }

  }

}