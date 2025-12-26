package expo.modules.appnativecamera
// Composable
import androidx.compose.runtime.Composable
import androidx.compose.runtime.LaunchedEffect

// Compose Layout
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.border

// Compose Material UI Components
import androidx.compose.material3.Card
import androidx.compose.material3.Scaffold

// Camera things
import androidx.camera.compose.CameraXViewfinder


// Compose UI Modifier
import androidx.compose.ui.Modifier
import androidx.compose.ui.Alignment
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.platform.LocalContext

// to use ViewModel
// For correct syntax of using ViewModel
import androidx.lifecycle.viewmodel.compose.viewModel
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue

// missing
import androidx.compose.material3.Scaffold
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.runtime.remember
import android.content.Context
import androidx.compose.ui.platform.LocalContext

import androidx.lifecycle.compose.collectAsStateWithLifecycle  
import androidx.compose.runtime.collectAsState
import androidx.lifecycle.compose.LocalLifecycleOwner
import androidx.lifecycle.LifecycleOwner


@Composable
fun CameraDisplayView(
    viewModel: CameraDisplayViewModel
) {
    CameraContent(viewModel);
}

@Composable
private fun CameraContent(
    viewModel: CameraDisplayViewModel,
) {

    val surfaceRequest by viewModel.surfaceRequest.collectAsStateWithLifecycle()
    val context = LocalContext.current
    val lifecycleOwner: LifecycleOwner = LocalLifecycleOwner.current

    LaunchedEffect(lifecycleOwner) { 
        viewModel.bindToCamera(context.applicationContext, lifecycleOwner) 
    }

    surfaceRequest?.let { request ->
        CameraXViewfinder(
            surfaceRequest = request,
            modifier = Modifier
        )
    }

}
