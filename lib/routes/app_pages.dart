import 'package:get/get.dart';
import 'package:jayga/modules/A_Base/binding/base_binding.dart';
import 'package:jayga/modules/A_Base/view/base_view.dart';

import 'package:jayga/modules/A_Base/view/saved_screen/saved_screen.dart';
import 'package:jayga/modules/auth/binding/auth_binding.dart';
import 'package:jayga/modules/auth/view/otp_page.dart';
import 'package:jayga/modules/auth/view/register_screen.dart';
import 'package:jayga/modules/auth/view/sign_page.dart';
import 'package:jayga/modules/booking/binding/booking_binding.dart';
import 'package:jayga/modules/booking/view/booking_details.dart';
import 'package:jayga/modules/booking/view/confirmANDpay.dart';
import 'package:jayga/modules/booking/view/listing_map_view.dart';
import 'package:jayga/modules/booking/view/search_booking.dart';
import 'package:jayga/modules/community/binding/community_binding.dart';
import 'package:jayga/modules/community/view/community_home_page.dart';
import 'package:jayga/modules/group_tour/binding/group_tour_binding.dart';
import 'package:jayga/modules/group_tour/view/group_tour_details.dart';
import 'package:jayga/modules/group_tour/view/package_includes.dart';
import 'package:jayga/modules/home/binding/home_binding.dart';
import 'package:jayga/modules/home/location_visited/how_many_country_visited.dart';
import 'package:jayga/modules/home/location_visited/how_many_location_visited_Bd.dart';
import 'package:jayga/modules/home/profile/edit_profile/edit_num_otp.dart';
import 'package:jayga/modules/home/profile/edit_profile/edit_number.dart';
import 'package:jayga/modules/home/profile/edit_profile/profile_details_edit.dart';
import 'package:jayga/modules/home/profile/profile_screen.dart';
import 'package:jayga/modules/home/profile/travel_profile/travel_profile.dart';
import 'package:jayga/modules/home/view/home_page_view.dart';
import 'package:jayga/modules/host_setup/binding/host_binding.dart';
import 'package:jayga/modules/host_setup/view/create_own_jayga.dart';
import 'package:jayga/modules/host_setup/view/experience_setup/landing_page.dart';
import 'package:jayga/modules/host_setup/view/host_setting/add_image.dart';
import 'package:jayga/modules/host_setup/view/host_setting/edit_listing_amenities.dart';
import 'package:jayga/modules/host_setup/view/host_setting/edit_restriction_listing.dart';
import 'package:jayga/modules/host_setup/view/host_setting/host_setting_home.dart';
import 'package:jayga/modules/host_setup/view/host_setting/change_listing_list_profile_form_list.dart';
import 'package:jayga/modules/host_setup/view/host_setting/listing_type_edit.dart';
import 'package:jayga/modules/host_setup/view/host_setting/location_edit.dart';
import 'package:jayga/modules/payment/binding/paymnet_binding.dart';
import 'package:jayga/modules/payment/view/payment_home_page.dart';
import 'package:jayga/modules/splash_screen/binding/splash_binding.dart';
import 'package:jayga/modules/A_Base/view/landing_page.dart';
import 'package:jayga/modules/splash_screen/view/splash_screeen_view.dart';

import '../modules/A_Base/view/notification/notification_main_page.dart';
import '../modules/booking/view/booking_home_page.dart';
import '../modules/booking/view/my_booking_history/booking_details_view.dart';
import '../modules/booking/view/my_booking_history/my_booking_screen.dart';
import '../modules/group_tour/view/book_now_page.dart';
import '../modules/group_tour/view/tour_package_list_view.dart';
import '../modules/host_setup/view/create_jayga_form_view.dart';
import '../modules/host_setup/view/host_setting/listing_title_des_edit.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.EXPERIENCELANDING,
      page: () => ExperienceSetupLanding(),
      binding: HostBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONLIST,
      page: () => NotificationListView(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: _Paths.HOSTPROFILESETTING,
      page: () => HostProfileSetting(),
      binding: HostBinding(),
    ),
    GetPage(
      name: _Paths.EXPLORE,
      page: () => ExplorePageView(),
      binding: BookingBinding(),
    ),
    GetPage(
      name: _Paths.BASE,
      page: () => BaseView(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: _Paths.SAVEDSCREEN,
      page: () => SavedView(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: _Paths.CREATEJAYGAFORM,
      page: () => CreateJaygaFormView(),
      binding: HostBinding(),
    ),
    GetPage(
      name: _Paths.CREATEOWNJAYGA,
      page: () => CreateOwnJaygaView(),
      binding: HostBinding(),
    ),
    GetPage(
      name: _Paths.MAKEBOOKINGDETAILS,
      page: () => MakeBookingDetailsView(),
      binding: BookingBinding(),
    ),
    GetPage(
      name: _Paths.SEARCHPAGE,
      page: () => SearchListing(),
      binding: BookingBinding(),
    ),
    GetPage(
      name: _Paths.CONFIRMANDPAY,
      page: () => ConfirmAndPayView(),
      binding: BookingBinding(),
    ),
    GetPage(
      name: _Paths.MYBOOKING,
      page: () => MyBookingView(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.LANDING,
      page: () => LandingView(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: _Paths.BOOKINGDETAILSHISTORY,
      page: () => MyBookingHistoryDetailsView(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: _Paths.OTPPAGE,
      page: () => OTPView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.EDITLISTINGNAME,
      page: () => EditListingTITLEANDOTHERS(),
      binding: HostBinding(),
    ),
    GetPage(
      name: _Paths.EDITLISTINGTYPE,
      page: () => ListingTypeEdit(),
      binding: HostBinding(),
    ),
    GetPage(
      name: _Paths.PACKAGEINCLUDE,
      page: () => PackageIncludes(),
      binding: GroupTourBinding(),
    ),
    GetPage(
      name: _Paths.BOOKGROUPTOUR,
      page: () => BookGroupTour(),
      binding: GroupTourBinding(),
    ),
    GetPage(
      name: _Paths.VISTEDCOUNTRY,
      page: () => VisitedCountry(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.VISTEDBD,
      page: () => VisitedBangladesh(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.COMMUNITYHOME,
      page: () => CommunityHomePage(),
      binding: CommunityBinding(),
    ),
    GetPage(
      name: _Paths.GROUPTOURDETAILS,
      page: () => GroupTourDetails(),
      binding: GroupTourBinding(),
    ),
    GetPage(
      name: _Paths.PROFILELISTING,
      page: () => ProfileListingList(),
      binding: HostBinding(),
    ),
    GetPage(
      name: _Paths.PAYHOME,
      page: () => PaymentHomePage(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.ADDIMAGEEDITLISTING,
      page: () => AddImageEditListing(),
      binding: HostBinding(),
    ),
    GetPage(
      name: _Paths.LISTINGMAP,
      page: () => ListingMapView(),
      binding: BookingBinding(),
    ),
    GetPage(
      name: _Paths.GROUPTOURLIST,
      page: () => GroupTourPackageListView(),
      binding: GroupTourBinding(),
    ),
    GetPage(
      name: _Paths.PROFILEDETAIL,
      page: () => ProfileDetailView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TRAVELPROFILE,
      page: () => TravelProfileView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILEDETAIL,
      page: () => ProfileDetailView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.EDITLOCATION,
      page: () => LocationEdit(),
      binding: HostBinding(),
    ),
    GetPage(
      name: _Paths.EDITAMENITIES,
      page: () => EditListingAmenities(),
      binding: HostBinding(),
    ),
    GetPage(
      name: _Paths.EDITRESTRICTION,
      page: () => EditListingRestrictions(),
      binding: HostBinding(),
    ),
    GetPage(
      name: _Paths.EDITNUMOTP,
      page: () => EditNumOTPView(),
      binding: HomeBinding(),
    ),
  ];
}
