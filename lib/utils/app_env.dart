class AppEnv {
  const AppEnv();

  static const String supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://elvkjtexvfluglelpnlu.supabase.co',
  );
  static const String supabaseAnonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImVsdmtqdGV4dmZsdWdsZWxwbmx1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjQ0OTU1NDQsImV4cCI6MjA4MDA3MTU0NH0.HiaFzCF76kQodAYtSnOoxugpETym8GeY6X7DeSTWRhw',
  );

  bool get hasSupabaseConfig =>
      supabaseUrl.isNotEmpty && supabaseAnonKey.isNotEmpty;
}
