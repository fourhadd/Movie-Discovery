# 🎬 Movie Discovery

**Movie Discovery** — istifadəçilərə çoxlu sayda filmləri kəşf etmə, real vaxt rejimində axtarış, ətraflı məlumatları oxuma, kast (aktyor heyəti) heyətini araşdırma və sevdikləri kontentləri şəxsi watchlist-ə əlavə etmə imkanı verən müasir və performanslı Flutter mobil tətbiqidir. Layihə **TMDb (The Movie Database) API** inteqrasiyası ilə real vaxt məlumatlarına əsaslanır.

Tətbiq tamamilə **Clean Architecture** prinsiplərinə uyğun olaraq dizayn edilmişdir. Bu struktur kodun maksimum modulluğunu, asan test oluna bilməsini (testability) və gələcəkdə rahat genişləndirilməsini (scalability) təmin edir.

---

## 🚀 Texnologiya Siyahısı (Tech Stack)

Tətbiqin sürətli, təhlükəsiz və genişləndirilə bilən qalması üçün aşağıdakı paketlərdən və memarlıq alətlərindən istifadə olunmuşdur:

| Tool / Package | Purpose |
| :--- | :--- |
| **Flutter SDK** | Cross-platform mobil UI çərçivəsi (Framework) |
| **Dart** | Tip təhlükəsizliyinə malik proqramlaşdırma dili |
| **Flutter BLoC / Cubit** | Dövlət idarəetməsi (State Management) və biznes məntiqi |
| **Dio** | API sorğuları üçün qabaqcıl HTTP müştərisi (Client) |
| **GoRouter** | Deklarativ naviqasiya və marşrutlaşdırma idarəetməsi |
| **GetIt** | Asılılıqların yeridilməsi (Dependency Injection) üçün Service Locator |
| **GetStorage** | Müasir və sürətli lokal daimi yaddaş (Local Storage) |
| **YouTube Player IFrame** | Rəsmi film trailerlərini izləmək üçün daxili video pleyer |
| **Shimmer** | Məlumatlar yüklənərkən göstərilən göz oxşayan sklet yüklənmə effektləri |
| **Equatable** | Dart sinifləri üçün dəyər bərabərliyi (Value Equality) təminatçısı |

---

## 🌟 Əsas Özəlliklər (Key Features)

1. 🏠 **Home Screen:** Ən son, populyar və trend olan filmləri vizual olaraq zəngin karusellərlə təqdim edir. Əsas banner hissəsində axıcı **Hero animasiyası** tətbiq olunmuşdur.
2. 🔍 **Advanced Search:** Filmləri və aktyorları ad, janr və digər kriteriyalara görə eyni ekranda real vaxt rejimində (Multi-Search) axtarır. Şəffaf və parıltısız kateqoriya çipləri ilə filtrasiya mövcuddur.
3. 🎥 **Media Details:** Hər bir film üçün sinopsis, reytinq xalları, izləmə müddəti, oxşar film tövsiyələri və daxili YouTube trailer pleyeri ilə tam ətraflı məlumat səhifəsi.
4. 👥 **Cast Information:** Filmdə iştirak edən aktyorların siyahısı və rolu haqqında məlumatlar. Aktyorun üzərinə kliklədikdə dərhal şəxsi profilinə keçid imkanı.
5. ⭐ **Actor Profiles:** Aktyorun bioqrafiyası, populyarlıq reytinqi, çəkildiyi digər tanınmış filmlər və foto qalereyası vərəqi ilə zənginləşdirilmiş profil modulu.
6. ❤️ **Watchlist Management:** Filmləri lokal verilənlər bazasına əlavə etmə, silmə və oflayn rejimdə belə yaddaşdakı siyahıya baxma imkanı.
7. 📱 **Similar Movies:** Hər bir film səhifəsinin altında, istifadəçinin zövqünə uyğun oxşar kontentləri kəşf etmək üçün tövsiyə sistemi.
8. ✨ **Smooth Loading States:** Darıxdırıcı yüklənmə çarxları əvəzinə, həm axtarış qridində (filmlər və dairəvi aktyor avatarları üçün), həm də watchlist səhifəsində tətbiq edilən xüsusi **AppShimmer** effektləri.
9. 🎨 **Modern UI/UX:** Material Design 3 prinsiplərinə tam uyğun, tam qara (True Black) tema dizaynına malik responsive interfeys.

---

## 📂 Layihə Strukturu (Full Project Tree)

Layihənin `lib/` qovluğu daxilindəki təmiz və explicit fayl iyerarxiyası:

```text
lib/
│
├── main.dart                           # Tətbiqin giriş nöqtəsi – runApp() ilə App sinifini başlatma
│
├── app/
│   └── app.dart                        # Tətbiqin konfiqurasiyası (MaterialApp, tema, router)
│
├── core/                                # Paylaşılan ümumi komponentlər və utilitlər
│   ├── constants/
│   │   └── app_constants.dart          # API base URL, TMDB API açarı və digər sabitlər
│   ├── errors/
│   │   └── failures.dart               # Xəta idarəetməsi – exception-ların modelləşdirilməsi
│   ├── navigation/
│   │   ├── app_router.dart             # GoRouter konfiqurasiyası – bütün marşrutların təyini
│   │   └── main_wrapper.dart           # Aşağı naviqasiya bar-ı və əsas struktur
│   ├── theme/
│   │   └── app_theme.dart              # Material Design 3 tema – rənglər, tipoqrafiya, komponent üslubları
│   ├── usecases/
│   │   └── usecase.dart                # UseCase baza sinfi – bütün use case-lər üçün abstract
│   └── widgets/
│       ├── app_shimmer.dart            # Shimmer yüklənmə effekti – universal komponent
│       └── error_view.dart             # Xəta göstərmə vidceti – API xətalarını ekranda əks etdirmə
│
├── di/
│   └── injection.dart                  # GetIt Dependency Injection konfiqurasiyası – bütün servislərin qeydiyyatı
│
└── features/                           # Clean Architecture-ə uyğun müstəqil funksional modullar
    │
    ├── home/                           # Ana Səhifə Modulu
    │   ├── data/
    │   │   ├── datasources/
    │   │   │   └── home_remote_data_source.dart    # API-dən trend və populyar filmləri çəkmə
    │   │   ├── models/
    │   │   │   └── movie_model.dart                # API cavabını Dart obyektinə serialləşdirmə
    │   │   └── repositories/
    │   │       └── movie_repository_impl.dart      # Data Layer ilə Domain Layer arasında körpü
    │   ├── domain/
    │   │   ├── entities/
    │   │   │   └── movie.dart                       # Business logic-də istifadə olunan xalis Film modeli
    │   │   ├── repositories/
    │   │   │   └── movie_repository.dart            # Abstrakt film deposu üçün müqavilə (interface)
    │   │   └── usecases/
    │   │       ├── get_trending_movies.dart         # Trend filmləri əldə etmə use case
    │   │       └── get_popular_movies.dart          # Populyar filmləri əldə etmə use case
    │   └── presentation/
    │       ├── cubit/
    │       │   ├── home_cubit.dart                  # Home səhifəsi state management – film verisi yükləmə
    │       │   └── home_state.dart                  # State klassları (Initial, Loading, Loaded, Error)
    │       ├── pages/
    │       │   └── home_page.dart                   # Əsas səhifə UI – HomeCubit ilə bağlantı
    │       └── widgets/
    │           ├── home_hero_banner.dart            # Böyük banner vidceti – seçilmiş film göstəricisi
    │           ├── banner_action_buttons.dart       # Banner üzərindəki düymələr (Trailer, Details)
    │           ├── home_movie_section.dart          # Film kateqoriyası bölməsi (Trending, Popular)
    │           ├── movie_card.dart                  # Tək bir film kartı – şəkil, ad, reytinq
    │           └── home_shimmer.dart                # Home səhifəsi üçün yüklənmə shimmer təsviri
    │
    ├── search/                         # Axtarış Modulu (Həm Filmlər, Həm Aktyorlar)
    │   ├── data/
    │   │   ├── datasources/
    │   │   │   └── search_remote_data_source.dart  # API-dən axtarış nəticələri və janrları çəkmə
    │   │   ├── models/
    │   │   │   └── search_result_model.dart         # Axtarış nəticəsi modeli (janr, film məlumatı)
    │   │   └── repositories/
    │   │       └── search_repository_impl.dart      # Axtarış deposunun tətbiqi
    │   ├── domain/
    │   │   ├── repositories/
    │   │   │   └── search_repository.dart           # Abstrakt axtarış deposu
    │   │   └── usecases/
    │   │       ├── search_movies.dart                # Film axtarışı use case
    │   │       └── get_genres.dart                   # Janr siyahısını əldə etmə use case
    │   └── presentation/
    │       ├── cubit/
    │       │   ├── search_cubit.dart                 # Axtarış səhifəsi state management
    │       │   └── search_state.dart                 # Axtarış üçün state klassları
    │       ├── pages/
    │       │   └── search_page.dart                  # Axtarış səhifəsi UI
    │       └── widgets/
    │           ├── search_header.dart                # Axtarış input sahəsi
    │           ├── category_list.dart                # Janr filtri (horizontal scroll)
    │           ├── movie_grid.dart                    # Axtarış nəticələri grid şəklində
    │           └── search_grid_shimmer.dart           # Axtarış nəticələri üçün yüklənmə animasiyası
    │
    ├── media_detail/                   # Film Detalları Modulu
    │   ├── data/
    │   │   ├── datasources/
    │   │   │   └── media_detail_remote_data_source.dart  # API-dən media ətraflı məlumatı, kast və treyleri çəkmə
    │   │   ├── models/
    │   │   │   ├── movie_detail_model.dart           # Film ətraflı məlumat modeli
    │   │   │   └── cast_model.dart                    # Aktyor heyəti (cast) modeli
    │   │   └── repositories/
    │   │       └── media_detail_repository_impl.dart # Media ətraflı məlumat deposunun tətbiqi
    │   ├── domain/
    │   │   ├── entities/
    │   │   │   ├── movie_detail.dart                  # Film ətraflı məlumat entity
    │   │   │   └── cast.dart                          # Aktyor entity
    │   │   ├── repositories/
    │   │   │   └── media_detail_repository.dart      # Abstrakt media ətraflı məlumat deposu
    │   │   └── usecases/
    │   │       ├── get_movie_details.dart            # Film ətraflı məlumatını əldə etmə use case
    │   │       ├── get_movie_cast.dart                # Film kastını əldə etmə use case
    │   │       ├── get_movie_trailer.dart             # Film treyler URL-ini əldə etmə use case
    │   │       └── get_similar_movies.dart           # Oxşar filmləri əldə etmə use case
    │   └── presentation/
    │       ├── cubit/
    │       │   ├── media_detail_cubit.dart           # Media ətraflı məlumat səhifəsi state management
    │       │   └── media_detail_state.dart           # Media detail state klassları
    │       ├── pages/
    │       │   └── movie_detail_page.dart            # Film ətraflı məlumat səhifəsi UI
    │       └── widgets/
    │           ├── detail_header.dart                 # Film banneri – şəkil, ad, reytinq
    │           ├── detail_overview.dart               # Film haqqında izah (məzmun, rejissor, tarix)
    │           ├── detail_cast_list.dart              # Aktyorlar siyahısı (horizontal)
    │           ├── detail_similar_movies.dart         # Oxşar filmlər siyahısı
    │           ├── trailer_video_player.dart          # YouTube pleyer vidceti
    │           ├── watchlist_button.dart              # İzləmə siyahısına əlavə etmə düyməsi
    │           └── movie_detail_shimmer.dart          # Media detail səhifəsi üçün yüklənmə animasiyası
    │
    ├── actor/                          # Aktyor Profil Modulu
    │   ├── data/
    │   │   ├── datasources/
    │   │   │   └── actor_remote_datasource.dart      # API-dən aktyor ətraflı məlumatını çəkmə
    │   │   ├── models/
    │   │   │   └── actor_model.dart                   # Aktyor API modeli
    │   │   └── repositories/
    │   │       └── actor_remote_datasource_impl.dart  # Aktyor deposunun tətbiqi
    │   ├── domain/
    │   │   ├── entities/
    │   │   │   └── actor_entity.dart                  # Aktyor business logic entity
    │   │   ├── repositories/
    │   │   │   └── actor_repository.dart              # Abstrakt aktyor deposu
    │   │   └── usecases/
    │   │       └── get_actor_detail.dart              # Aktyor ətraflı məlumatını əldə etmə use case
    │   └── presentation/
    │       ├── cubit/
    │       │   ├── actor_detail_cubit.dart            # Aktyor ətraflı məlumat səhifəsi state management
    │       │   └── actor_detail_state.dart            # Aktyor detail state klassları
    │       ├── pages/
    │       │   └── actor_detail_page.dart             # Aktyor ətraflı məlumat səhifəsi UI
    │       └── widgets/
    │           ├── actor_header.dart                  # Aktyor profil başlığı (foto, ad)
    │           ├── actor_biography.dart               # Aktyorun bioqrafiyası
    │           ├── actor_stats.dart                   # Aktyor statistikaları (doğum tarixi, məşhurluq)
    │           ├── actor_known_for.dart               # Aktyorun məşhur olduğu rollar
    │           ├── actor_photos.dart                  # Aktyorun fotoları (grid)
    │           ├── follow_button.dart                 # İzləmə/Follow düyməsi
    │           └── actor_detail_shimmer.dart          # Aktyor səhifəsi üçün yüklənmə animasiyası
    │
    ├── watchlist/                      # Watchlist (Lokal Yaddaş) Modulu
    │   ├── data/
    │   │   ├── datasources/
    │   │   │   └── watchlist_local_data_source.dart  # Lokal cihaz yaddaşında (GetStorage) izləmə siyahısını saxlama
    │   │   └── repositories/
    │   │       └── watchlist_repository_impl.dart    # İzləmə siyahısı deposunun tətbiqi
    │   ├── domain/
    │   │   ├── repositories/
    │   │   │   └── watchlist_repository.dart         # Abstrakt izləmə siyahısı deposu
    │   │   └── usecases/
    │   │       └── watchlist_usecases.dart           # Bütün izləmə siyahısı use case-ləri (Add, Remove, Get List)
    │   └── presentation/
    │       ├── cubit/
    │       │   ├── watchlist_cubit.dart              # İzləmə siyahısı səhifəsi state management
    │       │   └── watchlist_state.dart              # İzləmə siyahısı state klassları
    │       ├── pages/
    │       │   └── watchlist_page.dart               # İzləmə siyahısı səhifəsi UI
    │       └── widgets/
    │           └── watchlist_grid_shimmer.dart       # İzləmə siyahısı üçün yüklənmə animasiyası
    │
    └── profile/                        # İstifadəçi Profil Modulu
        ├── data/
        │   ├── datasources/
        │   │   └── profile_local_data_source.dart   # Lokal cihaz yaddaşında fərdi profil məlumatı
        │   ├── models/
        │   │   └── followed_actor_model.dart        # İzlənən aktyor modeli
        │   └── repositories/
        │       └── profile_repository_impl.dart     # Profil deposunun tətbiqi
        ├── domain/
        │   ├── entities/
        │   │   ├── user_profile.dart                 # İstifadəçi profili entity
        │   │   └── followed_actor.dart               # İzlənən aktyor entity
        │   ├── repositories/
        │   │   └── profile_repository.dart           # Abstrakt profil deposu
        │   └── usecases/
        │       ├── get_user_profile.dart             # İstifadəçi profil məlumatını əldə etmə use case
        │       ├── toggle_follow_actor.dart          # Aktyoru izləmə/izləməni dayandırma use case
        │       └── is_actor_followed.dart            # Aktyorun izlənib-izlənmədiyini yoxlama use case
        └── presentation/
            ├── cubit/
            │   ├── profile_cubit.dart                # Profil səhifəsi state management
            │   ├── profile_state.dart                # Profil state klassları
            │   └── follow_cubit.dart                 # Aktyoru izləmə state management
            ├── pages/
            │   └── profile_page.dart                 # Fərdi profil səhifəsi UI
            └── widgets/
                ├── profile_header.dart                # Profil üst hissəsi (istifadəçi məlumatı)
                ├── followed_actors_section.dart       # İzlənən aktyorlar siyahısı
                ├── follow_button.dart                 # Follow/Unfollow düyməsi
                └── profile_shimmer.dart               # Profil səhifəsi üçün yüklənmə animasiyası
```
