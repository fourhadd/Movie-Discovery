// features/search/presentation/widgets/category_list.dart
import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

class CategoryList extends StatefulWidget {
  final List<Map<String, dynamic>> categories;
  final Map<String, dynamic>? selectedCategory;
  final ValueChanged<Map<String, dynamic>> onCategorySelected;

  const CategoryList({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  late int? _selectedId;

  @override
  void initState() {
    super.initState();
    _selectedId = widget.selectedCategory?['id'];
  }

  @override
  void didUpdateWidget(covariant CategoryList oldWidget) {
    super.didUpdateWidget(oldWidget);

    final newId = widget.selectedCategory?['id'];

    if (_selectedId != newId) {
      setState(() {
        _selectedId = newId;
      });
    }
  }

  void _onCategoryTap(Map<String, dynamic> category) {
    final id = category['id'];

    if (_selectedId == id) return;

    setState(() {
      _selectedId = id;
    });

    widget.onCategorySelected(category);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = widget.categories[index];
          final isSelected = _selectedId == category['id'];

          return RepaintBoundary(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => _onCategoryTap(category),

                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,

                borderRadius: BorderRadius.circular(20),

                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  curve: Curves.easeOut,

                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),

                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppTheme.primaryRed
                        : const Color(0xFF1C1C1E),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Text(
                    category['name'],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.white70,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
