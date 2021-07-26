part of '../utilities.dart';

class UtilitiesRemoteDataSource {
  Future<void> getIransCitiesOnline({
    required String url,
    required Function(IransCity) action,
    required Function error,
    bool saveData = true,
  }) async =>
      get(
        url: url,
        action: (response) {
          IransCity data = IransCity.fromJson(response!.body);
          if (saveData) setData(Constant.iransCity, response.body);
          action(data);
        },
        error: (response) => error(),
      );

  IransCity? getIransCitiesOffline() {
    if (getString(Constant.iransCity) == null) return null;
    return IransCity.fromJson(getString(Constant.iransCity)!);
  }
}
