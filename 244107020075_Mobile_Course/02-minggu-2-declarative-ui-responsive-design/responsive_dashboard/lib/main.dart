
import 'dart:ui' show lerpDouble;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// RESPONSIVE BREAKPOINT
const double kWideBreakpoint = 700;

// THEME DIMENSIONS
@immutable
class AcademicStyle extends ThemeExtension<AcademicStyle> {
  const AcademicStyle({
    required this.spacing,
    required this.cardPadding,
    required this.cardRadius,
    required this.avatarRadius,
    required this.iconSize,
    required this.maxContentWidth,
  });

  final double spacing;
  final double cardPadding;
  final double cardRadius;
  final double avatarRadius;
  final double iconSize;
  final double maxContentWidth;

  @override
  AcademicStyle copyWith({
    double? spacing,
    double? cardPadding,
    double? cardRadius,
    double? avatarRadius,
    double? iconSize,
    double? maxContentWidth,
  }) {
    return AcademicStyle(
      spacing: spacing ?? this.spacing,
      cardPadding: cardPadding ?? this.cardPadding,
      cardRadius: cardRadius ?? this.cardRadius,
      avatarRadius: avatarRadius ?? this.avatarRadius,
      iconSize: iconSize ?? this.iconSize,
      maxContentWidth: maxContentWidth ?? this.maxContentWidth,
    );
  }

  @override
  AcademicStyle lerp(
    covariant AcademicStyle? other,
    double t,
  ) {
    if (other == null) return this;

    return AcademicStyle(
      spacing: lerpDouble(spacing, other.spacing, t)!,
      cardPadding: lerpDouble(cardPadding, other.cardPadding, t)!,
      cardRadius: lerpDouble(cardRadius, other.cardRadius, t)!,
      avatarRadius: lerpDouble(avatarRadius, other.avatarRadius, t)!,
      iconSize: lerpDouble(iconSize, other.iconSize, t)!,
      maxContentWidth: lerpDouble(
        maxContentWidth,
        other.maxContentWidth,
        t,
      )!,
    );
  }
}

// MAIN
void main() {
  runApp(const AcademicApp());
}

class AcademicApp extends StatefulWidget {
  const AcademicApp({super.key});

  @override
  State<AcademicApp> createState() => _AcademicAppState();
}

class _AcademicAppState extends State<AcademicApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    const academicStyle = AcademicStyle(
      spacing: 20,
      cardPadding: 18,
      cardRadius: 16,
      avatarRadius: 32,
      iconSize: 28,
      maxContentWidth: 1100,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        extensions: const [academicStyle],
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.dark,
        ),
        extensions: const [academicStyle],
      ),

      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,

      home: AcademicOverviewPage(
        isDark: isDark,
        onThemeChanged: (value) {
          setState(() {
            isDark = value;
          });
        },
      ),
    );
  }
}

// ACADEMIC OVERVIEW PAGE
class AcademicOverviewPage extends StatelessWidget {
  const AcademicOverviewPage({
    required this.isDark,
    required this.onThemeChanged,
    super.key,
  });

  final bool isDark;
  final ValueChanged<bool> onThemeChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final style = theme.extension<AcademicStyle>()!;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Academic Overview',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Row(
            children: [
              Icon(
                isDark ? Icons.dark_mode : Icons.light_mode,
              ),
              const SizedBox(width: 6),

              Semantics(
                label: 'Dark mode switch',
                hint: 'Switch between light and dark themes',
                toggled: isDark,
                child: CupertinoSwitch(
                  value: isDark,
                  onChanged: onThemeChanged,
                ),
              ),

              SizedBox(width: style.spacing / 2),
            ],
          ),
        ],
      ),

      body: LayoutBuilder(
        builder: (context, constraints) {
          final columns =
              constraints.maxWidth >= kWideBreakpoint ? 2 : 1;

          return SingleChildScrollView(
            padding: EdgeInsets.all(style.spacing),

            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: style.maxContentWidth,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // PROFILE HEADER
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(style.spacing),
                      decoration: BoxDecoration(
                        color: colors.primaryContainer,
                        borderRadius: BorderRadius.circular(
                          style.cardRadius + 4,
                        ),
                      ),

                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: style.avatarRadius,
                            backgroundColor: colors.primary,
                            child: Icon(
                              Icons.person,
                              size: style.iconSize + 8,
                              color: colors.onPrimary,
                            ),
                          ),

                          SizedBox(width: style.spacing * 0.8),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Welcome back!',
                                  style: theme.textTheme.bodyMedium,
                                ),

                                Text(
                                  'Student Name',
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: colors.onPrimaryContainer,
                                  ),
                                ),

                                Text(
                                  'Student ID: 24XXXX',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: colors.onPrimaryContainer,
                                  ),
                                ),

                                Text(
                                  'Informatics Engineering',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: colors.onPrimaryContainer,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: style.spacing * 1.4),

                    // ACADEMIC SUMMARY
                    Text(
                      'Academic Summary',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: style.spacing * 0.8),

                    // RESPONSIVE GRID
                    GridView.count(
                      crossAxisCount: columns,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: style.spacing * 0.8,
                      mainAxisSpacing: style.spacing * 0.8,
                      childAspectRatio: 2.3,

                      children: const [
                        InfoCard(
                          title: 'Assignments',
                          value: '8',
                        ),
                        InfoCard(
                          title: 'Attendance',
                          value: '92%',
                        ),
                        InfoCard(
                          title: 'GPA',
                          value: '3.85',
                        ),
                        InfoCard(
                          title: 'Credits',
                          value: '72',
                        ),
                      ],
                    ),

                    SizedBox(height: style.spacing * 1.4),

                    // ADDITIONAL INFORMATION
                    Text(
                      'Academic Information',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: style.spacing * 0.6),

                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(style.spacing),
                      decoration: BoxDecoration(
                        color: colors.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(
                          style.cardRadius,
                        ),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Current Semester',
                            style: theme.textTheme.bodyMedium,
                          ),

                          const SizedBox(height: 4),

                          Text(
                            'Semester 5 - Academic Year 2026/2027',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const Divider(),

                          Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: colors.primary,
                              ),

                              SizedBox(width: style.spacing / 2),

                              Expanded(
                                child: Text(
                                  'Keep track of your academic progress '
                                  'and stay updated with your performance.',
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// REUSABLE INFO CARD
class InfoCard extends StatelessWidget {
  const InfoCard({
    required this.title,
    required this.value,
    super.key,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final style = theme.extension<AcademicStyle>()!;

    return Semantics(
      label: '$title: $value',
      child: ExcludeSemantics(
        child: Container(
          padding: EdgeInsets.all(style.cardPadding),

          decoration: BoxDecoration(
            color: colors.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(style.cardRadius),
          ),

          child: Row(
            children: [
              Container(
                width: style.iconSize + 20,
                height: style.iconSize + 20,

                decoration: BoxDecoration(
                  color: colors.primaryContainer,
                  borderRadius: BorderRadius.circular(
                    style.cardRadius * 0.75,
                  ),
                ),

                child: Icon(
                  _getIcon(title),
                  color: colors.onPrimaryContainer,
                  size: style.iconSize,
                ),
              ),

              SizedBox(width: style.spacing * 0.7),

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      title,
                      style: theme.textTheme.bodyMedium,
                    ),

                    Text(
                      value,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ICON SELECTION
  IconData _getIcon(String title) {
    switch (title) {
      case 'Assignments':
        return Icons.assignment_outlined;
      case 'Attendance':
        return Icons.calendar_month_outlined;
      case 'GPA':
        return Icons.school_outlined;
      case 'Credits':
        return Icons.menu_book_outlined;
      default:
        return Icons.info_outline;
    }
  }
}
