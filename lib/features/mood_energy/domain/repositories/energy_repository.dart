import '../models/energy.dart';

abstract class EnergyRepository {
  Future<List<Energy>> getEnergyListForUser(String userId);
  Future<Energy> createEnergyEntry(Energy energy);
  Future<Energy> getCurrentEnergy(String userId);
  Future<void> updateEnergyEntry(Energy energy);
  Future<void> deleteEnergyEntry(String energyId);
}
