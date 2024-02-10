package com.example.uniffi_flutter_test
import io.flutter.embedding.android.FlutterActivity
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import lwk_bindings.*
import java.nio.ByteBuffer

class MainActivity : FlutterActivity() {


    private val CHANNEL = "demo.flutter.dev/lwk"

       override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            // This method is invoked on the main thread.
            call, result ->
            if (call.method == "getDesc") {
                val desc = getDesc()
                result.success(desc)
            }
            else if (call.method == "getAddress") {
                val indexString: String? = call.argument("index")
                val indexUInt: UInt? = indexString?.toUIntOrNull()
                val address = getAddress(indexUInt)
                result.success(address)
            }
            else {
                result.notImplemented()
            }
        }
    }


    private fun getDesc(): String {

        val network = Network.testnet()

        assert(network.toString() == "LiquidTestnet")

        val client = network.defaultElectrumClient()

        val mnemonic =
                Mnemonic(
                        "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about"
                )

        val signer = Signer(mnemonic, network)
        val desc = signer.wpkhSlip77Descriptor()


        return desc.toString()
    }

    private fun getAddress(index: UInt?): String {

        val network = Network.testnet()

        assert(network.toString() == "LiquidTestnet")

        val client = network.defaultElectrumClient()

        val mnemonic =
                Mnemonic(
                        "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about"
                )

        val signer = Signer(mnemonic, network)
        val desc = signer.wpkhSlip77Descriptor()
        val w = Wollet(network, desc, null)
        val addressResult = w.address(index)
        val address = addressResult.address().toString();
        return address;
    }
}
