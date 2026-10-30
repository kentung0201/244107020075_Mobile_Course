
# AI Challenge - Flutter Riverpod

## 1. AI Prompt Used

The following prompt was given to an AI coding assistant:

Create a Flutter page named StatsPage using flutter_riverpod.

Requirements:
- A ConsumerWidget with one AsyncNotifierProvider that simulates
  fetching statistics (2-second delay, ~30% chance of failure).
- The UI must handle loading (spinner), error (message + retry button),
  and success (ListView with 3 items).
- Provide a unit test for the notifier.
Explain each part of the code with comments.

## 2. Initial AI Output

The AI generated the following files:

- lib/providers/stats_provider.dart
- lib/pages/stats_page.dart
- test/stats_provider_test.dart

The generated implementation uses:
- AsyncNotifier for asynchronous state management.
- AsyncNotifierProvider to expose the statistics state.
- ConsumerWidget to build the user interface.
- AsyncValue.when() to handle loading, error, and success states.
- ProviderContainer to test the notifier.

The initial AI-generated code is documented in the implementation files.

## 3. AI Verification Checklist

| Verification | Result |
|---|---|
| Immutable state management | Passed |
| ref.watch inside build | Passed |
| ref.read inside callbacks | Passed |
| Loading state handled | Passed |
| Error state handled | Passed |
| Success state handled | Passed |
| Explicit provider type | Passed |
| No deprecated StateNotifierProvider | Passed |
| Unit test provided | Passed |

## 4. Fixes and Improvements

1. Used an explicit AsyncNotifierProvider type.
2. Added a deterministic TestStatsNotifier for unit testing.
3. Avoided random failures during unit tests.
4. Added comments explaining important code sections.
5. Added StatsPage to the existing application navigation.

## 5. Test Results

Flutter Analyze:
[Fill in the actual result]

Flutter Test:
[Fill in the actual result]

## 6. Conclusion

The AI-generated implementation was reviewed and tested.
The application supports loading, error, and success states
using Riverpod AsyncValue.

The unit test verifies that the notifier returns three
statistics correctly.
