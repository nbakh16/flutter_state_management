import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoggerRiverpod extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log('======didUpdateProvider======'
        '\nProvider: $provider, '
        '\nPrevious Value: $previousValue, '
        '\nNew Value: $newValue');
    super.didUpdateProvider(provider, previousValue, newValue, container);
  }

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    log('======didAddProvider======'
        '\nProvider: $provider, '
        '\nValue: $value');
    super.didAddProvider(provider, value, container);
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    log('======didDisposeProvider======'
        '\nProvider: $provider');
    super.didDisposeProvider(provider, container);
  }
}
