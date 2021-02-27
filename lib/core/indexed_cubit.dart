part of 'core.dart';

abstract class IndexedCubit extends Cubit<int> {
  IndexedCubit() : super(0);

  void changeIndex(int index);
}
