@echo off

flutter test && ^
flutter analyze && ^
dart format --set-exit-if-changed . && ^
flutter test integration_test/