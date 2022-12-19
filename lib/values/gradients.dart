part of values;

class Gradients {
  static const Gradient primaryGradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      AppColors.accentColor,
      Color(0xFF009EFA),
      AppColors.primaryColor,
    ],
  );

  static const Gradient weddingDayBlueGredient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      Color(0xFF40E0D0),
      Color(0xFFFF8C00),
      Color(0xFFFF0080),
    ],
  );

  static const Gradient certificationGredient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF47CDE7),
      Color(0xFFE9399D),
      Color(0xFFC35CEC),
    ],
  );

  static const Gradient portfolioGredient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF845EC2),
      Color(0xFFD65DB1),
      Color(0xFFFF6F91),
      Color(0xFFFF9671),
      Color(0xFFFFC75F),
      Color(0xFFF9F871),
    ],
  );

  static const Gradient primaryRedBlue = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.blue,
      Colors.red,
    ],
  );

  static const Gradient try1 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
    stops: [0.5, 1.0],
    colors: [
      Color(0xFF43cea2),
      Color(0xFF185a9d),
    ],
  );

  static const Gradient try2 = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
    stops: [0.5, 1.0],
    colors: [
      Color(0xFFc33764),
      Color(0xFF1d2671),
    ],
  );
}
