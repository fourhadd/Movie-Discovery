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
2. 🔍 **Advanced Search:** Filmləri və aktyorları ad, janr və digər kriteriyalara göre eyni ekranda real vaxt rejimində (Multi-Search) axtarır. Şəffaf və parıltısız kateqoriya çipləri ilə filtrasiya mövcuddur.
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
├── app/                               # Tətbiqin əsas konfiqurasiyası
│   └── app.dart                       # MaterialApp sazlamaları və giriş nöqtəsi
│
├── core/                              # Paylaşılan ümumi komponentlər və utilitlər
│   ├── constants/
│   │   └── app_constants.dart         # API URL-ləri, açarlar və statik dəyərlər
│   ├── errors/
│   │   └── failures.dart              # Xəta idarəetməsi üçün xüsusi Failure sinifləri
│   ├── navigation/
│   │   ├── app_router.dart            # GoRouter konfiqurasiyası və marşrutlar
│   │   └── main_wrapper.dart          # Bottom Navigation Bar idarəetməsi
│   ├── theme/
│   │   └── app_theme.dart             # Dark Theme rəngləri və qlobal stillər
│   ├── usecases/
│   │   └── usecase.dart               # Bütün UseCase-lər üçün abstrakt baza sinfi
│   └── widgets/
│       └── app_shimmer.dart           # Təkrar istifadə edilə bilən əsas shimmer vidceti
│
├── di/                                # Dependency Injection (Asılılıqların yeridilməsi)
│   └── injection.dart                 # GetIt xidmət lokatorunun qeydiyyat faylı
│
└── features/                          # Clean Architecture-ə uyğun müstəqil funksional modullar
    │
    ├── home/                          # Ana Səhifə Modulu
    │   ├── data/
    │   │   ├── datasources/
    │   │   │   └── home_remote_data_source.dart    # API-yə qoşulan uzaq data mənbəyi
    │   │   ├── models/
    │   │   │   └── movie_model.dart                # Film məlumat modeli (JSON mapping)
    │   │   └── repositories/
    │   │       └── movie_repository_impl.dart      # Repozitoriyanın data tərəfində tətbiqi
    │   ├── domain/
    │   │   ├── entities/
    │   │   │   └── movie.dart                      # Xalis biznes obyekti (Entity)
    │   │   ├── repositories/
    │   │   │   └── movie_repository.dart           # Abstrakt repozitoriya müqaviləsi
    │   │   └── usecases/
    │   │       ├── get_trending_movies.dart        # Trend filmləri gətirən use case
    │   │       └── get_popular_movies.dart         # Populyar filmləri gətirən use case
    │   └── presentation/
    │       ├── cubit/
    │       │   ├── home_cubit.dart                 # Ana səhifə üçün BLoC/Cubit məntiqi
    │       │   └── home_state.dart                 # Səhifənin vəziyyətləri (States)
    │       ├── pages/
    │       │   └── home_page.dart                  # Ana səhifə interfeysi
    │       └── widgets/
    │           ├── home_hero_banner.dart           # Sürüşən hero banner komponenti
    │           ├── banner_action_buttons.dart      # Banner üzərindəki düymələr
    │           ├── home_movie_section.dart         # Horizontal film bölməsi şablonu
    │           ├── movie_card.dart                 # Fərdi film kartı
    │           └── home_shimmer.dart               # Ana səhifə üçün yüklənmə skleti
    │
    ├── search/                        # Axtarış Modulu (Həm Filmlər, Həm Aktyorlar)
    │   ├── data/
    │   │   ├── datasources/
    │   │   │   └── search_remote_data_source.dart  # Multi-search API sorğuları
    │   │   ├── models/
    │   │   │   └── search_result_model.dart        # Dinamik media-tipli nəticə modeli
    │   │   └── repositories/
    │   │       └── search_repository_impl.dart     # Axtarış repozitoriya tətbiqi
    │   ├── domain/
    │   │   ├── repositories/
    │   │   │   └── search_repository.dart          # Abstrakt axtarış repozitoriyası
    │   │   └── usecases/
    │   │       ├── search_movies.dart              # Multi-search sorğu istifadə ssenarisi
    │   │       └── get_genres.dart                 # Janrları çəkən use case
    │   └── presentation/
    │       ├── cubit/
    │       │   ├── search_cubit.dart               # Debounce mexanizmli axtarış Cubit-i
    │       │   └── search_state.dart               # Axtarış vəziyyətlərinin təyini
    │       ├── pages/
    │       │   └── search_page.dart                # Dinamik başlıqlı axtarış səhifəsi
    │       └── widgets/
    │           ├── search_header.dart              # Giriş sahəsi (TextField) komponenti
    │           ├── category_list.dart              # Parıltısız ChoiceChip janr siyahısı
    │           ├── movie_grid.dart                 # Qarışıq film/aktyor qrid siyahısı
    │           └── search_grid_shimmer.dart        # Dairəvi və düzbucaqlı qarışıq sklet
    │
    ├── media_detail/                  # Film Detalları Modulu
    │   ├── data/
    │   │   ├── datasources/
    │   │   │   └── media_detail_remote_data_source.dart  # Detal API sorğuları
    │   │   ├── models/
    │   │   │   ├── movie_detail_model.dart         # Film detalları modeli
    │   │   │   └── cast_model.dart                 # Aktyor heyəti modeli
    │   │   └── repositories/
    │   │       └── media_detail_repository_impl.dart     # Detal repo impl
    │   ├── domain/
    │   │   ├── entities/
    │   │   │   ├── movie_detail.dart               # Detal biznes entitysi
    │   │   │   └── cast.dart                       # Aktyor heyəti entitysi
    │   │   ├── repositories/
    │   │   │   └── media_detail_repository.dart    # Abstrakt detal repozitoriyası
    │   │   └── usecases/
    │   │       ├── get_movie_details.dart          # Detalları gətirmə use case-i
    │   │       ├── get_movie_cast.dart             # Kast siyahısını gətirmə use case-i
    │   │       ├── get_movie_trailer.dart          # Trailer linkini çəkən use case
    │   │       └── get_similar_movies.dart         # Oxşar filmlər use case-i
    │   └── presentation/
    │       ├── cubit/
    │       │   ├── media_detail_cubit.dart         # Detal səhifəsi Cubit-i
    │       │   └── media_detail_state.dart         # Detal dövlət vəziyyətləri
    │       ├── pages/
    │       │   └── media_detail_page.dart          # Detal ekranı əsas UI
    │       └── widgets/
    │           ├── detail_header.dart              # Arxa fon və reytinqli başlıq
    │           ├── cast_section.dart               # Aktyorların horizontal siyahısı
    │           ├── similar_movies_section.dart     # Tövsiyə olunan filmlər qovluğu
    │           ├── trailer_player.dart             # YouTube iframe pleyer vidceti
    │           └── detail_shimmer.dart             # Detal səhifəsi üçün yüklənmə paneli
    │
    ├── actor/                         # Aktyor Profil Modulu
    │   ├── data/
    │   │   ├── datasources/
    │   │   │   └── actor_remote_data_source.dart   # Aktyor məlumatları üçün API mənbəyi
    │   │   ├── models/
    │   │   │   └── actor_model.dart                # Aktyor profil məlumat modeli
    │   │   └── repositories/
    │   │       └── actor_repository_impl.dart      # Aktyor repozitoriya tətbiqi
    │   ├── domain/
    │   │   ├── entities/
    │   │   │   └── actor.dart                      # Aktyor profil entitysi
    │   │   ├── repositories/
    │   │   │   └── actor_repository.dart           # Abstrakt aktyor repozitoriyası
    │   │   └── usecases/
    │   │       └── get_actor_details.dart          # Profil detallarını gətirən use case
    │   └── presentation/
    │       ├── cubit/
    │       │   ├── actor_cubit.dart                # Aktyor məlumatları üçün Cubit
    │       │   └── actor_state.dart                # Aktyor dövlət vəziyyətləri
    │       ├── pages/
    │       │   └── actor_page.dart                 # Aktyor profil səhifəsi UI
    │       └── widgets/
    │           ├── actor_header.dart               # Bioqrafiya və foto komponenti
    │           ├── actor_filmography.dart          # Aktyorun tanınmış filmlər siyahısı
    │           └── actor_shimmer.dart              # Profil üçün yüklənmə skleti
    │
    ├── watchlist/                     # Watchlist (Lokal Yaddaş) Modulu
    │   ├── data/
    │   │   ├── datasources/
    │   │   │   └── watchlist_local_data_source.dart     # GetStorage ilə lokal baza idarəsi
    │   │   └── repositories/
    │   │       └── watchlist_repository_impl.dart       # Watchlist repozitoriya tətbiqi
    │   ├── domain/
    │   │   ├── repositories/
    │   │   │   └── watchlist_repository.dart      # Abstrakt yaddaş repozitoriyası
    │   │   └── usecases/
    │   │       ├── add_to_watchlist.dart          # Film əlavə etmə ssenarisi
    │   │       ├── remove_from_watchlist.dart     # Filmi silmə ssenarisi
    │   │       └── get_watchlist.dart             # Siyahını çəkmə ssenarisi
    │   └── presentation/
    │       ├── cubit/
    │       │   ├── watchlist_cubit.dart           # Watchlist məlumat axını Cubit-i
    │       │   └── watchlist_state.dart           # Watchlist dövlət vəziyyətləri
    │       ├── pages/
    │       │   └── watchlist_page.dart            # Şəxsi yaddaş siyahısı ekranı
    │       └── widgets/
    │           ├── watchlist_item.dart            # Siyahıdakı fərdi film kartı
    │           ├── empty_watchlist.dart           # Siyahı boş olduqda çıxan xüsusi UI
    │           └── watchlist_shimmer.dart         # 3 sütunlu xüsusi watchlist skleti
    │
    └── profile/                       # İstifadəçi Profil Modulu
        ├── data/
        │   ├── datasources/
        │   │   └── profile_local_data_source.dart      # Lokal istifadəçi məlumat bazası
        │   ├── models/
        │   │   └── user_model.dart                     # İstifadəçi data modeli
        │   └── repositories/
        │       └── profile_repository_impl.dart        # Profil repozitoriya tətbiqi
        ├── domain/
        │   ├── entities/
        │   │   └── user.dart                           # İstifadəçi biznes entitysi
        │   ├── repositories/
        │   │   └── profile_repository.dart             # Abstrakt profil repozitoriyası
        │   └── usecases/
        │       ├── get_user_profile.dart               # Profili oxuyan use case
        │       └── update_user_profile.dart            # Profili yeniləyən use case
        └── presentation/
            ├── cubit/
            │   ├── profile_cubit.dart                  # Profil məlumatları üçün Cubit
            │   └── profile_state.dart                  # Profil dövlət vəziyyətləri
            ├── pages/
            │   └── profile_page.dart                   # Profil ekranı UI
            └── widgets/
                ├── profile_header.dart                 # İstifadəçi şəkli və adı
                ├── profile_stats.dart                  # İstifadəçi statistikaları
                └── profile_settings.dart               # Tənzimləmələr menyusu
└── main.dart
