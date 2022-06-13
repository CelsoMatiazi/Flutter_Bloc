import 'package:flutter/material.dart';

class CounterCubitPage extends StatelessWidget {
  const CounterCubitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Cubit"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter 10",
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){},
                    icon: const Icon(
                      Icons.add_circle_outline_outlined,
                      size: 40,
                    )
                ),
                const SizedBox(width: 20,),
                IconButton(onPressed: (){},
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      size: 40,
                    )
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
