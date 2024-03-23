import 'package:flutter/material.dart';
import 'package:news_app/models/source_model.dart';

class SourceWidget extends StatelessWidget {
  const SourceWidget({
    super.key,
    required this.source,
    this.isSelected = false,
  });
  final SourceModel source;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color:
            isSelected ? Theme.of(context).colorScheme.primary : Colors.white,
        border:
            Border.all(width: 2, color: Theme.of(context).colorScheme.primary),
      ),
      child: Text(
        source.name,
        style: TextStyle(
            color: isSelected
                ? Colors.white
                : Theme.of(context).colorScheme.primary,
            fontSize: 16,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
