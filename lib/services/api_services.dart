import 'package:flutter_application_1/model/quotesDay_model.dart';
import 'package:flutter_application_1/model/random_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/model/quotes_model.dart';

class ApiServices {
  Future<List<QuotesModel>> getApiData() async {
    var response = await http.get(Uri.parse('https://zenquotes.io/api/quotes'));

    if (response.statusCode == 200) {
      return quotesModelFromJson(response.body);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<QuotesDayModel>> getquotesDayData() async {
    var ressponse = await http.get(Uri.parse('https://zenquotes.io/api/today'));

    if (ressponse.statusCode == 200) {
      return quotesDayModelFromJson(ressponse.body);
    } else {
      throw Exception('Error');
    }
  }


  
  
  Future<List<RandomQuotesModel>> getRandomQuotes() async {
    var responses =
        await http.get(Uri.parse('https://zenquotes.io/api/random'));

    if (responses.statusCode == 200) {
      return randomQuotesModelFromJson(responses.body);
    } else {
      throw Exception('Error Random Quotes');
    }
  }
}
