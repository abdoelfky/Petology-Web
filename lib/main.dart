import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orange/reposoteries/constants/constants.dart';
import 'package:orange/reposoteries/network/remote/dio_helper.dart';
import 'package:orange/view_models/home_view_model_cubit/home_view_model.dart';
import 'package:orange/view_models/login_view_model_cubit/login_cubit.dart';
import 'package:orange/view_models/register_view_model_cubit/cubit.dart';
import 'package:orange/view_models/request_view_model/request_view_model_cubit.dart';
import 'package:orange/views/home_view.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:orange/reposoteries/network/local/cache_helper.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
   DioHelper.init();
   await CacheHelper.init();
  if(Platform.isWindows)
    await DesktopWindow.setMinWindowSize(Size(1300.0,1200.0));

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


      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: ScreenTypeLayout(
            mobile: HomeView(),
          desktop:Builder(

            builder: (context) {
              return HomeView();
            },

          ) ,
          breakpoints: ScreenBreakpoints(desktop:700,tablet: 400,watch: 100),

        ),
      ),
    );
  }
}

