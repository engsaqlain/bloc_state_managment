import 'package:equatable/equatable.dart';

abstract class ImageEvent extends Equatable{
  ImageEvent();
  @override
  List<Object> get props => [];
}
class CameraCapture extends ImageEvent{

}
class GalleryPicker extends ImageEvent{

}