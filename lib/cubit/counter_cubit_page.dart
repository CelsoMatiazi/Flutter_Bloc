import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_study/cubit/cubit/counter_cubit.dart';
import 'package:flutter_bloc_study/cubit/cubit/counter_state.dart';

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
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state){
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
                  context.read<CounterCubit>().increment();
                },
                    icon: const Icon(
                      Icons.add_circle_outline_outlined,
                      size: 40,
                    )
                ),
                const SizedBox(width: 20,),
                IconButton(onPressed: (){
                  context.read<CounterCubit>().decrement();
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
