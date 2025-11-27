import 'package:flutter/cupertino.dart';

import 'curved_edges.dart';

class JCurvedEdgeWidget extends StatelessWidget {
  const JCurvedEdgeWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurvedEdges(),
      child: child,
    );
  }
}