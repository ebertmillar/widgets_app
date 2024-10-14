import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  
  static const String name ='counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int clickCOunter = ref.watch(counterProvider);
    final bool isModedark = ref.watch(isDarkmodeProvider);


    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(           
            icon: Icon(
              isModedark ? Icons.dark_mode_rounded : Icons.light_mode_rounded
            ),           
            onPressed: (){
              ref.read(isDarkmodeProvider.notifier).state = !isModedark;          
            },
          )
        ],
      ),

      body:Center(
        child: Text('valor : $clickCOunter', style: Theme.of(context).textTheme.titleLarge,),
      ),

      floatingActionButton: FloatingActionButton(
        
        onPressed: (){
          //ref.read(counterProvider.notifier).update((state) => state + 1);
          ref.read(counterProvider.notifier).state++;
        },
        child: const Icon(Icons.add),
        
      ),
    );
  }
}