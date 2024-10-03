import 'package:image_picker/image_picker.dart';
import '../config/app_common_functions.dart';

class ImagePickerUtils{

  final ImagePicker _picker=ImagePicker();

  Future<XFile?> cameraCapture() async{
    final XFile? file= await _picker.pickImage(source: ImageSource.camera);
    return file;
  }


  Future<XFile?> pickImageFromGallery() async{
    final XFile? file= await _picker.pickImage(source: ImageSource.gallery);
    customLog(file!.path.toString());
    return file;
  }
}