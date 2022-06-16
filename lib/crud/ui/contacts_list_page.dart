import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_study/crud/models/contact_model.dart';
import 'package:flutter_bloc_study/crud/ui/contact_list/bloc_controller/contact_list_state.dart';
import 'package:flutter_bloc_study/crud/ui/contact_list/bloc_controller/contact_list_event.dart';
import 'package:flutter_bloc_study/crud/ui/widgets/loader.dart';
import 'contact_list/bloc_controller/contact_list_bloc.dart';


class ContactListPage extends StatelessWidget {
  const ContactListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, "/contact/register");
          context.read<ContactListBloc>().add(ContactListEventFindAll());
        },
        child: const Icon(Icons.add),
      ),

      appBar: AppBar(
        title: const Text("Contact List"),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child: BlocListener<ContactListBloc, ContactListState>(
          listenWhen: (previous, current){
            if(current is ContactListStateError) return true;
            return false;
          },
          listener: (context, state){
            if(state is ContactListStateError){
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(
                      content: Text("${state.message}"),
                      backgroundColor: Colors.red,
                )
              );
            }
          },
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: SizedBox(
              height: double.maxFinite,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [

                  Loader<ContactListBloc, ContactListState>(
                      selector: (state){
                        if(state is ContactListStateLoading) return true;
                        return false;
                      }
                  ),

                  BlocSelector<ContactListBloc, ContactListState, List<ContactModel>>(
                      selector: (state) {
                       return state.contacts ?? [];
                      },
                      builder: (_, contacts) {
                       return RefreshIndicator(
                         onRefresh: () async {
                           context.read<ContactListBloc>().add(ContactListEventFindAll());
                         },
                         child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            final contact = contacts[index];
                            return Dismissible(
                              key: Key("${contact.id}"),
                              background: Container(
                                padding: const EdgeInsets.only(right: 20),
                                alignment: Alignment.centerRight,
                                color: Colors.red,
                                child: const Icon(
                                  Icons.restore_from_trash_outlined,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                              onDismissed: (direction){
                                context.read<ContactListBloc>()
                                    .add(ContactListEventRemove(contact: contact));
                              },
                              child: Card(
                                child: ListTile(
                                  leading: const Icon(
                                    Icons.account_circle,
                                    size: 45,
                                  ),
                                  onTap: () => Navigator.pushNamed(context, "/contact/update"),
                                  title: Text(contact.name),
                                  subtitle: Text(contact.email),
                                ),
                              ),
                            );
                          },
                         ),
                       );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
