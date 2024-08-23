import 'package:bloc_ecom_app/utils/themes/image_picker_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'image_picker_event.dart';
import 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {

  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraCapture>(cameraCapture);
    on<GalleryImagePicker>(galleryPicker);

  }

  void cameraCapture(CameraCapture  event, Emitter<ImagePickerState> emit) async{
    XFile? file=await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file:file));
  }

    void galleryPicker(GalleryImagePicker  event, Emitter<ImagePickerState> emit) async{
    XFile? file=await imagePickerUtils.pickImageFromGallery();
    emit(state.copyWith(file:file));
  }


}
