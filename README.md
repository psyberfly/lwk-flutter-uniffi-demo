# lwk-flutter uniFFI demo

A demo flutter app for Android providing lwk_bindings (lwk_wollet, lwk_signer,lwk_common) (https://docs.rs/lwk_bindings/latest/lwk_bindings) over FFI.  
lwk_bindings for Kotlin generated from lwk (https://github.com/Blockstream/lwk) via uniFFI.  
lwk_bindings invoked from Flutter using platform channels.  

## Dev:

The kotlin-binary interface is written in: 
[Kotlin-Bin interface](android/app/src/main/kotlin/com/example/uniffi_flutter_test/MainActivity.kt)

The dart-kotlin interface is written in:
[Dart-Kotlin interface](lib/main.dart)


## Usage:

1. flutter pub get
2. flutter run

