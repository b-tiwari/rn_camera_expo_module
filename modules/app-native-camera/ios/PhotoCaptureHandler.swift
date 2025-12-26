import AVFoundation

protocol PhotoCaptureDelegate: AnyObject {
    func didCapturePhoto(data: Data)
    func didFailCapture(error: Error)
}

class PhotoCaptureHandler: NSObject {
    private let photoOutput = AVCapturePhotoOutput()
    weak var delegate: PhotoCaptureDelegate?
    
    func getPhotoOutput() -> AVCapturePhotoOutput {
        return photoOutput
    }
    
    func capturePhoto() {
        let settings = AVCapturePhotoSettings()
        photoOutput.capturePhoto(with: settings, delegate: self)
    }
}


extension PhotoCaptureHandler: AVCapturePhotoCaptureDelegate {
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let error = error {
            delegate?.didFailCapture(error: error)
            return
        }
        
        guard let imageData = photo.fileDataRepresentation() else {
            delegate?.didFailCapture(error: CameraError.photoDataUnavailable)
            return
        }
        
        delegate?.didCapturePhoto(data: imageData)
    }
}
