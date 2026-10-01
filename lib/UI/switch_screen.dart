import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/switch/switch_bloc.dart';
import '../bloc/switch/switch_event.dart';
import '../bloc/switch/switch_state.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Notification',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                BlocBuilder<SwitchBloc, SwitchState>(
                  buildWhen: (previous, current) =>
                      previous.isSwitched != current.isSwitched,
                  builder: (context, state) {
                    return Switch(
                      value: state.isSwitched,
                      onChanged: (newValue) {
                        context.read<SwitchBloc>().add(EnableAndDisableSwitch());
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) =>
                  previous.sliderValue != current.sliderValue,
              builder: (context, state) {
                return Container(
                  height: 300,
                  width: 300,
                  color: Colors.red.withValues(alpha: state.sliderValue),
                );
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) =>
                  previous.sliderValue != current.sliderValue,
              builder: (context, state) {
                return Slider(
                  value: state.sliderValue,
                  onChanged: (newValue) {
                    context.read<SwitchBloc>().add(SliderEvent(slider: newValue));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
