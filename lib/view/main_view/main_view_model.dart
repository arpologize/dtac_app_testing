import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../models/persons_model.dart';
import '../../repositories/main_repository.dart';

class MainViewModel extends StateNotifier<AsyncValue<Persons>> {
  final Ref ref;

  MainViewModel(this.ref) : super(AsyncData(Persons())) {
    getPersons();
  }

  Future<void> getPersons() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => MainRepository(ref: ref).getPersons());
  }
}

final mainViewModelProvider =
    StateNotifierProvider<MainViewModel, AsyncValue<Persons>>(
        (ref) => MainViewModel(ref));
