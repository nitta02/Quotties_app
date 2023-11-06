// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter_application_1/model/quotesDay_model.dart';
import 'package:flutter_application_1/model/quotes_model.dart';
import 'package:flutter_application_1/model/random_model.dart';
import 'package:flutter_application_1/services/api_services.dart';
import 'package:get/get.dart';

class QuotesController extends GetxController {
  List<QuotesModel> listData = [];

  var isLoading = true.obs;

  void fetchData() async {
    try {
      isLoading(true);
      var responseData = await ApiServices().getApiData();
      listData.addAll(responseData);
    } catch (e) {
      isLoading(false);
    }
  }

  List<QuotesDayModel> dayQuotesList = [];

  void fetchdataQuotesData() async {
    try {
      isLoading(true);
      var response = await ApiServices().getquotesDayData();
      // print(response);

      dayQuotesList.addAll(response);
      // print(dayQuotesList);
    } catch (e) {
      isLoading(false);
      print(e);
    }
  }

  List<RandomQuotesModel> randomQuotesList = [];

  Future<void> fetchRandomQuotes() async {
    try {
      isLoading(true);
      var response = await ApiServices().getRandomQuotes();

      // Clear the existing list and add the new random quote
      randomQuotesList.clear();
      randomQuotesList.add(response[Random().nextInt(response.length)]);

      isLoading(false);
    } catch (e) {
      isLoading(false);
    }
  }

  Future<void> refreshRandomQuotes() async {
    try {
      isLoading(true);
      var response = await ApiServices().getRandomQuotes();
      randomQuotesList.add(response as RandomQuotesModel);
    } catch (e) {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchData();
    fetchdataQuotesData();
    fetchRandomQuotes();
    refreshRandomQuotes();
  }

  //GET STORAGE USE FOR STORING FAVORITE QUOTES

  // final box = GetStorage();
  // final String _key = 'fav_quotes';
  RxList favQuotesList = [].obs;

  addFav(String value) {
    favQuotesList.add(value);
  }

  
  removeFav(String value) {
    favQuotesList.remove(value);
  }
  // String get getKey => _key;

  // void addTofavQuotes(dynamic fav) {
  //   // box.write(_key, fav);
  //   try {
  //     isLoading(true);
  //     favQuotesList.add(fav);
  //     var addfavQuotes = box.write(_key, favQuotesList);
  //     print(addfavQuotes);
  //   } catch (e) {
  //     isLoading(false);
  //   }
  // }
}
