import 'package:dtac_app_testing/shared_component/custom_network_image.dart';
import 'package:flutter/material.dart';

import '../../../common/constant/constants.dart';
import '../../../config/themes/custom_colors.dart';
import '../../../config/themes/custom_text_styles.dart';
import '../../../models/persons_model.dart';

class PersonWidget extends StatelessWidget {
  const PersonWidget({
    Key? key,
    required this.person,
  }) : super(key: key);

  final Results person;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(kPaddingPage),
      color: CustomColors.primaryColor.withOpacity(0.5),
      child: Row(
        children: [
          CustomNetworkImage(
            image: person.picture?.large ?? '',
            image2: person.picture?.medium,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${person.name?.fullname}',
                  style: CustomTextStyles.subTitle1
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  'age : ${person.dob?.age} years old',
                  style: CustomTextStyles.subTitle2,
                ),
                Text(
                  'gender : ${person.gender ?? ''}',
                  style: CustomTextStyles.subTitle2,
                ),
                Text(
                  'email : ${person.email ?? ''}',
                  style: CustomTextStyles.subTitle2,
                ),
                Text(
                  'phone : ${person.phone ?? ''}',
                  style: CustomTextStyles.subTitle2,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
