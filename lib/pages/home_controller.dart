import '../repositories/times_repository.dart';
import '../models/time.dart';

class HomeController {
  late TimesRepository timesRepository;

  List<Time> get tabela => timesRepository.times;

  HomeController() {
    timesRepository = TimesRepository();
  }
}
