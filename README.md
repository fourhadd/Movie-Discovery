# 🎬 Movie Discovery App

Movie Discovery is a modern Flutter mobile application that leverages the TMDB (The Movie Database) API to allow users to discover the latest popular and trending movies, view movie details, watch official trailers, explore cast members, and save their favorite movies to a local database (Watchlist).

The project is built entirely following **Clean Architecture** principles, ensuring maximum modularity, scalability, and testability.

---

## 🚀 Tech Stack

The application utilizes the following packages and architectural patterns to remain fast, secure, and easily extendable:

| Tool / Package | Purpose |
| :--- | :--- |
| **Flutter SDK** | Cross-platform UI Framework |
| **Flutter BLoC / Cubit** | State Management |
| **Dio** | HTTP Networking and API Integration (with automatic JSON mapping) |
| **GoRouter** | Declarative Routing and Scoped/Regional Cubit management |
| **GetIt** | Service Locator for Dependency Injection |
| **Clean Architecture** | Project Architecture (Separation of Data, Domain, and Presentation layers) |

---

## 🌟 Key Features

1. **Home Screen:** Displays trending and popular movies utilizing rich visual hero banners and horizontal carousels.
2. **Media Detail:** Provides a detailed overview of the movie, including runtime, rating, official YouTube trailers, similar recommendations, and the full cast list.
3. **Search:** Allows users to perform dynamic, real-time queries to find movies instantly.
4. **Watchlist:** Saves favorite movies to a local database, allowing users to manage and view their watchlist offline.
5. **Actor Detail:** Showcases an actor's biography, career statistics (movie count, rating, awards), photo gallery, and a list of other popular movies they are known for.

---

## 📂 Full Project Tree

The complete and explicit file structure inside the `lib/` directory of the project:

```text
lib/
├── app/
│   └── app.dart                         # Main entry point for MaterialApp configuration
├── core/                                # Shared components across features
│   ├── constants/
│   │   └── app_constants.dart           # API URLs, base paths, and static values
│   ├── errors/
│   │   └── failures.dart                # Error and Exception handling classes
│   ├── navigation/
│   │   ├── app_router.dart              # GoRouter configurations and scoped providers
│   │   └── main_wrapper.dart            # Bottom Navigation Bar management
│   ├── theme/
│   │   └── app_theme.dart               # Dark Theme configurations and global styling
│   └── usecases/
│       └── usecase.dart                 # Base interface for UseCases
├── di/
│   └── injection.dart                   # GetIt Service Locator dependency registrations
├── features/                            # Independent functional modules
│   ├── actor/                           # Actor Profile Module
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── actor_remote_datasource.dart
│   │   │   ├── models/
│   │   │   │   └── actor_model.dart
│   │   │   └── repositories/
│   │   │       └── actor_remote_datasource_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── actor_entity.dart
│   │   │   ├── repositories/
│   │   │   │   └── actor_repository.dart
│   │   │   └── usecases/
│   │   │       └── get_actor_detail.dart
│   │   └── presentation/
│   │       ├── cubit/
│   │       │   ├── actor_detail_cubit.dart
│   │       │   └── actor_detail_state.dart
│   │       ├── pages/
│   │       │   └── actor_detail_page.dart
│   │       └── widgets/
│   │           ├── actor_biography.dart
│   │           ├── actor_header.dart
│   │           ├── actor_known_for.dart
│   │           ├── actor_photos.dart
│   │           └── actor_stats.dart
│   ├── home/                            # Home Screen Module
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── home_remote_data_source.dart
│   │   │   ├── models/
│   │   │   │   └── movie_model.dart
│   │   │   └── repositories/
│   │   │       └── movie_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── movie.dart
│   │   │   ├── repositories/
│   │   │   │   └── movie_repository.dart
│   │   │   └── usecases/
│   │   │       ├── get_popular_movies.dart
│   │   │       └── get_trending_movies.dart
│   │   └── presentation/
│   │       ├── cubit/
│   │       │   ├── home_cubit.dart
│   │       │   └── home_state.dart
│   │       ├── pages/
│   │       │   └── home_page.dart
│   │       └── widgets/
│   │           ├── banner_action_buttons.dart
│   │           ├── home_hero_banner.dart
│   │           ├── home_movie_section.dart
│   │           └── movie_card.dart
│   ├── media_detail/                    # Movie Details Module
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── media_detail_remote_data_source.dart
│   │   │   ├── models/
│   │   │   │   ├── cast_model.dart
│   │   │   │   └── movie_detail_model.dart
│   │   │   └── repositories/
│   │   │       └── media_detail_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── cast.dart
│   │   │   │   └── movie_detail.dart
│   │   │   ├── repositories/
│   │   │   │   └── media_detail_repository.dart
│   │   │   └── usecases/
│   │   │       ├── get_movie_cast.dart
│   │   │       ├── get_movie_details.dart
│   │   │       ├── get_movie_trailer.dart
│   │   │       └── get_similar_movies.dart
│   │   └── presentation/
│   │       ├── cubit/
│   │       │   ├── media_detail_cubit.dart
│   │       │   └── media_detail_state.dart
│   │       ├── pages/
│   │       │   └── movie_detail_page.dart
│   │       └── widgets/
│   │           ├── detail_cast_list.dart
│   │           ├── detail_header.dart
│   │           ├── detail_overview.dart
│   │           ├── detail_similar_movies.dart
│   │           ├── trailer_video_player.dart
│   │           └── watchlist_button.dart
│   ├── search/                          # Search Module
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   └── search_remote_data_source.dart
│   │   │   └── repositories/
│   │   │       └── search_repository_impl.dart
│   │   ├── domain/
│   │   │   ├── repositories/
│   │   │   │   └── search_repository.dart
│   │   │   └── usecases/
│   │   │       └── search_movies.dart
│   │   └── presentation/
│   │       ├── cubit/
│   │       │   ├── search_cubit.dart
│   │       │   └── search_state.dart
│   │       └── pages/
│   │           └── search_page.dart
│   └── watchlist/                       # Watchlist Module
│       ├── data/
│       │   ├── datasources/
│       │   │   └── watchlist_local_data_source.dart
│       │   └── repositories/
│       │       └── watchlist_repository_impl.dart
│       ├── domain/
│       │   ├── repositories/
│       │   │   └── watchlist_repository.dart
│       │   └── usecases/
│       │       └── watchlist_usecases.dart
│       └── presentation/
│           ├── cubit/
│           │   ├── watchlist_cubit.dart
│           │   └── watchlist_state.dart
│           └── pages/
│               └── watchlist_page.dart
└── main.dart
