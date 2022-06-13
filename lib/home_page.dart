import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Options"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
              Navigator.of(context).pushNamed("/bloc");
            },
                child: Text("BLOCK",
                  style: Theme.of(context).textTheme.headline6,
                )
            ),
            TextButton(onPressed: (){},
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
