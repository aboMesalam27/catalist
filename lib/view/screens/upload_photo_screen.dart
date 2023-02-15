import 'dart:io';

import 'package:catalist/view/controller/upload_photo/index_upload_photo.dart';

import '../../core/theme/colors.dart';
import '../../core/utils/app_router.dart';
import '../../shared/index_shared.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_primary_button.dart';

class UploadPhotoScreen extends StatefulWidget {
  const UploadPhotoScreen({super.key});

  @override
  _UploadPhotoScreenState createState() => _UploadPhotoScreenState();
}

class _UploadPhotoScreenState extends State<UploadPhotoScreen> {
  XFile? image;

  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r)),
            title: const Text(AppText.chooseMedia),
            content: SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.teal),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.image),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: const Text(AppText.fromGallery),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.teal),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.camera),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: const Text(AppText.fromCamera),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UploadPhotoCubit(),
      child: BlocConsumer<UploadPhotoCubit, UploadPhotoState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.white,
            appBar: customAppBar(
                isBack: false, title: AppText.uploadPhoto, context: context),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PrimaryButton(
                    text: AppText.uploadPhoto,
                    onPressed: () {
                      myAlert();
                    },
                    btnColor: AppColors.teal,
                    borderSide: const BorderSide(color: AppColors.teal),
                    textStyle: const TextStyle(color: AppColors.white),
                  ),
                  // ElevatedButton(
                  //
                  //   onPressed: () {
                  //     myAlert();
                  //   },
                  //   style: const ButtonStyle(backgroundColor: ),
                  //   child: Text('Upload Photo'),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),

                  image != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              //to show image, you type like this.
                              File(image!.path),
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                              height: 300,
                            ),
                          ),
                        )
                      : const Text(
                          AppText.noImageFound,
                          style: TextStyle(fontSize: 20),
                        ),
                  SizedBox(
                    height: 30.h,
                  ),
                  image != null
                      ? ConditionalBuilder(
                          builder: (context) {
                            return PrimaryButton(
                                width: 260.w,
                                height: 44.h,
                                textStyle:
                                    const TextStyle(color: AppColors.white),
                                borderSide: const BorderSide(
                                  color: AppColors.teal,
                                ),
                                btnColor: AppColors.teal,
                                text: AppText.next,
                                onPressed: () {
                                  if (image != null) {
                                    UploadPhotoCubit.get(context)
                                        .uploadImage(image!);
                                  }
                                });
                          },
                          condition: state is! UploadPhotoLoadingState,
                          fallback: (context) => customLoading(),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is UploadPhotoSuccessState) {
            CacheHelper.saveData(
                key: 'imagePath',
                value: state.uploadPhotoModel.data!.imagePathes![0]);
            Navigator.pushNamed(context, AppRouter.addComment);
          }
        },
      ),
    );
  }
}
