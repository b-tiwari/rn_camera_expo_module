import Foundation

enum CameraError: Error {
    case cameraUnavailable
    case inputNotAdded
    case outputNotAdded
    case sessionUnavailable
    case photoDataUnavailable
    case permissionDenied

    var localizedDescription: String {
        switch self {
        case .cameraUnavailable:
            return "Camera is not available"
        case .inputNotAdded:
            return "Failed to add camera input"
        case .outputNotAdded:
            return "Failed to add photo output"
        case .sessionUnavailable:
            return "Camera session is unavailable"
        case .photoDataUnavailable:
            return "Failed to get photo data"
        case .permissionDenied:
            return "Camera permission denied"
        }
    }
}
