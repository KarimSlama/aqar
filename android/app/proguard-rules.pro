-keep class **.zego.** { *; }
-keep class com.google.android.gms.** { *; }
-keep class com.google.api.client.** { *; }
-dontwarn com.google.android.gms.**
-dontwarn com.google.api.client.**

# Keep Supabase classes
-keep class io.supabase.** { *; }
-dontwarn io.supabase.**