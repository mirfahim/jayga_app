class ApiUrl {
  String api_token = '';
  static String googleMapApiKey = '';
 // static String baseUrl = 'http://18.217.130.75/api/v1';
   static String baseUrl = 'https://new.jayga.xyz/api';
  static String uploadUserImage = ' https://new.jayga.xyz/api/update/user/avatar';

  static String login = '$baseUrl/signin';
  static String register = '$baseUrl/register';
  static String filterListing = baseUrl;
  static String addListing = '$baseUrl/add/listing';
  static String addListingImage = '$baseUrl/add/listing-images';
  static String addReview = '$baseUrl/add/listing-images';

  static String getReview = '$baseUrl/add/listing-images';
  static String updateProfile = '$baseUrl/user/edit';

  static String getProfile = '$baseUrl/user/';
  static String paymentCheck = '$baseUrl/payment/update';


// static String login = '$baseUrl/login';
  // static String login = '$baseUrl/login';
  // static String login = '$baseUrl/login';




// end copy from fisera.....
}