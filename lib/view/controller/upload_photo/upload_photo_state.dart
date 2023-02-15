import 'index_upload_photo.dart';

abstract class UploadPhotoState {}

class UploadPhotoInitialState extends UploadPhotoState {}

class UploadPhotoLoadingState extends UploadPhotoState {}

class UploadPhotoSuccessState extends UploadPhotoState {
  UploadPhotoModel uploadPhotoModel;
  UploadPhotoSuccessState({required this.uploadPhotoModel});
}
