import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {


  late SharedPreferencesWithCache prefsWithCache;
  Future<void> init()async{
    prefsWithCache = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(
        // When an allowlist is included, any keys that aren't included cannot be used.
        allowList: <String>{'repeat', 'action'},
      ),
    );
  }

    Future<void> putBoolData({required String key,required bool value})async{
  await prefsWithCache.setBool(key, value);
}

bool? getData({required String key}){
  return prefsWithCache.getBool(key);
}





}