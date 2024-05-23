import "package:image_picker/image_picker.dart";
import "package:teslo_shop/features/shared/infrastructure/services/camera_gallery_service.dart";

class CameraGalleryServiceImpl extends CameraGalleryService {
  final ImagePicker _picker = ImagePicker();

  @override
  Future<String?> takePhoto() async {
    // Capture a photo.
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 100,
      preferredCameraDevice: CameraDevice.rear
    );

    if (photo == null) return null;

    // print("Tenemos una imagen ${photo.path}");

    return photo.path;
  }

  @override
  Future<String?> selectPhoto() async {
    // Pick an image.
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );

    if (photo == null) return null;

    // print("Tenemos una imagen ${photo.path}");

    return photo.path;
  }
  
  // @override
  // Future<String?> takeVideo() async {
  //   // Capture a video.
  //   final XFile? video = await _picker.pickVideo(
  //     source: ImageSource.camera,
  //     preferredCameraDevice: CameraDevice.rear,
  //   );

  //   if (video == null) return null;

  //   // print("Tenemos un video ${video.path}");

  //   return video.path;
  // }
  
  // @override
  // Future<String?> selectVideo() async {
  //   // Capture a video.
  //   final XFile? video = await _picker.pickVideo(
  //     source: ImageSource.gallery,
  //   );

  //   if (video == null) return null;

  //   // print("Tenemos un video ${video.path}");

  //   return video.path;
  // }
}