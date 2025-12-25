package expo.modules.appnativecamera

import android.content.Context
// import android.webkit.WebView
// import android.webkit.WebViewClient
import androidx.compose.ui.platform.ComposeView
import android.view.ViewGroup.LayoutParams
import expo.modules.kotlin.AppContext
import expo.modules.kotlin.viewevent.EventDispatcher
import expo.modules.kotlin.views.ExpoView

class AppNativeCameraView(context: Context, appContext: AppContext) : ExpoView(context, appContext) {
  val viewModel = CameraDisplayViewModel()

  private val onSubmit by EventDispatcher()

  internal val composeView = ComposeView(context).also {

      it.layoutParams = LayoutParams(
          LayoutParams.MATCH_PARENT,
          LayoutParams.MATCH_PARENT 
      )

      it.setContent {
          CameraView(viewModel)
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
