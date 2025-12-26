import AVFoundation
import UIKit

class CameraSessionManager {
    private let captureSession = AVCaptureSession()
    
    init() {
        captureSession.sessionPreset = .photo
    }
    
    // Check if running on simulator
    private var isSimulator: Bool {
        #if targetEnvironment(simulator)
        return true
        #else
        return false
        #endif
    }
    
    // method to add camera input
    func addCameraInput() throws {
        // If we're on simulator, skip camera input setup
        guard !isSimulator else {
            return
        }
        
        guard let backCamera = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            throw CameraError.cameraUnavailable
        }
        
        let input = try AVCaptureDeviceInput(device: backCamera)
        guard captureSession.canAddInput(input) else {
            throw CameraError.inputNotAdded
        }
        
        captureSession.addInput(input)
    }
    
    func addOutput(_ output: AVCaptureOutput) throws {
        guard captureSession.canAddOutput(output) else {
            throw CameraError.outputNotAdded
        }
        captureSession.addOutput(output)
    }
    
    func createPreviewLayer() -> AVCaptureVideoPreviewLayer {
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = .resizeAspectFill
        return previewLayer
    }
    
    func startSession() {
        DispatchQueue.global(qos: .userInitiated).async {
            self.captureSession.startRunning()
        }
    }
    
    func stopSession() {
        captureSession.stopRunning()
    }
}
