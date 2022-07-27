import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:meta/meta.dart';
import 'package:orange/models/services_model.dart';

import '../../reposoteries/constants/end_point.dart';
import '../../reposoteries/network/remote/dio_helper.dart';

part 'services_view_model_state.dart';

class ServicesViewModelCubit extends Cubit<ServicesViewModelState> {
  ServicesViewModelCubit() : super(ServicesViewModelInitial());

  static ServicesViewModelCubit get(context) => BlocProvider.of(context);

  List<String> categories = ['Dogs', 'Cats'];
  String selectedCategory = 'Dogs';

  late ServicesModel servicesModel;


  void postServices({
    required String imageBase64,
    required String categoryId,
    required String location,
    required String phoneNumber,

  }) {
    emit(RequestLoadingState());
    DioHelper.postData(
      url: SERVICES,
      data: {
        'imageBase64': imageBase64,
        'categoryId': categoryId,
        'location': location,
        'phoneNumber': phoneNumber,

      },
    ).then((value) {
      print(value.data);
      servicesModel = ServicesModel.fromJson(value.data);

      emit(RequestSuccessState(servicesModel));
    }).catchError((error) {
      print(error.toString());
      emit(RequestErrorState(error.toString()));
    });
  }


  // bool imageAvailable=false;
  // late Uint8List imageFile;
  //
  // Future<void> imagePicker()async{
  //
  //   final image  = await ImagePickerWeb.getImageAsBytes();
  //   imageFile=image!;
  //   imageAvailable=true;
  //
  //
  //   emit(HomeViewModelChangeScreenState());
  //
  // }
}
