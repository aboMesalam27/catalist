import 'package:catalist/shared/index_shared.dart';

import '../../../shared/network/remote/dio_helper.dart';
import 'index_upload_photo.dart';

class UploadPhotoCubit extends Cubit<UploadPhotoState> {
  UploadPhotoCubit() : super(UploadPhotoInitialState());
  static UploadPhotoCubit get(context) => BlocProvider.of(context);

  UploadPhotoModel? uploadPhotoModel;
  Future uploadImage(XFile file) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "inserusertcheckin":
          await MultipartFile.fromFile(file.path, filename: fileName),
    });

    emit(UploadPhotoLoadingState());

    DioHelper.postData(
      url: EndPoints.UPLOAD_PHOTO,
      data: formData,
      token: CacheHelper.getData(key: 'token'),
    ).then((value) {
      uploadPhotoModel = UploadPhotoModel.fromJson(value.data);
      emit(UploadPhotoSuccessState(uploadPhotoModel: uploadPhotoModel!));
      if (kDebugMode) {
        print(value.data);
      }
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
