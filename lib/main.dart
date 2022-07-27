import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange/reposoteries/constants/constants.dart';
import 'package:orange/reposoteries/network/remote/dio_helper.dart';
import 'package:orange/view_models/adabtion_view_model/adaption_cubit.dart';
import 'package:orange/view_models/home_view_model_cubit/home_view_model.dart';
import 'package:orange/view_models/login_view_model_cubit/login_cubit.dart';
import 'package:orange/view_models/register_view_model_cubit/cubit.dart';
import 'package:orange/view_models/request_view_model/request_view_model_cubit.dart';
import 'package:orange/view_models/services_view_model/services_view_model_cubit.dart';
import 'package:orange/views/home_view.dart';
import 'package:orange/reposoteries/network/local/cache_helper.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
   DioHelper.init();
   await CacheHelper.init();



  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>HomeViewModelCubit()..changeScreen(index)),
        BlocProvider(create: (context)=>LoginCubit()),
        BlocProvider(create: (context)=>RegisterCubit()..changeScreen(index)),
        BlocProvider(create: (context)=>RequestViewModelCubit()),
        BlocProvider(create: (context)=>ServicesViewModelCubit()),
        BlocProvider(create: (context)=>AdaptionCubit()),




      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: HomeView()
      ),
    );
  }
}

