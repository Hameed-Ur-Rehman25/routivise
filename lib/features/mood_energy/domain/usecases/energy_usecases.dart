import '../models/energy.dart';
import '../repositories/energy_repository.dart';

class GetCurrentEnergy {
  final EnergyRepository repository;

  GetCurrentEnergy(this.repository);

  Future<Energy> call(String userId) {
    return repository.getCurrentEnergy(userId);
  }
}

class LogEnergy {
  final EnergyRepository repository;

  LogEnergy(this.repository);

  Future<Energy> call(Energy energy) {
    return repository.createEnergyEntry(energy);
  }
}

class GetEnergyHistory {
  final EnergyRepository repository;

  GetEnergyHistory(this.repository);

  Future<List<Energy>> call(String userId) {
    return repository.getEnergyListForUser(userId);
  }
}
