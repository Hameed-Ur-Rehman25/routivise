import 'package:flutter/material.dart';
import '../../domain/models/energy.dart';

class EnergyProvider extends ChangeNotifier {
  Energy? _currentEnergy;
  List<Energy> _energyHistory = [];
  bool _isLoading = false;

  Energy? get currentEnergy => _currentEnergy;
  List<Energy> get energyHistory => _energyHistory;
  bool get isLoading => _isLoading;

  // Simulate fetching current energy level from backend
  Future<void> fetchCurrentEnergy(String userId) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 800));
    
    // Mock data - in real app would come from repository
    _currentEnergy = Energy(
      percentage: 70,
      timestamp: DateTime.now(),
      userId: userId,
      id: 'energy-1',
    );
    
    _isLoading = false;
    notifyListeners();
  }

  // Simulate fetching energy history from backend
  Future<void> fetchEnergyHistory(String userId) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 800));
    
    // Mock data - in real app would come from repository
    final now = DateTime.now();
    _energyHistory = [
      Energy(percentage: 70, timestamp: now.subtract(const Duration(hours: 1)), userId: userId, id: 'energy-1'),
      Energy(percentage: 10, timestamp: now.subtract(const Duration(hours: 3)), userId: userId, id: 'energy-2'),
      Energy(percentage: 90, timestamp: now.subtract(const Duration(hours: 5)), userId: userId, id: 'energy-3'),
    ];
    
    _isLoading = false;
    notifyListeners();
  }

  // Log a new energy level
  Future<void> logEnergy(int percentage, String userId) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API delay
    await Future.delayed(const Duration(milliseconds: 800));
    
    // Create new energy entry
    final newEnergy = Energy(
      percentage: percentage,
      timestamp: DateTime.now(),
      userId: userId,
      id: 'energy-${DateTime.now().millisecondsSinceEpoch}',
    );
    
    // In a real app, you would send this to your backend
    
    // Update local state
    _currentEnergy = newEnergy;
    _energyHistory.insert(0, newEnergy);
    
    _isLoading = false;
    notifyListeners();
  }
}
