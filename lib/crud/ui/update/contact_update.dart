import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_study/crud/models/contact_model.dart';
import 'package:flutter_bloc_study/crud/ui/update/bloc_controller/contact_update_bloc.dart';
import 'package:flutter_bloc_study/crud/ui/widgets/loader.dart';

class ContactUpdate extends StatefulWidget {
  final ContactModel contact;
  const ContactUpdate({
    Key? key,
    required this.contact
  }) : super(key: key);

  @override
  State<ContactUpdate> createState() => _ContactUpdateState();
}

class _ContactUpdateState extends State<ContactUpdate> {

  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _nameCtrl;
  late final TextEditingController _emailCtrl;

  @override
  void initState() {
    _nameCtrl = TextEditingController(text: widget.contact.name);
    _emailCtrl = TextEditingController(text: widget.contact.email);
    super.initState();
  }


  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Update"),
      ),
      body: BlocListener<ContactUpdateBloc, ContactUpdateState>(
        listener: (context, state){
          if(state is ContactUpdateStateSuccess){
            Navigator.pop(context);
          }
          if(state is ContactUpdateStateError){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("${state.message}"),
            ));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Loader<ContactUpdateBloc, ContactUpdateState>(
                  selector: (state){
                    if(state is ContactUpdateStateLoading) return true;
                    return false;
                  } ,
                ),
                TextFormField(
                  controller: _nameCtrl,
                  decoration: const InputDecoration(
                    label: Text("Nome"),
                  ),
                  validator: (String? value){
                    if(value == null || value.isEmpty){
                      return "Nome obrigatorio";
                    }
                    return null;
                  },
                ),


                TextFormField(
                  controller: _emailCtrl,
                  decoration: const InputDecoration(
                    label: Text("Email"),
                  ),
                  validator: (String? value){
                    if(value == null || value.isEmpty){
                      return "Email obrigatorio";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20,),
                SizedBox(
                  width: double.maxFinite,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: (){
                      final validate = _formKey.currentState?.validate() ?? false;

                      if(validate){
                        context.read<ContactUpdateBloc>().add(ContactUpdateEventSave(
                            contact: ContactModel(
                                id: widget.contact.id,
                                name: _nameCtrl.text,
                                email: _emailCtrl.text)
                        ));
                      }
                    },
                    child: const Text("Salvar"),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
