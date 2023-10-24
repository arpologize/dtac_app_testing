import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  const CustomNetworkImage({
    Key? key,
    @required this.image,
    @required this.image2,
    this.placeholder = 'assets/images/image_placeholder.png',
  }) : super(key: key);
  final String? image;
  final String? image2;
  final String placeholder;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeInImage.assetNetwork(
        placeholderFit: BoxFit.cover,
        placeholder: placeholder,
        image: image ?? '',
        fit: BoxFit.cover,
        imageErrorBuilder: (ctx, bbj, str) => FadeInImage.assetNetwork(
          placeholderFit: BoxFit.cover,
          placeholder: placeholder,
          image: image2 ?? '',
          fit: BoxFit.cover,
          imageErrorBuilder: (ctx, bbj, str) => Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset(
              placeholder,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
