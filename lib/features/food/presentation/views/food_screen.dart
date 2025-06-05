import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../viewmodels/meal_viewmodel.dart';
import '../widgets/meal_card.dart';

class FoodScreen extends StatefulWidget {
  final bool showNavBar;

  const FoodScreen({super.key, this.showNavBar = true});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  // Variable to track filter states
  bool _caloriesFilterSelected = false;
  bool _prepTimeFilterSelected = false;
  bool _ingredientsFilterSelected = false;

  @override
  void initState() {
    super.initState();
    // Initialize with breakfast meals
    Future.microtask(
      () => context.read<MealViewModel>().fetchMealsByType('breakfast'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Meal Planner',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                _buildMealTypeButtons(),
                const SizedBox(height: 20),
                _buildGenerateButton(),
                const SizedBox(height: 20),
                _buildMealListHeader(),
                const SizedBox(height: 10),
              ],
            ),
          ),
          Expanded(child: _buildMealsList()),
        ],
      ),
    );
  }

  Widget _buildMealTypeButtons() {
    final viewModel = Provider.of<MealViewModel>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildMealTypeButton(
            icon: SvgPicture.asset(
              'assets/svg images/breakfast.svg',
              height: 24,
              colorFilter: ColorFilter.mode(
                viewModel.selectedMealType == 'breakfast'
                    ? Colors.white
                    : Colors.black54,
                BlendMode.srcIn,
              ),
            ),
            label: 'Breakfast',
            isSelected: viewModel.selectedMealType == 'breakfast',
            onTap: () => viewModel.fetchMealsByType('breakfast'),
          ),
          const SizedBox(width: 12),
          _buildMealTypeButton(
            icon: SvgPicture.asset(
              'assets/svg images/lunch.svg',
              height: 24,
              colorFilter: ColorFilter.mode(
                viewModel.selectedMealType == 'lunch'
                    ? Colors.white
                    : Colors.black54,
                BlendMode.srcIn,
              ),
            ),
            label: 'Lunch',
            isSelected: viewModel.selectedMealType == 'lunch',
            onTap: () => viewModel.fetchMealsByType('lunch'),
          ),
          const SizedBox(width: 12),
          _buildMealTypeButton(
            icon: SvgPicture.asset(
              'assets/svg images/Dinner.svg',
              height: 24,
              colorFilter: ColorFilter.mode(
                viewModel.selectedMealType == 'dinner'
                    ? Colors.white
                    : Colors.black54,
                BlendMode.srcIn,
              ),
            ),
            label: 'Dinner',
            isSelected: viewModel.selectedMealType == 'dinner',
            onTap: () => viewModel.fetchMealsByType('dinner'),
          ),
          const SizedBox(width: 12),
          _buildMealTypeButton(
            icon: SvgPicture.asset(
              'assets/svg images/snacks.svg',
              height: 24,
              colorFilter: ColorFilter.mode(
                viewModel.selectedMealType == 'snacks'
                    ? Colors.white
                    : Colors.black54,
                BlendMode.srcIn,
              ),
            ),
            label: 'Snacks',
            isSelected: viewModel.selectedMealType == 'snacks',
            onTap: () => viewModel.fetchMealsByType('snacks'),
          ),
          const SizedBox(width: 12),
          _buildMealTypeButton(
            icon: SvgPicture.asset(
              'assets/svg images/drinks.svg',
              height: 24,
              colorFilter: ColorFilter.mode(
                viewModel.selectedMealType == 'drinks'
                    ? Colors.white
                    : Colors.black54,
                BlendMode.srcIn,
              ),
            ),
            label: 'Drinks',
            isSelected: viewModel.selectedMealType == 'drinks',
            onTap: () => viewModel.fetchMealsByType('drinks'),
          ),
        ],
      ),
    );
  }

  Widget _buildMealTypeButton({
    required Widget icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFD4545) : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black87,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenerateButton() {
    return Center(
      child: ElevatedButton.icon(
        onPressed: () {
          // Handle generate meal plan action
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Generating new meal plan...')),
          );
          context.read<MealViewModel>().fetchMeals();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4A93EC),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
        icon: const Icon(Icons.refresh, color: Colors.white),
        label: const Text(
          'Generate New AI Meals',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildMealListHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Your Meal',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        OutlinedButton.icon(
          onPressed: () {
            _showFilterDialog();
          },
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black87,
            side: BorderSide(color: Colors.grey.shade300),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          icon: const Icon(Icons.tune, size: 18),
          label: const Text('Filter'),
        ),
      ],
    );
  }

  Widget _buildMealsList() {
    final viewModel = Provider.of<MealViewModel>(context);

    if (viewModel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (viewModel.error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(viewModel.error!),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed:
                  () => viewModel.fetchMealsByType(viewModel.selectedMealType),
              child: const Text('Try Again'),
            ),
          ],
        ),
      );
    }

    if (viewModel.meals.isEmpty) {
      return const Center(
        child: Text(
          'No meals available for this category.',
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: viewModel.meals.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: MealCard(meal: viewModel.meals[index]),
        );
      },
    );
  }

  void _showFilterDialog() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Filter By',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, size: 24),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        _buildFilterOption(
                          title: 'Calories',
                          isSelected: _caloriesFilterSelected,
                          onTap: () {
                            setState(() {
                              _caloriesFilterSelected =
                                  !_caloriesFilterSelected;
                            });
                          },
                        ),
                        const Divider(height: 1),
                        _buildFilterOption(
                          title: 'Preparation time',
                          isSelected: _prepTimeFilterSelected,
                          onTap: () {
                            setState(() {
                              _prepTimeFilterSelected =
                                  !_prepTimeFilterSelected;
                            });
                          },
                        ),
                        const Divider(height: 1),
                        _buildFilterOption(
                          title: 'No. of ingredients',
                          isSelected: _ingredientsFilterSelected,
                          onTap: () {
                            setState(() {
                              _ingredientsFilterSelected =
                                  !_ingredientsFilterSelected;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              _caloriesFilterSelected = false;
                              _prepTimeFilterSelected = false;
                              _ingredientsFilterSelected = false;
                            });
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            side: BorderSide(color: Colors.grey.shade300),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                            'Reset',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Apply filters
                            Navigator.pop(context);
                            // Here you would normally filter the meals based on selection
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Filters applied')),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFEC534A),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Apply',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildFilterOption({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color:
                      isSelected
                          ? const Color(0xFFEC534A)
                          : Colors.grey.shade300,
                  width: 2,
                ),
              ),
              child:
                  isSelected
                      ? const Center(
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: Color(0xFFEC534A),
                        ),
                      )
                      : null,
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                color: isSelected ? Colors.black : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
