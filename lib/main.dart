import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'UI/imagebloc_screen.dart';
import 'Utils/imagePicker_Utils.dart';
import 'bloc/counter/counter_bloc.dart';
import 'bloc/image_bloc/image_bloc.dart';
import 'bloc/switch/switch_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(
          create: (_) => ImageBloc(imagePickerUtils: ImagepickerUtils()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ImageblocScreen(),
      ),
    );
  }
}
