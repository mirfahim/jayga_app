import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:jayga/modules/booking/controller/booking_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class AvailablityCheckView extends GetView<BookingController> {
  AvailablityCheckView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
         Obx(
            () {
             return TableCalendar(
              firstDay: kFirstDay,
              lastDay: kLastDay,
              focusedDay: controller.focusedDay.value,
              calendarFormat: controller.calendarFormat.value,

              calendarBuilders: CalendarBuilders(
                defaultBuilder:  (context, day, d) {
                  // Customize the appearance of each day cell
                  for (DateTime d in controller.disabledDates.value) {
                    if (day.day == d.day &&
                        day.month == d.month &&
                        day.year == d.year) {
                      return Container(
                        height: Get.height*.04,
                        width: Get.width*.08,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(
                            Radius.circular(3.0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '${day.day}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    }
                  }
                  return null;
                },
              ),
              selectedDayPredicate: (day) {
                // Use `selectedDayPredicate` to determine which day is currently selected.
                // If this returns true, then `day` will be marked as selected.
                // Using `isSameDay` is recommended to disregard
                // the time-part of compared DateTime objects.
                return isSameDay(controller.selectedDay.value, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(controller.selectedDay.value, selectedDay)) {
                  // Call `setState()` when updating the selected day

                  controller.selectedDay.value = selectedDay;
                  print("my day select is ${controller.selectedDay.value}");
                  controller.focusedDay.value = focusedDay;
                }
              },
              onFormatChanged: (format) {
                if (controller.calendarFormat.value != format) {
                  // Call `setState()` when updating calendar format

                  controller.calendarFormat.value = format;
                }
              },
              onPageChanged: (focusedDay) {
                // No need to call `setState()` here
                controller.focusedDay.value = focusedDay;
              },

        );
           }
         )

    );
  }
}
