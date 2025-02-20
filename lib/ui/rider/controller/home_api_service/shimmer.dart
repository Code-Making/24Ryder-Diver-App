import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:rideapp/ui/pages/utils/extension.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          3, (index) => _buildShimmerCard()), // Show 3 shimmer cards
    );
  }

  Widget _buildShimmerCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(radius: 24, backgroundColor: Colors.white),
                  12.toW,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(height: 16, width: 100, color: Colors.white),
                        4.toh,
                        Container(height: 12, width: 60, color: Colors.white),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(height: 16, width: 40, color: Colors.white),
                      4.toh,
                      Container(height: 12, width: 60, color: Colors.white),
                    ],
                  ),
                ],
              ),
              12.toh,
              const Divider(),
              Column(
                children: [
                  Container(
                      height: 16, width: double.infinity, color: Colors.white),
                  8.toh,
                  Container(
                      height: 16, width: double.infinity, color: Colors.white),
                ],
              ),
              20.toh,
              Row(
                children: [
                  Expanded(
                    child: Container(height: 40, color: Colors.white),
                  ),
                  20.toW,
                  Expanded(
                    child: Container(height: 40, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
