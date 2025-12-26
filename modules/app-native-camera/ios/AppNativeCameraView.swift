import ExpoModulesCore
import AVFoundation
import UIKit

// This view will be used as a native component. Make sure to inherit from `ExpoView`
// to apply the proper styling (e.g. border radius and shadows).
class AppNativeCameraView: ExpoView {
  private let cameraCoordinator = CameraCoordinator()
  private let captureButton = CameraButton()
  private var previewLayer: AVCaptureVideoPreviewLayer?
  private var simulatorPlaceholder: UIView?

  let onSubmit = EventDispatcher()
  
  // Check if running on simulator
  private var isSimulator: Bool {
      #if targetEnvironment(simulator)
      return true
      #else
      return false
      #endif
  }

  required init(appContext: AppContext? = nil) {
    super.init(appContext: appContext)
    setupView()
  }

  private func setupView() {
      if isSimulator {
          setupSimulatorPlaceholder()
      } else {
          setupRealCamera()
      }
      
      // Setup capture button
      captureButton.delegate = self
      addSubview(captureButton)
  }
  
  private func setupRealCamera() {
      // Setup camera coordinator
      cameraCoordinator.delegate = self
      
      // Setup preview layer
      previewLayer = cameraCoordinator.createPreviewLayer()
      if let previewLayer = previewLayer {
        layer.addSublayer(previewLayer)
      }
  }
  
  private func setupSimulatorPlaceholder() {
      let placeholder = UIView()
      placeholder.backgroundColor = .darkGray
      
      let label = UILabel()
      label.text = "📷 Simulator Camera\n(No camera hardware available)"
      label.textAlignment = .center
      label.numberOfLines = 0
      label.textColor = .white
      label.font = UIFont.systemFont(ofSize: 16)
      
      placeholder.addSubview(label)
      label.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
          label.centerXAnchor.constraint(equalTo: placeholder.centerXAnchor),
          label.centerYAnchor.constraint(equalTo: placeholder.centerYAnchor)
      ])
      
      addSubview(placeholder)
      simulatorPlaceholder = placeholder
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    
    if isSimulator {
        // Layout simulator placeholder
        simulatorPlaceholder?.frame = bounds
    } else {
        // Layout preview layer for real device
        previewLayer?.frame = bounds
    }
    
    // Layout capture button
    let buttonWidth: CGFloat = 120
    let buttonHeight: CGFloat = 50
    captureButton.frame = CGRect(
        x: (bounds.width - buttonWidth) / 2,
        y: bounds.height - buttonHeight - 50,
        width: buttonWidth,
        height: buttonHeight
    )
    
    // Start camera only on real devices
    if !isSimulator {
        cameraCoordinator.checkPermissionsAndStart()
    }
  }
}

extension AppNativeCameraView: CameraCoordinatorDelegate {
    func didCapturePhoto(base64String: String) {
        onSubmit([
            "photo": base64String,
            "timestamp": Date().timeIntervalSince1970
        ])
    }
    
    func didEncounterError(_ error: Error) {
        print("Camera error: \(error.localizedDescription)")
    }
}

extension AppNativeCameraView: CameraButtonDelegate {
    func didTapCaptureButton() {
        if isSimulator {
            // Simulate photo capture with a placeholder
            let placeholderBase64 = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg=="
            onSubmit([
                "photo": placeholderBase64,
                "timestamp": Date().timeIntervalSince1970,
                "isSimulator": true
            ])
        } else {
            cameraCoordinator.capturePhoto()
        }
    }
}
