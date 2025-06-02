import 'package:flutter/material.dart';
import 'package:routivise/app/theme.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  // Workout Preferences
  String workoutType = 'Exercise';
  String workoutDuration = '11:00 am';
  String intensityLevel = '11:00 am';

  // Meal Preferences
  bool isHalal = false;
  bool isLactoseFree = true;
  bool isVegan = true;
  bool isGlutenFree = true;
  bool isVegetarian = true;
  bool hasNutAllergies = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button and title
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 8),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Text(
                      'Preferences',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Logo and text
                    Center(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Image.asset(
                            'assets/images/preferences_screen_logo.png',
                            height: 100,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Your Preferences will guidance on how YOU want to\ntake this journey!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),

                    // Workout Type
                    buildDropdownField(
                      label: 'Workout type:',
                      value: workoutType,
                      items: ['Exercise', 'Yoga', 'Cardio', 'Strength Training'],
                    ),
                    const SizedBox(height: 15),

                    // Workout Duration
                    buildDropdownField(
                      label: 'Workout Duration:',
                      value: workoutDuration,
                      items: ['11:00 am', '12:00 pm', '1:00 pm', '2:00 pm', '3:00 pm'],
                    ),
                    const SizedBox(height: 15),

                    // Intensity Level
                    buildDropdownField(
                      label: 'Intensity level:',
                      value: intensityLevel,
                      items: ['11:00 am', '12:00 pm', '1:00 pm', '2:00 pm', '3:00 pm'],
                    ),
                    const SizedBox(height: 24),

                    // Meal Preferences
                    const Text(
                      'Meal Preferences',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
             

                    // Dietary Preferences Grid
                    Wrap(
                      spacing: 16,
                      runSpacing: 5,
                      children: [
                        buildCheckboxItem('Halal', isHalal),
                        buildCheckboxItem('Lactose-free', isLactoseFree),
                        buildCheckboxItem('Vegan', isVegan),
                        buildCheckboxItem('Gluten-free', isGlutenFree),
                        buildCheckboxItem('Vegetarian', isVegetarian),
                        buildCheckboxItem('Nut Allergies', hasNutAllergies),
                      ],
                    ),

                    const SizedBox(height: 40),

                    // Change Preferences Button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: Save preferences
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1999F9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Change Preferences',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDropdownField({
    required String label,
    required String value,
    required List<String> items,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1999F9),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: const Color(0xFFE8E8E8),
                width: 1,
              ),
            ),
            child: DropdownButtonFormField<String>(
              value: value,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                border: InputBorder.none,
                isDense: true,
              ),
              items: items.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {});
                }
              },
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black87,
              ),
              isExpanded: true,
              dropdownColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCheckboxItem(String label, bool value) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - 56) / 2,
      child: Row(
        children: [
          Transform.scale(
            scale: 1.2,
            child: Checkbox(
              value: value,
              onChanged: (bool? newValue) {
                setState(() {
                  switch (label) {
                    case 'Halal':
                      isHalal = newValue!;
                      break;
                    case 'Lactose-free':
                      isLactoseFree = newValue!;
                      break;
                    case 'Vegan':
                      isVegan = newValue!;
                      break;
                    case 'Gluten-free':
                      isGlutenFree = newValue!;
                      break;
                    case 'Vegetarian':
                      isVegetarian = newValue!;
                      break;
                    case 'Nut Allergies':
                      hasNutAllergies = newValue!;
                      break;
                  }
                });
              },
              activeColor: const Color(0xFF1999F9),
              checkColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              side: BorderSide(
                color: value ? const Color(0xFF1999F9) : Colors.grey.shade400,
                width: 1.5,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontWeight: value ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
