package com.example.contact_plugin

import android.content.Context
import android.provider.ContactsContract
import android.Manifest
import android.content.pm.PackageManager
import androidx.core.app.ActivityCompat
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class ContactPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        context = binding.applicationContext
        channel = MethodChannel(binding.binaryMessenger, "contact_plugin")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "getContacts") {
            if (checkPermission()) {
                val contacts = fetchContacts()
                result.success(contacts)
            } else {
                result.error("PERMISSION_DENIED", "Contact permission not granted", null)
            }
        } else {
            result.notImplemented()
        }
    }

    private fun checkPermission(): Boolean {
        return ActivityCompat.checkSelfPermission(context, Manifest.permission.READ_CONTACTS) == PackageManager.PERMISSION_GRANTED
    }

    private fun fetchContacts(): List<Map<String, String>> {
        val contactsList = mutableListOf<Map<String, String>>()
        val resolver = context.contentResolver
        val cursor = resolver.query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI, null, null, null, null)

        cursor?.use {
            while (it.moveToNext()) {
                val name = it.getString(it.getColumnIndexOrThrow(ContactsContract.CommonDataKinds.Phone.DISPLAY_NAME))
                val phone = it.getString(it.getColumnIndexOrThrow(ContactsContract.CommonDataKinds.Phone.NUMBER))
                val cleanedPhone = phone.replace("\\s".toRegex(), "")

                val countryCode = if (cleanedPhone.startsWith("+")) {
                    cleanedPhone.split(Regex("[^\\d]"))[0]
                } else {
                    ""
                }

                contactsList.add(
                    mapOf(
                        "displayName" to name,
                        "phoneNumber" to cleanedPhone,
                        "countryCode" to countryCode
                    )
                )
            }
        }

        return contactsList
    }
}
