import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_shop_app/common/widgets/choice_chip.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_price_text.dart';
import 'package:quick_shop_app/common/widgets/products/product_cards/product_title_text.dart';
import 'package:quick_shop_app/common/widgets/rounded_container.dart';
import 'package:quick_shop_app/common/widgets/section_heading.dart';
import 'package:quick_shop_app/features/shop/controllers/product/variation_controller.dart';
import 'package:quick_shop_app/features/shop/models/product_model.dart';
import 'package:quick_shop_app/utils/constants/colors.dart';
import 'package:quick_shop_app/utils/constants/sizes.dart';
import 'package:quick_shop_app/utils/helpers/helper_functions.dart';

class CustomProductAttribute extends StatelessWidget {
  const CustomProductAttribute({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Obx(
      () => Column(
        children: [
          if (controller.selectedVariation.value.id.isNotEmpty)
          CustomRoundedContainer(
            padding: const EdgeInsets.all(CustomSizes.md),
            backgroundColor: dark ? CustomColors.darkerGrey : CustomColors.grey,
            child: Column(
              children: [
                Row(
                  children: [
                    // Title
                    const CustomSectionHeading(title: 'Variations', showActionButton: false),
                    const SizedBox(width: CustomSizes.spaceBtwItems),
      
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CustomProductTitleText(title: 'Price : ', smallSize: true),
                            const SizedBox(width: CustomSizes.spaceBtwItems),
      
                            // Actual Price
                            if (controller.selectedVariation.value.salePrice > 0)
                            Text(
                              '\$ ${controller.selectedVariation.value.price}',
                              style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
                            ),
                            const SizedBox(width: CustomSizes.spaceBtwItems),
                        
                            // Sale Price
                            CustomProductPriceText(price: controller.getVariationPrice()),
                          ],
                        ),
                        // Stock
                        Row(
                          children: [
                            const CustomProductTitleText(title: 'Stock : ', smallSize: true),
                            Text(controller.variationStockStatus.value, style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ],
                    ),               
                  ],
                ),
                // Variations Description
                CustomProductTitleText(
                  title: controller.selectedVariation.value.description ?? '',
                  smallSize: true,
                  maxLines: 4,
                ),
              ],
            ),
          ),
          const SizedBox(height: CustomSizes.spaceBtwItems),
      
          // Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!.map((attribute) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomSectionHeading(title: attribute.name ?? '', showActionButton: false),
                const SizedBox(height: CustomSizes.spaceBtwItems / 2,),
                Obx(() => Wrap(
                    spacing: CustomSizes.spaceBtwItems / 2,
                    children: attribute.values!.map((attributeValue) {
                      final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                      final availableValues = controller
                        .getAttributesAvailabilityInVariation(product.productVariations!, attribute.name!, Map<String, dynamic>.from(controller.selectedAttributes));
                      final available = availableValues.contains(attributeValue);
      
                      return CustomChoiceChip(
                        text: attributeValue, 
                        isSelected: isSelected, 
                        onSelected: available 
                          ? (selected) {
                            if (selected && available) {
                              controller.onAttributeSelected(product, attribute.name ?? '', attributeValue);
                            } else {
                              controller.resetSelectedAttribues();
                            }
                          } : null);
                      }).toList()),
                )
              ],
            )).toList(),
          )
        ],
      ),
    );
  }
}

