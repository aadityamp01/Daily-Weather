import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error.freezed.dart';

@freezed
class APIError with _$APIError {
  const factory APIError.invalidApiKey() = _InvalidApiKey;
  const factory APIError.noInternetConnection() = _NoInternetConnection;
  const factory APIError.notFound() = _NotFound;
  const factory APIError.unknown() = _Unknown;
}

extension WeatherErrorAsync on APIError {
  AsyncValue<T> asAsyncValue<T>() => when(
        invalidApiKey: () => AsyncValue.error('Invalid API key', StackTrace.current),
        noInternetConnection: () =>
            AsyncValue.error('No Internet connection', StackTrace.current),
        notFound: () => AsyncValue.error('City not found', StackTrace.current),
        unknown: () =>  AsyncValue.error('Some error occurred', StackTrace.current),
      );
}
