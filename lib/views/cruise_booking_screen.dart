// lib/views/cruise_booking_screen.dart
import 'package:flutter/material.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/booking_controls_widget.dart';

class CruiseBookingScreen extends StatefulWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({super.key, required this.viewModel});

  @override
  State<CruiseBookingScreen> createState() => _CruiseBookingScreenState();
}

class _CruiseBookingScreenState extends State<CruiseBookingScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = widget.viewModel;

    final contentWidgets = [
      TitleSectionWidget(
        title: vm.destination.title,
        location: vm.destination.location,
        starCount: vm.destination.starCount,
        isFavorited: vm.isFavorited,
        onFavoriteToggle: vm.toggleFavorite,
      ),
      const ActionBarWidget(),
      DescriptionWidget(description: vm.destination.description),
      BookingControlsWidget(
        selectedDate: vm.selectedDate,
        selectedPackage: vm.selectedPackage,
        packageOptions: vm.packageOptions,
        isDarkMode: vm.isDarkMode,
        onDateSelected: vm.updateDate,
        onPackageSelected: vm.updatePackage,
        onThemeToggled: vm.toggleTheme,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Sibu River Cruise & Heritage')),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return ListView(
              children: [
                const HeaderImageWidget(),
                ...contentWidgets,
              ],
            );
          } else {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(flex: 1, child: HeaderImageWidget()),
                Expanded(
                  flex: 2,
                  child: ListView(children: contentWidgets),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}