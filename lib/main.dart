import 'package:flutter/material.dart';
import 'package:latihan_bloc/colors_bloc.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  ColorBloc bloc = ColorBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              bloc.eventSink.add(ColorEvents.toAmber);
            },
            backgroundColor: Colors.amber,
          ),
          const SizedBox(width: 25),
          FloatingActionButton(
            onPressed: () {
              bloc.eventSink.add(ColorEvents.toBlue);
            },
            backgroundColor: Colors.blue,
          )
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Bloc Tanpa Library'),
        centerTitle: true,
      ),
      body: Center(
        child: StreamBuilder(
            stream: bloc.stateStream,
            initialData: Colors.amber,
            builder: (context, snapshot) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                width: 100,
                height: 100,
                color: snapshot.data,
              );
            }),
      ),
    );
  }
}
