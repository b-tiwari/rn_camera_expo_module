import UIKit

protocol CameraButtonDelegate: AnyObject {
    func didTapCaptureButton()
}

class CameraButton: UIButton {
    weak var delegate: CameraButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton() {
        setTitle("Take Photo", for: .normal)
        backgroundColor = .systemBlue
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 25
        titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        delegate?.didTapCaptureButton()
    }
    
    func updateButtonText(_ text: String) {
        setTitle(text, for: .normal)
    }
}
