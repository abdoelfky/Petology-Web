import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'services_view_model_state.dart';

class ServicesViewModelCubit extends Cubit<ServicesViewModelState> {
  ServicesViewModelCubit() : super(ServicesViewModelInitial());
}
