import 'package:flutter/material.dart';
import 'package:quick_shop_app/common/widgets/circluar_container.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({
    super.key,
    required this.text,
    required this.isSelected,
    this.onSelected,
  });

  final String text;
  final bool isSelected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = CustomHelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text), 
        selected: isSelected, 
        onSelected: onSelected,
        labelStyle: TextStyle(color: isSelected ? CustomColors.white : null),
        avatar: isColor
          ? CustomCircularContainer(
            width: 50,
            height: 50,
            radius: 50,
            backgroundColor: CustomHelperFunctions.getColor(text)!
          )
          : null,
        shape: isColor ? const CircleBorder() : null,
        labelPadding: isColor ? const EdgeInsets.all(0) : null,
        padding: isColor ?const EdgeInsets.all(0) : null,
        // selectedColor: Colors.green,
        backgroundColor: CustomHelperFunctions.getColor(text),
      ),
    );
  }
}