import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_study/basic/bloc/block/counter.bloc.dart';
import 'package:flutter_bloc_study/basic/bloc/block/counter_event.dart';
import 'package:flutter_bloc_study/basic/bloc/block/counter_state.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Bloc"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text("Counter ${state.counter}",
                  style: Theme.of(context).textTheme.headline5,
                );
              },
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){
                  context.read<CounterBloc>().add(CounterIncrement());
                },
                    icon: const Icon(
                      Icons.add_circle_outline_outlined,
                      size: 40,
                    )
                ),
                const SizedBox(width: 20,),
                IconButton(onPressed: (){
                  context.read<CounterBloc>().add(CounterDecrement());
                },
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
