# 3qar

🏠 Real Estate App
A mobile application built for real estate management that serves three types of users: Buyers, Sellers, and Admins. The app allows property owners to list their assets, buyers to explore and purchase real estate, and admins to manage the overall system and moderate activity. Fast, scalable, and user-friendly, this is your go-to real estate companion.

## 📱 Features
👤 Multiple User Roles
Support for Sellers, Buyers, and Admins with role-based access.

🏡 Property Listings
Sellers can add, edit, and manage their properties with photos, prices, and details.

🔍 Smart Search & Filters
Buyers can browse properties by price, location, type, and more.

📩 In-App Chat (optional/coming soon)
Direct chat between buyers and sellers to negotiate or ask questions.

📊 Admin Panel
Admins can manage users, block listings, and ensure the smooth operation of the platform.

## 🛠️ Tech Stack
Flutter – Cross-platform mobile development

Dart – Core language for Flutter

Supabase – Backend and Authentication

Bloc for State management

Google Maps API – Property location & maps


## 🚀 Getting Started

### Prerequisites

- Flutter SDK (^3.6.0 or higher)
- Dart SDK
- Android Studio / VS Code / Cursor
- An Android/iOS device or emulator

### Installation

Clone the repo

> git clone https://github.com/KarimSlama/aqar.git<br>
cd 3qar

-- Install dependencies
> flutter pub get

-- Generate code
> flutter pub run build_runner build --delete-conflicting-outputs

-- Run the app
> flutter run --release -t lib/main_production.dart --flavor production

## Running Tests

### Run all tests

```bash
flutter test
```

### Run unit tests

```bash
flutter test test/unit
```

### Run widget tests

```bash
flutter test test/widget
```

### Run integration tests

```bash
flutter test integration_test
```


## 🎨 UI Preview
You can check out the UI design on Figma or Behance:


## 📂 Project Structur

```
aqar
│  ├─ build.gradle
│  ├─ fastlane
│  │  ├─ Appfile
│  │  ├─ Fastfile
│  │  ├─ Pluginfile
│  │  ├─ README.md
│  │  └─ report.xml
│  ├─ Gemfile
│  ├─ Gemfile.lock
│  ├─ gradle
│  │  └─ wrapper
│  │     ├─ gradle-wrapper.jar
│  │     └─ gradle-wrapper.properties
│  ├─ gradle.properties
│  ├─ gradlew
│  ├─ gradlew.bat
│  ├─ local.properties
│  └─ settings.gradle
├─ assets
│  ├─ icons
│  │  ├─ call.svg
│  │  ├─ chat.svg
│  │  ├─ coupon.svg
│  │  ├─ facebook.svg
│  │  ├─ google.svg
│  │  ├─ link.svg
│  │  ├─ nearby.svg
│  │  ├─ rent.svg
│  │  ├─ support.svg
│  │  └─ whatsapp.svg
│  └─ images
│     ├─ chatbot.json
│     ├─ empty.json
│     ├─ house.png
│     ├─ house2.png
│     ├─ house3.png
│     ├─ house4.png
│     ├─ house4.svg
│     ├─ house5.png
│     ├─ house5.svg
│     ├─ house6.png
│     ├─ house7.png
│     ├─ login_img.svg
│     ├─ logo.png
│     └─ splash_bg_image.png
├─ devtools_options.yaml
├─ firebase.json
├─ flutter_launcher_icons.yaml
├─ lib
│  ├─ 3qar
│  │  ├─ admin_app
│  │  ├─ buyer_app
│  │  │  ├─ all_units
│  │  │  │  └─ all_units_screen.dart
│  │  │  ├─ buyer_navigation_menu
│  │  │  │  ├─ buyer_navigation_menu.dart
│  │  │  │  ├─ controller
│  │  │  │  │  ├─ buyer_navigation_cubit.dart
│  │  │  │  │  ├─ buyer_navigation_state.dart
│  │  │  │  │  └─ buyer_navigation_state.freezed.dart
│  │  │  │  └─ widget
│  │  │  │     └─ buyer_custom_bottom_nav.dart
│  │  │  ├─ chat
│  │  │  │  ├─ chat_screen.dart
│  │  │  │  ├─ cubit
│  │  │  │  │  ├─ chat_list_cubit.dart
│  │  │  │  │  ├─ chat_list_state.dart
│  │  │  │  │  └─ chat_list_state.freezed.dart
│  │  │  │  └─ data
│  │  │  │     ├─ model
│  │  │  │     │  ├─ chat_user_model.dart
│  │  │  │     │  └─ chat_user_model.g.dart
│  │  │  │     ├─ network
│  │  │  │     │  ├─ chat_service.dart
│  │  │  │     │  └─ chat_service_impl.dart
│  │  │  │     └─ repository
│  │  │  │        └─ chat_list_repository.dart
│  │  │  ├─ conversation
│  │  │  │  ├─ conversation_screen.dart
│  │  │  │  ├─ cubit
│  │  │  │  │  ├─ message_cubit.dart
│  │  │  │  │  ├─ message_state.dart
│  │  │  │  │  └─ message_state.freezed.dart
│  │  │  │  ├─ data
│  │  │  │  │  ├─ model
│  │  │  │  │  │  ├─ message_model.dart
│  │  │  │  │  │  └─ message_model.g.dart
│  │  │  │  │  ├─ network
│  │  │  │  │  │  ├─ message_service.dart
│  │  │  │  │  │  └─ message_service_impl.dart
│  │  │  │  │  └─ repository
│  │  │  │  │     └─ message_repository.dart
│  │  │  │  └─ widget
│  │  │  │     ├─ chat_text_with_image.dart
│  │  │  │     └─ message_input_text_field.dart
│  │  │  ├─ customer_service
│  │  │  │  ├─ cubit
│  │  │  │  │  ├─ customer_service_cubit.dart
│  │  │  │  │  └─ customer_service_state.dart
│  │  │  │  ├─ customer_service_screen.dart
│  │  │  │  ├─ data
│  │  │  │  │  ├─ model
│  │  │  │  │  │  └─ chat_message_model.dart
│  │  │  │  │  ├─ network
│  │  │  │  │  │  └─ customer_service.dart
│  │  │  │  │  └─ repository
│  │  │  │  │     └─ customer_service_repository.dart
│  │  │  │  └─ widgets
│  │  │  │     ├─ build_welcome_screen.dart
│  │  │  │     ├─ chat_message_bubble.dart
│  │  │  │     └─ dots_loading_animation.dart
│  │  │  ├─ favorite
│  │  │  │  ├─ controller.dart
│  │  │  │  │  └─ cubit
│  │  │  │  │     ├─ favorites_cubit.dart
│  │  │  │  │     ├─ favorites_state.dart
│  │  │  │  │     └─ favorites_state.freezed.dart
│  │  │  │  ├─ data
│  │  │  │  │  ├─ favorites_repository.dart
│  │  │  │  │  ├─ model
│  │  │  │  │  │  ├─ favorite_model.dart
│  │  │  │  │  │  └─ favorite_model.g.dart
│  │  │  │  │  └─ network
│  │  │  │  │     ├─ favorite_service.dart
│  │  │  │  │     └─ favorite_service_impl.dart
│  │  │  │  └─ favorite_screen.dart
│  │  │  ├─ help_and_info
│  │  │  │  └─ help_and_info_screen.dart
│  │  │  ├─ home
│  │  │  │  ├─ controller
│  │  │  │  │  ├─ categories
│  │  │  │  │  │  └─ cubit
│  │  │  │  │  │     ├─ categories_cubit.dart
│  │  │  │  │  │     └─ categories_state.dart
│  │  │  │  │  ├─ home
│  │  │  │  │  │  ├─ home_cubit.dart
│  │  │  │  │  │  ├─ home_state.dart
│  │  │  │  │  │  └─ home_state.freezed.dart
│  │  │  │  │  └─ search
│  │  │  │  │     └─ bloc
│  │  │  │  │        ├─ search_bloc.dart
│  │  │  │  │        ├─ search_event.dart
│  │  │  │  │        └─ search_state.dart
│  │  │  │  ├─ data
│  │  │  │  │  ├─ model
│  │  │  │  │  │  ├─ developer_request_model.dart
│  │  │  │  │  │  ├─ developer_request_model.g.dart
│  │  │  │  │  │  ├─ filter_data.dart
│  │  │  │  │  │  ├─ home_enum.dart
│  │  │  │  │  │  ├─ property_details_model.dart
│  │  │  │  │  │  ├─ property_details_model.g.dart
│  │  │  │  │  │  ├─ property_feature_model.dart
│  │  │  │  │  │  ├─ property_feature_model.g.dart
│  │  │  │  │  │  ├─ property_image_model.dart
│  │  │  │  │  │  ├─ property_image_model.g.dart
│  │  │  │  │  │  ├─ unit_request_model.dart
│  │  │  │  │  │  └─ unit_request_model.g.dart
│  │  │  │  │  ├─ network
│  │  │  │  │  │  ├─ property_service.dart
│  │  │  │  │  │  └─ property_service_impl.dart
│  │  │  │  │  └─ repository
│  │  │  │  │     ├─ properties_repository.dart
│  │  │  │  │     └─ units_repository.dart
│  │  │  │  ├─ home_screen.dart
│  │  │  │  └─ widgets
│  │  │  │     ├─ categories_item_buttons.dart
│  │  │  │     ├─ categories_list_buttons.dart
│  │  │  │     ├─ category_filtered_properties.dart
│  │  │  │     ├─ filteration
│  │  │  │     │  ├─ area_filter_section.dart
│  │  │  │     │  ├─ bathrooms_filter_section.dart
│  │  │  │     │  ├─ filter_drawer.dart
│  │  │  │     │  ├─ filter_drawer_header.dart
│  │  │  │     │  ├─ location_filter_section.dart
│  │  │  │     │  ├─ price_filter_section.dart
│  │  │  │     │  ├─ property_type_filter_section.dart
│  │  │  │     │  └─ rooms_filter_section.dart
│  │  │  │     ├─ filter_home_screen_container.dart
│  │  │  │     ├─ filter_menu_items.dart
│  │  │  │     ├─ flexible_text_form_field.dart
│  │  │  │     ├─ home_app_bar.dart
│  │  │  │     ├─ list_of_searched_properties.dart
│  │  │  │     ├─ property_card.dart
│  │  │  │     ├─ property_search_card.dart
│  │  │  │     ├─ recommended_for_you_item_card.dart
│  │  │  │     ├─ recommended_for_you_list_of_cards.dart
│  │  │  │     ├─ recommended_page_view_property.dart
│  │  │  │     ├─ unit_building_card_item.dart
│  │  │  │     └─ unit_building_list_of_cards.dart
│  │  │  ├─ notifications
│  │  │  │  └─ notifications_screen.dart
│  │  │  ├─ personal_information
│  │  │  │  ├─ personal_information_screen.dart
│  │  │  │  └─ widget
│  │  │  │     ├─ about_me_section_with_text_field.dart
│  │  │  │     ├─ recent_properties_related_to_current_user.dart
│  │  │  │     └─ user_review.dart
│  │  │  ├─ profile
│  │  │  │  ├─ controller
│  │  │  │  │  ├─ profile
│  │  │  │  │  │  ├─ profile_cubit.dart
│  │  │  │  │  │  ├─ profile_state.dart
│  │  │  │  │  │  └─ profile_state.freezed.dart
│  │  │  │  │  └─ theme
│  │  │  │  │     └─ cubit
│  │  │  │  │        ├─ theme_cubit.dart
│  │  │  │  │        └─ theme_state.dart
│  │  │  │  ├─ data
│  │  │  │  │  ├─ model
│  │  │  │  │  │  ├─ profile_enum.dart
│  │  │  │  │  │  ├─ seller_rating_model.dart
│  │  │  │  │  │  └─ seller_rating_model.g.dart
│  │  │  │  │  ├─ network
│  │  │  │  │  │  ├─ profile_service.dart
│  │  │  │  │  │  └─ profile_service_impl.dart
│  │  │  │  │  └─ repository
│  │  │  │  │     └─ profile_repository.dart
│  │  │  │  ├─ profile_screen.dart
│  │  │  │  └─ widget
│  │  │  │     ├─ personal_information_row_and_account_details_tile.dart
│  │  │  │     └─ theme_mode_icon_toggle.dart
│  │  │  ├─ profile_details
│  │  │  │  ├─ profile_details_screen.dart
│  │  │  │  └─ widget
│  │  │  │     ├─ profile_details_bloc_listener.dart
│  │  │  │     ├─ profile_image_with_edit_icon.dart
│  │  │  │     └─ update_contact_personal_information.dart
│  │  │  ├─ property_details
│  │  │  │  ├─ data
│  │  │  │  │  └─ model
│  │  │  │  │     └─ property_args.dart
│  │  │  │  ├─ property_details_screen.dart
│  │  │  │  └─ widgets
│  │  │  │     ├─ icons_heading_with_text_and_price_in_month.dart
│  │  │  │     ├─ luxury_property_details.dart
│  │  │  │     ├─ property_details_bottom_sheet.dart
│  │  │  │     ├─ property_features_details.dart
│  │  │  │     ├─ property_features_icon_with_text_widget.dart
│  │  │  │     ├─ property_images_bottom_sheet.dart
│  │  │  │     ├─ property_map_dialog.dart
│  │  │  │     ├─ property_name_with_location_and_map_icon.dart
│  │  │  │     ├─ property_payment_plans.dart
│  │  │  │     ├─ property_photos.dart
│  │  │  │     └─ toggle_map_theme_icon.dart
│  │  │  ├─ property_rating
│  │  │  │  ├─ controller
│  │  │  │  │  └─ cubit
│  │  │  │  │     ├─ rating_cubit.dart
│  │  │  │  │     ├─ rating_state.dart
│  │  │  │  │     └─ rating_state.freezed.dart
│  │  │  │  ├─ data
│  │  │  │  │  ├─ model
│  │  │  │  │  │  ├─ property_ratings_summary_model.dart
│  │  │  │  │  │  ├─ property_ratings_summary_model.g.dart
│  │  │  │  │  │  ├─ rating_model.dart
│  │  │  │  │  │  ├─ rating_model.g.dart
│  │  │  │  │  │  ├─ star_rating_count_model.dart
│  │  │  │  │  │  └─ star_rating_count_model.g.dart
│  │  │  │  │  ├─ network
│  │  │  │  │  │  ├─ rating_service.dart
│  │  │  │  │  │  └─ rating_service_impl.dart
│  │  │  │  │  └─ repository
│  │  │  │  │     └─ rating_repository.dart
│  │  │  │  ├─ property_rating_screen.dart
│  │  │  │  └─ widgets
│  │  │  │     ├─ list_of_user_ratings_card.dart
│  │  │  │     ├─ overall_property_rating.dart
│  │  │  │     └─ rating_progress_indicator.dart
│  │  │  ├─ recommended_for_you_all_properties
│  │  │  │  └─ recommended_for_you_all_properties_screen.dart
│  │  │  ├─ support
│  │  │  │  ├─ support_screen.dart
│  │  │  │  └─ widget
│  │  │  │     ├─ contact_details_widget.dart
│  │  │  │     ├─ contact_us_header.dart
│  │  │  │     ├─ custom_app_bar_leading_widget.dart
│  │  │  │     ├─ facebook_url_widget.dart
│  │  │  │     ├─ social_media_platform.dart
│  │  │  │     ├─ website_url_widget.dart
│  │  │  │     └─ whatsapp_url_widget.dart
│  │  │  └─ video_call
│  │  │     └─ video_call_screen.dart
│  │  ├─ login
│  │  │  ├─ controller
│  │  │  │  ├─ login_cubit.dart
│  │  │  │  ├─ login_state.dart
│  │  │  │  └─ login_state.freezed.dart
│  │  │  ├─ data
│  │  │  │  ├─ models
│  │  │  │  │  └─ login_request_body.dart
│  │  │  │  └─ repository
│  │  │  │     └─ login_repository.dart
│  │  │  ├─ login_screen.dart
│  │  │  └─ widget
│  │  │     ├─ login_bloc_listener.dart
│  │  │     └─ login_text_form_fields.dart
│  │  ├─ login_option
│  │  │  ├─ login_option_screen.dart
│  │  │  └─ widgets
│  │  │     ├─ continue_with_email_login.dart
│  │  │     ├─ grid_view_for_top_images.dart
│  │  │     └─ social_method.dart
│  │  ├─ onboarding
│  │  │  ├─ model
│  │  │  │  └─ boarding_model.dart
│  │  │  ├─ onboarding_screen.dart
│  │  │  └─ widgets
│  │  │     ├─ boarding_action_buttons.dart
│  │  │     ├─ image_with_action_buttons_and_progress_bar.dart
│  │  │     └─ onboarding_page_view.dart
│  │  ├─ seller_app
│  │  ├─ sign_up
│  │  │  ├─ controller
│  │  │  │  └─ cubit
│  │  │  │     ├─ sign_up_cubit.dart
│  │  │  │     ├─ sign_up_state.dart
│  │  │  │     └─ sign_up_state.freezed.dart
│  │  │  ├─ data
│  │  │  │  ├─ model
│  │  │  │  │  ├─ sign_up_form_user_type.dart
│  │  │  │  │  ├─ user_model.dart
│  │  │  │  │  └─ user_model.g.dart
│  │  │  │  └─ repository
│  │  │  │     └─ sign_up_repository.dart
│  │  │  ├─ sign_up_screen.dart
│  │  │  └─ widgets
│  │  │     ├─ sign_up_bloc_listener.dart
│  │  │     └─ sign_up_text_form_fields.dart
│  │  └─ splash
│  │     └─ splash_screen.dart
│  ├─ aqar_app.dart
│  ├─ core
│  │  ├─ common
│  │  │  └─ widgets
│  │  │     ├─ app_bar
│  │  │     │  ├─ main_app_bar.dart
│  │  │     │  └─ normal_app_bar.dart
│  │  │     ├─ aqar_text_form_field.dart
│  │  │     ├─ card
│  │  │     │  └─ user_review_card.dart
│  │  │     ├─ circulars
│  │  │     │  ├─ circular_container.dart
│  │  │     │  └─ circular_container_with_shadow.dart
│  │  │     ├─ container
│  │  │     │  └─ rounded_container.dart
│  │  │     ├─ dialog
│  │  │     │  └─ logout_alert_dialog.dart
│  │  │     ├─ get_location_address.dart
│  │  │     ├─ icons
│  │  │     │  ├─ favorite_icons.dart
│  │  │     │  ├─ map_icon.dart
│  │  │     │  └─ rating_circular_container_with_text_and_icon.dart
│  │  │     ├─ images
│  │  │     │  └─ cached_images.dart
│  │  │     ├─ inputs
│  │  │     │  └─ aqar_input_text_field.dart
│  │  │     ├─ layout
│  │  │     │  ├─ grid_view_layout.dart
│  │  │     │  └─ main_layout.dart
│  │  │     ├─ list_tiles
│  │  │     │  └─ settings_menu_tile.dart
│  │  │     ├─ loaders
│  │  │     │  ├─ animation_loader.dart
│  │  │     │  ├─ aqar_shimmer.dart
│  │  │     │  ├─ profile_shimmer_loading.dart
│  │  │     │  ├─ properties_shimmer_loading.dart
│  │  │     │  ├─ rating_shimmer_loading.dart
│  │  │     │  └─ recommended_property_shimmer.dart
│  │  │     ├─ popups
│  │  │     │  ├─ full_screen_loader.dart
│  │  │     │  └─ loaders.dart
│  │  │     ├─ properties
│  │  │     │  └─ aqar_rating_bar_indicator.dart
│  │  │     ├─ row
│  │  │     │  ├─ developer_logo_with_location_and_property_name_row.dart
│  │  │     │  ├─ row_icon_with_title.dart
│  │  │     │  └─ title_with_icon_in_row.dart
│  │  │     ├─ separators
│  │  │     │  └─ heigth_separators.dart
│  │  │     └─ texts
│  │  │        ├─ header_text_with_subtitle.dart
│  │  │        ├─ property_text_with_definition.dart
│  │  │        ├─ read_more_texts.dart
│  │  │        ├─ register_text_button.dart
│  │  │        ├─ section_heading.dart
│  │  │        ├─ text_span.dart
│  │  │        └─ title_with_subtitle_in_column.dart
│  │  ├─ constants
│  │  │  ├─ aqar_colors.dart
│  │  │  ├─ aqar_sizes.dart
│  │  │  ├─ aqar_string.dart
│  │  │  ├─ constants.dart
│  │  │  └─ location_constants.dart
│  │  ├─ devices
│  │  │  └─ device_utility.dart
│  │  ├─ formatters
│  │  │  └─ aqar_formatters.dart
│  │  ├─ helpers
│  │  │  ├─ extensions.dart
│  │  │  └─ helper_functions.dart
│  │  ├─ local_storage
│  │  │  └─ local_storage.dart
│  │  ├─ network
│  │  │  ├─ register
│  │  │  │  ├─ register_service.dart
│  │  │  │  └─ register_service_impl.dart
│  │  │  ├─ server_result.dart
│  │  │  ├─ server_result.freezed.dart
│  │  │  └─ users
│  │  │     ├─ user_service.dart
│  │  │     └─ user_service_impl.dart
│  │  ├─ routing
│  │  │  ├─ app_router.dart
│  │  │  └─ routes.dart
│  │  ├─ service_locator
│  │  │  └─ get_it.dart
│  │  ├─ theme
│  │  │  ├─ custom_themes
│  │  │  │  └─ aqar_text_theme.dart
│  │  │  ├─ dark_theme.dart
│  │  │  └─ light_theme.dart
│  │  ├─ utils
│  │  │  ├─ favorites_exception.dart
│  │  │  ├─ rating_model_args.dart
│  │  │  └─ request_enum.dart
│  │  └─ validation
│  │     └─ validator.dart
│  ├─ firebase_options.dart
│  ├─ gen
│  │  └─ assets.gen.dart
│  └─ main.dart
├─ pubspec.lock
├─ pubspec.yaml
├─ README.md

```

## Design Cover
![cover upwork](https://github.com/user-attachments/assets/5b680fb2-3520-4424-a197-0a5998cd8bec)


## 👨‍💻 Author

[![Contributors](https://contrib.rocks/image?repo=KarimSlama/testing_all_widgets_flutter)](https://github.com/KarimSlama/testing_all_widgets_flutter/graphs/contributors) **Karim Slama**

- GitHub: [@Karim Slama](https://github.com/KarimSlama)
- LinkedIn: [Karim Slama](https://linkedin.com/in/karim-slama-)
