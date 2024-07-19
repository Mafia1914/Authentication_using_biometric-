import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/colors.dart';


class ProductCard extends StatelessWidget {
  final String? imageUrl;
  final String title;
  // final double price;
  final String price;
  final Function() onPressed;

  const ProductCard({
    super.key,
    this.imageUrl,
    required this.title,
    required this.price,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(color: Colors.grey, width: 1), // Light border
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8.0,
            spreadRadius: 1.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ClipRRect(
          //   borderRadius: const BorderRadius.vertical(top: Radius.circular(30.0)),
          //   child: Image.network(
          //     ,
          //     height: 90,
          //     width: double.infinity,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: XColors.xBlack.shade900,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              // '\$${price.toStringAsFixed(2)}',
              price,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: 10,
                color: XColors.xPink[650],
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //   child: ElevatedButton(
          //     onPressed: onPressed,
          //     child: Text('Add to Cart'),
          //     style: ElevatedButton.styleFrom(
          //       primary: XColors.xPink[650],
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(12),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
