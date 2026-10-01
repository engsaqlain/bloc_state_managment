import 'package:image_picker/image_picker.dart';

class ImagepickerUtils {
  final ImagePicker picker = ImagePicker();

  Future<XFile?> getImageFromCamera() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    return image;
  }

  Future<XFile?> getImageFromGallery() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }
}
