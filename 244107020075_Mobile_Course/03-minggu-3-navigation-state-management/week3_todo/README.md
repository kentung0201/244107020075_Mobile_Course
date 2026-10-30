
# 5. AI Challenge - Flutter Riverpod

## Overview

This challenge demonstrates the use of AI as a co-developer in building a Flutter application using Riverpod for asynchronous state management.

The objective is to create a statistics page that handles three asynchronous states: Loading, Error, and Success. AI is used to generate the initial implementation, while the developer is responsible for reviewing, understanding, verifying, and testing the generated code.

## Features

- **Loading State:** Displays a CircularProgressIndicator while fetching statistics.
- **Error State:** Displays an error message and a Retry button when fetching data fails.
- **Success State:** Displays three statistics in a ListView.
- **Random Failure Simulation:** Simulates a server failure with approximately a 30% probability.
- **Unit Testing:** Verifies that the statistics provider returns the expected data.

## Project Structure

```text
lib/
├── main.dart
├── pages/
│   ├── todo_page.dart
│   ├── product_page.dart
│   └── stats_page.dart
└── providers/
    ├── todo_provider.dart
    ├── products_provider.dart
    └── stats_provider.dart

test/
└── stats_provider_test.dart

docs/
└── AI_CHALLENGE.md
```

## Implementation Details

### 1. StatsNotifier

Implemented using `AsyncNotifier<List<String>>` to manage asynchronous statistics data.

The provider:
- Simulates a 2-second network delay.
- Generates a random number to simulate a 30% chance of failure.
- Returns three statistics when the request succeeds.
- Throws an exception when the request fails.

### 2. StatsPage

Implemented using `ConsumerWidget` to listen to the statistics provider.

The interface uses `AsyncValue.when()` to handle three states:

| State | UI Behavior |
|---|---|
| Loading | Displays a CircularProgressIndicator |
| Error | Displays an error message and Retry button |
| Success | Displays three statistics using ListView.builder |

The Retry button uses `ref.invalidate(statsProvider)` to invalidate the provider and trigger another data request.

### 3. Unit Testing

A unit test was created in `test/stats_provider_test.dart`.

A dedicated `TestStatsNotifier` is used to provide predictable test data without random failures or unnecessary delays.

The test verifies:
- The provider returns exactly three statistics.
- The first item is Total Users: 120.
- The second item is Active Tasks: 45.
- The third item is Completed Tasks: 75.

## AI Development Process

AI was used as a co-developer to generate the initial implementation.

The generated code was reviewed and verified based on the following criteria:

- Immutable state management.
- Correct usage of `ref.watch()` inside the build method.
- Correct provider interaction through callbacks.
- Complete handling of Loading, Error, and Success states.
- Explicit provider type declaration.
- Use of modern Riverpod APIs.
- Unit test implementation.

The AI prompt, implementation notes, verification checklist, and test results are documented in:

`docs/AI_CHALLENGE.md`

## Verification and Testing

The following commands were used to verify the implementation:

```bash
flutter pub get
flutter analyze
flutter test
```

### Test Results

| Verification | Result |
|---|---|
| Flutter Analyze | [Fill in actual result] |
| Flutter Test | [Fill in actual result] |
| Loading State | [Passed / Failed] |
| Error State | [Passed / Failed] |
| Success State | [Passed / Failed] |
| Retry Function | [Passed / Failed] |

## Conclusion

This challenge demonstrates how Riverpod's AsyncNotifier and AsyncValue simplify asynchronous state management in Flutter applications.

By handling Loading, Error, and Success states in a structured way, the application provides better feedback when retrieving data.

The challenge also demonstrates the importance of reviewing AI-generated code, understanding its implementation, and verifying its correctness through static analysis and unit testing.
```

## Catatan sebelum dikumpulkan

Ada tiga hal yang perlu kamu lengkapi sendiri setelah pengujian:

1. Ganti `[Fill in actual result]` dengan hasil asli `flutter analyze` dan `flutter test`.
2. Ganti status Passed/Failed berdasarkan pengujian aplikasi.
3. Pastikan `docs/AI_CHALLENGE.md` benar-benar tersedia dan berisi dokumentasi proses AI.

**Penting:** README menjelaskan hasil akhir project, sedangkan `docs/AI_CHALLENGE.md` menyimpan detail proses penggunaan AI, prompt, hasil awal, perbaikan, dan verifikasi. Keduanya saling melengkapi.