import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Simulate loading for 3 seconds
    Timer(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shimmer Effect"),
      ),
      body: isLoading ? _buildShimmerEffect() : _buildProducts(),
    );
  }

  // Shimmer effect for loading state
  Widget _buildShimmerEffect() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: _buildShimmerItem(),
        );
      },
    );
  }

  // Product list when loading is complete
  Widget _buildProducts() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const ListTile(
          leading: Icon(Icons.shopping_cart),
          title: Text("Product Name"),
          subtitle: Text("Product Description"),
        );
      },
    );
  }

  // Single shimmer loading item
  Widget _buildShimmerItem() {
    return ListTile(
      leading: _buildShimmerBox(width: 48, height: 48),
      title: _buildShimmerBox(width: double.infinity, height: 10),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildShimmerBox(
              width: double.infinity,
              height: 48,
              margin: const EdgeInsets.only(top: 5)),
          _buildShimmerBox(
              width: double.infinity,
              height: 48,
              margin: const EdgeInsets.only(top: 5)),
        ],
      ),
    );
  }

  // Shimmer box widget to avoid repetition
  Widget _buildShimmerBox(
      {required double width, required double height, EdgeInsets? margin}) {
    return Container(
      width: width,
      height: height,
      color: Colors.white,
      margin: margin,
    );
  }
}
