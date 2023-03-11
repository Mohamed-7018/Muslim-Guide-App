part of values;

mixin GlobalAppBorders {
  static BorderRadius c_25 = BorderRadius.circular(GlobalAppSizes.s_25);
}

class GlobalAppSizedBox {
  static const SizedBox h_10 = SizedBox(
    height: GlobalAppSizes.s_10,
  );
  static const SizedBox h_15 = SizedBox(
    height: GlobalAppSizes.s_15,
  );
}

class GlobalAppEdgeInsets {
  // top-left-right-left

  /// right & top
  static const EdgeInsets t30r10 =
      EdgeInsets.only(right: GlobalAppSizes.s_10, top: GlobalAppSizes.s_30);

  // symetric //horizontal-verticel
  static const EdgeInsets h0v0 = EdgeInsets.symmetric(
      horizontal: GlobalAppSizes.s_0, vertical: GlobalAppSizes.s_0);
}
