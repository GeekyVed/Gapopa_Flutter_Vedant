@echo off

flutter test && ^
flutter analyze && ^
dart format --set-exit-if-changed .