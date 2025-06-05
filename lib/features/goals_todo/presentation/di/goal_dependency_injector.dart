import 'package:provider/provider.dart';

import '../../data/datasources/goal_datasource.dart';
import '../../data/datasources/local_goal_datasource.dart';
import '../../data/repositories/goal_repository_impl.dart';
import '../../domain/repositories/goal_repository.dart';
import '../../domain/usecases/add_goal_usecase.dart';
import '../../domain/usecases/get_goals_usecase.dart';
import '../../domain/usecases/toggle_goal_status_usecase.dart';
import '../../domain/usecases/update_goal_usecase.dart';
import '../viewmodels/goal_viewmodel.dart';

class GoalDependencyInjector {
  static ChangeNotifierProvider<GoalViewModel> getProvider() {
    return ChangeNotifierProvider<GoalViewModel>(
      create:
          (context) => GoalViewModel(
            getGoalsUseCase: _provideGetGoalsUseCase(),
            addGoalUseCase: _provideAddGoalUseCase(),
            updateGoalUseCase: _provideUpdateGoalUseCase(),
            toggleGoalStatusUseCase: _provideToggleGoalStatusUseCase(),
          ),
    );
  }

  static GetGoalsUseCase _provideGetGoalsUseCase() {
    return GetGoalsUseCase(_provideGoalRepository());
  }

  static AddGoalUseCase _provideAddGoalUseCase() {
    return AddGoalUseCase(_provideGoalRepository());
  }

  static UpdateGoalUseCase _provideUpdateGoalUseCase() {
    return UpdateGoalUseCase(_provideGoalRepository());
  }

  static ToggleGoalStatusUseCase _provideToggleGoalStatusUseCase() {
    return ToggleGoalStatusUseCase(_provideGoalRepository());
  }

  static GoalRepository _provideGoalRepository() {
    return GoalRepositoryImpl(_provideGoalDataSource());
  }

  static GoalDataSource _provideGoalDataSource() {
    return LocalGoalDataSource();
  }
}
