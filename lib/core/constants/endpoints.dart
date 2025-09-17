import 'package:flutter_dotenv/flutter_dotenv.dart';

final String topHeadlinesEndpoint =
    'top-headlines?language=en&apiKey=${dotenv.env['API_KEY']}';
