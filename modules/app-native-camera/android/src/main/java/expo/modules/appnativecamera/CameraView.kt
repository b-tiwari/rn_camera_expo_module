package expo.modules.appnativecamera

import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxHeight
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.border
import androidx.compose.material3.Button
import androidx.compose.material3.Card
import androidx.compose.material3.Text
import androidx.compose.material3.TextField
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.graphics.Color
import androidx.compose.foundation.shape.RoundedCornerShape

// For Camera Permission state
import com.google.accompanist.permissions.ExperimentalPermissionsApi
import com.google.accompanist.permissions.PermissionState
import com.google.accompanist.permissions.isGranted
import com.google.accompanist.permissions.rememberPermissionState

// For correct syntax of using ViewModel
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.getValue

@OptIn(ExperimentalPermissionsApi::class)
@Composable
fun CameraView(viewModel: CameraDisplayViewModel) {
    val cameraPermission: PermissionState = rememberPermissionState(android.Manifest.permission.CAMERA)

    CameraView_wPermission(
        hasPermission = cameraPermission.status.isGranted,
        onRequestPermission = cameraPermission::launchPermissionRequest,
        viewModel = viewModel
    )
}

@Composable
fun CameraView_wPermission(
    hasPermission: Boolean,
    onRequestPermission: () -> Unit = {},
    viewModel: CameraDisplayViewModel
) {

    if (hasPermission) {
        CameraDisplayView(viewModel)
    } else {
        NoPermissionView(onRequestPermission)
    }
}



// OPTIONAL - display component preview in Android Studio
// @Preview
// @Composable
// fun TestFormPreview() {
//     TestForm(viewModel = TestFormModel(), onSubmit = {})
// }
