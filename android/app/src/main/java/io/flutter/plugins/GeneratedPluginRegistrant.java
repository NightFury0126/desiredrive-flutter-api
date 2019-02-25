package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import com.lyokone.location.LocationPlugin;
import de.pdesire.desiredriveapiflutter.DesiredriveApiFlutterPlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    LocationPlugin.registerWith(registry.registrarFor("com.lyokone.location.LocationPlugin"));
    DesiredriveApiFlutterPlugin.registerWith(registry.registrarFor("de.pdesire.desiredriveapiflutter.DesiredriveApiFlutterPlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
