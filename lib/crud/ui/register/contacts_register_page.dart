import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_study/crud/ui/register/bloc_controller/contact_register_bloc.dart';
import 'package:flutter_bloc_study/crud/ui/widgets/loader.dart';


class ContactRegister extends StatefulWidget {
  const ContactRegister({Key? key}) : super(key: key);

  @override
  State<ContactRegister> createState() => _ContactRegisterState();
}

class _ContactRegisterState extends State<ContactRegister> {

  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();


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
        title: const Text("Contact Register"),
      ),
      body: BlocListener<ContactRegisterBloc, ContactRegisterState>(
        listener: (context, state){
          if(state is ContactRegisterStateSuccess){
            Navigator.pop(context);
          }
          if(state is ContactRegisterStateError){
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

                Loader<ContactRegisterBloc, ContactRegisterState>(
                  selector: (state){
                    if(state is ContactRegisterStateLoading) return true;
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
                          context.read<ContactRegisterBloc>().add(ContactRegisterEventSave(
                              name: _nameCtrl.text,
                              email: _emailCtrl.text
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
