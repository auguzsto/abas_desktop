//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <screen_retriever_linux/screen_retriever_linux_plugin.h>
#include <webview_all_cef/webview_cef_plugin.h>
#include <window_manager/window_manager_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) screen_retriever_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "ScreenRetrieverLinuxPlugin");
  screen_retriever_linux_plugin_register_with_registrar(screen_retriever_linux_registrar);
  g_autoptr(FlPluginRegistrar) webview_all_cef_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "WebviewCefPlugin");
  webview_cef_plugin_register_with_registrar(webview_all_cef_registrar);
  g_autoptr(FlPluginRegistrar) window_manager_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "WindowManagerPlugin");
  window_manager_plugin_register_with_registrar(window_manager_registrar);
}
