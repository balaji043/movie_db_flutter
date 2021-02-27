import 'package:bloc/bloc.dart';

class HomeRouteCubit extends Cubit<int> {
  HomeRouteCubit() : super(0);

  void changeIndex(int index) => emit(index);
}
