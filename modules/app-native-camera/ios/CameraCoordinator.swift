import AVFoundation
import UIKit

protocol CameraCoordinatorDelegate: AnyObject {
    func didCapturePhoto(base64String: String)
    func didEncounterError(_ error: Error)
}

class CameraCoordinator: NSObject {
    private let sessionManager = CameraSessionManager()
    private let photoCaptureHandler = PhotoCaptureHandler()
    
    weak var delegate: CameraCoordinatorDelegate?
    
    override init() {
        super.init()
        setupPhotoCapture()
    }
    
    private func setupPhotoCapture() {
        photoCaptureHandler.delegate = self
        
        do {
            try sessionManager.addCameraInput()
            try sessionManager.addOutput(photoCaptureHandler.getPhotoOutput())
        } catch {
            delegate?.didEncounterError(error)
        }
    }
    
    func createPreviewLayer() -> AVCaptureVideoPreviewLayer {
        return sessionManager.createPreviewLayer()
    }
    
    func startCamera() {
        sessionManager.startSession()
    }
    
    func stopCamera() {
        sessionManager.stopSession()
    }
    
    func capturePhoto() {
        photoCaptureHandler.capturePhoto()
    }

    func checkPermissionsAndStart() {
        CameraPermissionManager.requestCameraPermission { [weak self] granted in
        if granted {
            self?.startCamera()
        } else {
            self?.delegate?.didEncounterError(CameraError.permissionDenied)
        }
    }
}
}

extension CameraCoordinator: PhotoCaptureDelegate {
    func didCapturePhoto(data: Data) {
        let base64String = data.base64EncodedString()
        delegate?.didCapturePhoto(base64String: base64String)
    }
    
    func didFailCapture(error: Error) {
        delegate?.didEncounterError(error)
    }
}
