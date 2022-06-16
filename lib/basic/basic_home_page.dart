import 'package:flutter/material.dart';

class BasicHomePage extends StatelessWidget {
  const BasicHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic Bloc"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
              Navigator.of(context).pushNamed("/basic_bloc");
            },
                child: Text("BLOCK",
                  style: Theme.of(context).textTheme.headline6,
                )
            ),
            TextButton(onPressed: (){
              Navigator.of(context).pushNamed("/basic_cubit");
            },
                child: Text("CUBIT",
                  style: Theme.of(context).textTheme.headline6,
                )
            ),
          ],
        ),
      ),
    );
  }
}
