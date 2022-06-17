import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Bloc"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Card(
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed("/basic_bloc_options");
                },
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.phonelink_setup_outlined, size: 50,),
                      SizedBox(height: 10,),
                      Text("Basic Example \nCounter", textAlign: TextAlign.center,)
                    ],
                  ),
                ),
              ),
            ),


            Card(
              child: GestureDetector(
                onTap: (){
                  Navigator.of(context).pushNamed("/contact_list_page");
                },
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.person_add_alt_rounded, size: 50,),
                      SizedBox(height: 10,),
                      Text("Example\nContact List\nCRUD", textAlign: TextAlign.center,)
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

