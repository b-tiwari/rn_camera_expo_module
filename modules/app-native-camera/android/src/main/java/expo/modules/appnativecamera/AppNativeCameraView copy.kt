package expo.modules.appnativecamera

import android.content.Context
// import android.webkit.WebView
// import android.webkit.WebViewClient
import androidx.compose.ui.platform.ComposeView
import android.view.ViewGroup.LayoutParams
import expo.modules.kotlin.AppContext
import expo.modules.kotlin.viewevent.EventDispatcher
import expo.modules.kotlin.views.ExpoView

class Old_AppNativeCameraView(context: Context, appContext: AppContext) : ExpoView(context, appContext) {
  // Creates and initializes an event dispatcher for the `onLoad` event.
  // The name of the event is inferred from the value and needs to match the event name defined in the module.
  // private val onLoad by EventDispatcher()

  // Defines a WebView that will be used as the root subview.
  // internal val webView = WebView(context).apply {
  //   layoutParams = LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT)
  //   webViewClient = object : WebViewClient() {
  //     override fun onPageFinished(view: WebView, url: String) {
  //       // Sends an event to JavaScript. Triggers a callback defined on the view component in JavaScript.
  //       onLoad(mapOf("url" to url))
  //     }
  //   }
  // }

  // internal val composeView = ComposeView(context).also {

    val viewModel = TestFormModel()

    private val onSubmit by EventDispatcher()

  internal val composeView = ComposeView(context).also {

      it.layoutParams = LayoutParams(
          LayoutParams.MATCH_PARENT,
          LayoutParams.MATCH_PARENT 
      )

      it.setContent {
          TestForm(
            viewModel = viewModel,
            onSubmit = { onSubmit(mapOf("inputText" to it)) }
          )
      }


      addView(it)
  }

  // init {
  // Adds the WebView to the view hierarchy.
  //   addView(webView)
  // }

  // fun updateCameraConfig(config: String) {
  //  // Update your Compose state with the new config
  // }
}
