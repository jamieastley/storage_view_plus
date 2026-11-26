<h1 align="center"> StorageViewPlus 🔎</h1>
<h3 align="center"> Flutter inspector tool for any database, storage and shared_preferences. <br>Check and modify database values from UI of application.</h3>
<p align="center">A maintained fork of <a href="https://github.com/Frezyx/storage_view">Frezyx/storage_view</a>, who created the original StorageView packages.</p>

<div align="center" >
  <a href="https://github.com/jamieastley/storage_view_plus/blob/main/docs/assets/storage_view_desktop.gif?raw=true">
    <img src="https://github.com/jamieastley/storage_view_plus/blob/main/docs/assets/storage_view_desktop.gif?raw=true"/>
  </a>
</div>

## Getting started
Follow these steps to use this package

### Add dependency

```yaml
dependencies:
  storage_view_plus: <version>
```

### Add import package

```dart
import 'package:storage_view_plus/storage_view.dart';
```

### Implement driver
The package uses a driver [StorageDriver](https://github.com/jamieastley/storage_view_plus/blob/main/packages/storage_view_plus/lib/src/models/storage_driver.dart) to interact with the database. <br>
In order to connect your database you should use one of available drivers: <br>

- [shared_preferences_storage_view_driver](https://github.com/jamieastley/storage_view_plus/tree/main/packages/shared_preferences_storage_view_driver) that works with [shared_preferences](https://pub.dev/packages/shared_preferences) <br> See [example](https://github.com/Frezyx/storage_view_plus/tree/main/packages/shared_preferences_storage_view_driver/example) for more information
- [flutter_secure_storage_view_driver](https://github.com/jamieastley/storage_view_plus/tree/main/packages/flutter_secure_storage_view_driver) that works with [flutter_secure_storage](https://pub.dev/packages/flutter_secure_storage) <br> See [example](https://github.com/Frezyx/storage_view_plus/tree/main/packages/flutter_secure_storage_view_driver/example) for more information

Or create your own StorageDriver implementation like there:
```dart
class MockStorageDriver implements StorageDriver {
  final _data = <String, dynamic>{
    'test_id' : 'test',
  };

  @override
  FutureOr<Set<String>> getKeys<String>() {
    return _data.keys.toSet() as Set<String>;
  }

  @override
  FutureOr<T?> read<T>(String key) {
    return _data[key] as T;
  }

  @override
  FutureOr<void> write<T>({required String key, required T value}) {
    _data[key] = value;
  }

  @override
  FutureOr<void> delete(String key) {
    _data.remove(key);
  }
}
```

### Implement StoargeView
After the driver was connected, you can use StorageView anywhere in your application.
```dart
final _mockStorageDriver = MockStorageDriver();
Scaffold(
    body: StorageView(storageDriver: _mockStorageDriver),
),
```

## Issues

For any issues, please create an issue on the correct [GitHub repository](https://github.com/jamieastley/storage_view_plus/issues).
