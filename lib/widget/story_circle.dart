import 'package:flutter/material.dart';

class StoryCircle extends StatefulWidget {
  final List<String> images;
  final double ringSize;
  final double imageSize;
  final String leftImage;

  const StoryCircle({
    super.key,
    required this.images,
    required this.leftImage,
    this.ringSize = 100,
    this.imageSize = 75,
  });

  @override
  State<StoryCircle> createState() => _StoryCircleState();
}

class _StoryCircleState extends State<StoryCircle> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: 0.25,
      initialPage: 1, // jate first animated image ta center-er dike thake
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.ringSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // SCROLLING IMAGES
          PageView.builder(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            itemCount: widget.images.length + 1, // 0 = leftImage
            itemBuilder: (context, index) {
              final bool isLeft = index == 0;

              // index 0 → leftImage, onno gula → widget.images
              final String imageUrl = isLeft
                  ? widget.leftImage
                  : widget.images[index - 1];

              // index 0 should NOT animate
              if (isLeft) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: widget.imageSize * 0.8, // ichchha korle choto rakhte paro
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                );
              }

              // index >= 1 → animation starts
              return AnimatedBuilder(
                animation: _controller,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: widget.imageSize,
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                ),
                builder: (context, child) {
                  double value = 1.0;

                  if (_controller.hasClients &&
                      _controller.position.haveDimensions) {
                    final double page = _controller.page ?? _controller.initialPage.toDouble();
                    value = (page - index).abs();
                    value = (1.2 - (value * 0.5)).clamp(0.6, 1.0);
                  }

                  return Center(
                    child: Transform.scale(
                      scale: value,
                      child: child,
                    ),
                  );
                },
              );
            },
          ),

          // CENTER RING EFFECT (snap / insta style)
          Container(
            width: widget.ringSize,
            height: widget.ringSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
