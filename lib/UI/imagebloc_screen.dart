import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/image_bloc/image_bloc.dart';
import '../bloc/image_bloc/image_event.dart';
import '../bloc/image_bloc/image_state.dart';

class ImageblocScreen extends StatefulWidget {
  const ImageblocScreen({super.key});

  @override
  State<ImageblocScreen> createState() => _ImageblocScreenState();
}

class _ImageblocScreenState extends State<ImageblocScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker using BLoC"),
        centerTitle: true,
      ),
      body: Center(
        child: BlocBuilder<ImageBloc, ImageState>(
          builder: (context, state) {
            if (state.file == null) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      context.read<ImageBloc>().add(CameraCapture());
                    },
                    child: const CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.camera_alt, size: 30),
                    ),
                  ),
                  const SizedBox(width: 20),
                  InkWell(
                    onTap: () {
                      context.read<ImageBloc>().add(GalleryPicker());
                    },
                    child: const CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.photo_library, size: 30),
                    ),
                  ),
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.file(
                    File(state.file!.path),
                    height: 300,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          context.read<ImageBloc>().add(CameraCapture());
                        },
                        icon: const Icon(Icons.camera_alt),
                        label: const Text('Camera'),
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton.icon(
                        onPressed: () {
                          context.read<ImageBloc>().add(GalleryPicker());
                        },
                        icon: const Icon(Icons.photo_library),
                        label: const Text('Gallery'),
                      ),
                    ],
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
