import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../Utils/imagePicker_Utils.dart';
import 'image_event.dart';
import 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  final ImagepickerUtils imagePickerUtils;

  ImageBloc({required this.imagePickerUtils}) : super(const ImageState()) {
    on<CameraCapture>(_cameraCapture);
    on<GalleryPicker>(_galleryPicker);
  }

  void _cameraCapture(CameraCapture event, Emitter<ImageState> emit) async {
    final XFile? image = await imagePickerUtils.getImageFromCamera();
    if (image != null) {
      emit(state.copyWith(file: image));
    }
  }

  void _galleryPicker(GalleryPicker event, Emitter<ImageState> emit) async {
    final XFile? image = await imagePickerUtils.getImageFromGallery();
    if (image != null) {
      emit(state.copyWith(file: image));
    }
  }
}
