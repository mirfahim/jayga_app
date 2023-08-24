import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jayga/modules/auth/controller/auth_controller.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:jayga/modules/booking/view/all_alemnities.dart';
import 'package:jayga/modules/home/controller/home_controller.dart';
import 'package:jayga/utils/AppColors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:table_calendar/table_calendar.dart';
import '../../../routes/app_pages.dart';

class AvailablityCheckView extends GetView<BookingController> {
   AvailablityCheckView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: TableCalendar(
        firstDay: kFirstDay,
        lastDay: kLastDay,
        focusedDay: controller.focusedDay,
        calendarFormat: controller.calendarFormat,
        selectedDayPredicate: (day) {
          // Use `selectedDayPredicate` to determine which day is currently selected.
          // If this returns true, then `day` will be marked as selected.

          // Using `isSameDay` is recommended to disregard
          // the time-part of compared DateTime objects.
          return isSameDay(controller.selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(controller.selectedDay, selectedDay)) {
            // Call `setState()` when updating the selected day

              controller.selectedDay = selectedDay;
              controller.focusedDay = focusedDay;

          }
        },
        onFormatChanged: (format) {
          if (controller.calendarFormat != format) {
            // Call `setState()` when updating calendar format

              controller.calendarFormat = format;

          }
        },
        onPageChanged: (focusedDay) {
          // No need to call `setState()` here
          controller.focusedDay = focusedDay;
        },
      ),
    );
  }
}
