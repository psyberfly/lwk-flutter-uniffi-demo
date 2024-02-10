# lwk-flutter uniFFI demo

A demo flutter app for Android providing [lwk_bindings](https://docs.rs/lwk_bindings/latest/lwk_bindings) (lwk_wollet, lwk_signer,lwk_common) over FFI.  
lwk_bindings for Kotlin generated from [lwk](https://github.com/Blockstream/lwk) via uniFFI.  
lwk_bindings invoked from Flutter using [flutter platform channels](https://docs.flutter.dev/platform-integration/platform-channels).  

## Pre-requesites:

Android binaries located in:
[Android bins](android/app/src/main/jniLibs)

Kotlin-bindings located in:
[Kotlin_bindings](android/app/src/main/kotlin/lwk_bindings.kt)

For Android, ensure that the gradle.build and gradle.settings match those mentioned in the [lwk_android_example](https://github.com/Blockstream/lwk/tree/master/lwk_bindings/android_bindings).


## Dev:

2 interfaces need to be maintained:

The kotlin-binary interface in: 
[Kotlin-Bin interface](android/app/src/main/kotlin/com/example/uniffi_flutter_test/MainActivity.kt)

The dart-kotlin interface in:
[Dart-Kotlin interface](lib/main.dart)


## Usage:

1. flutter pub get
2. flutter run

