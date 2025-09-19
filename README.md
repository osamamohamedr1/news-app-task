# News App Task

A modern Flutter news application that fetches and displays news articles from various categories with search functionality and user authentication.

## 📱 Features

### Core Features
- **Latest News Display**: Browse the most recent news articles
- **News Categories**: Filter articles by categories (Technology, Sports, Entertainment, Business, Health, Science)
- **Article Details**: View full article details with option to read more in browser
- **User Authentication**: Simple login system with email validation

### Optional Features (Implemented)
- **🔍 Search Functionality**: Search for articles by keywords with real-time debounced input
- **📂 Category Selection**: Select specific categories to filter news articles
- **🔄 Pull to Refresh**: Swipe down to reload articles on the home screen
- **📱 Responsive Design**: Modern UI with proper scaling using ScreenUtil
- **🌐 External Browser**: Open full articles in external browser using URL launcher


## 🚀 Getting Started

**API Key Configuration**
   
   **Environment Variables (Recommended)**
   - Add `flutter_dotenv` to your `pubspec.yaml`:
     ```yaml
     dependencies:
       flutter_dotenv: ^5.1.0
     ```
   - Create a `.env` file in the root directory:
     ```env
     API_KEY=your_api_key_here
     ```
   - Add `.env` to your `.gitignore` file to keep your API key secure
   - Load the environment variables in your `main.dart`:
     ```dart
     import 'package:flutter_dotenv/flutter_dotenv.dart';
     
     void main() async {
       await dotenv.load(fileName: ".env");
       runApp(MyApp());
     }
     ```


## 🏗️ Project Structure

```
lib/
├── core/
│   ├── constants/           # App constants
│   ├── models/             # Data models (NewsModel, CategoryModel)
│   ├── network/            # API service and constants
│   ├── routing/            # App navigation and routes
│   ├── utils/              # Utilities (colors, text styles, service locator)
│   └── widgets/            # Reusable widgets
├── features/
│   ├── details/            # News article detail view
│   ├── home/               # Home screen with categories and news list
│   ├── login/              # Authentication screens
│   └── search/             # Search functionality
└── main.dart               # App entry point
```

## 🔧 Architecture

The app follows **Clean Architecture** principles with:
- **BLoC Pattern** for state management using `flutter_bloc`
- **Repository Pattern** for data layer abstraction
- **Dependency Injection** using `get_it` service locator
- **Feature-based** folder structure for better organization

### State Management
- `HomeCubit`: Manages home screen state, categories, and news fetching
- `SearchNewsCubit`: Handles search functionality with debounced input
- Each cubit has proper error handling and loading states

## 📋 API Integration

### NewsAPI Endpoints Used
- **Everything**: `/v2/everything` - Search articles by keywords
- **Top Headlines**: `/v2/top-headlines` - Get breaking news headlines


## 📸 Screenshots
![new2](https://github.com/user-attachments/assets/df915731-64e7-4c45-8d1a-75359fcd7e02)
![new4](https://github.com/user-attachments/assets/7983d625-29af-496e-a453-a7dcab934347)
![new1](https://github.com/user-attachments/assets/e7eaf033-d1cf-4d95-ba8e-91c03e1939b3)


## 📞 Contact

**Developer**: Osama Mohamed  


---

**Note**: This application was built as part of an interview task to demonstrate Flutter development capabilities including state management, API integration, clean architecture, and modern UI/UX practices.
