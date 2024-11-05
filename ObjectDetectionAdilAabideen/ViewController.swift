//
//  ViewController.swift
//  Object Detection by Adil Aabideen
//
//  Created by Adil Aabideen in 2024
//  Copyright © 2024 Adil Aabideen . All rights reserved.
//

import UIKit
import AVKit
import Vision

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    let identifierLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(white: 0, alpha: 0.5) // Semi-transparent background
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18) // Larger, bold font
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
        return label
    }()
    
    let confidenceBar: UIView = {
        let bar = UIView()
        bar.backgroundColor = .systemGreen
        bar.translatesAutoresizingMaskIntoConstraints = false
        bar.layer.cornerRadius = 4
        return bar
    }()
    
    var confidenceBarWidthConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let captureSession = AVCaptureSession()
        captureSession.sessionPreset = .photo
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        captureSession.addInput(input)
        
        captureSession.startRunning()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        view.layer.addSublayer(previewLayer)
        previewLayer.frame = view.frame
        
        let dataOutput = AVCaptureVideoDataOutput()
        dataOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
        captureSession.addOutput(dataOutput)
        
        
        setupIdentifierConfidenceLabel()
    }
    
    fileprivate func setupIdentifierConfidenceLabel() {
        view.addSubview(identifierLabel)
        view.addSubview(confidenceBar)
        
        // Identifier label Positioning
        identifierLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
        identifierLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        identifierLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        identifierLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        // Confidence bar under the label Positioning
        confidenceBar.topAnchor.constraint(equalTo: identifierLabel.bottomAnchor, constant: 8).isActive = true
        confidenceBar.leftAnchor.constraint(equalTo: identifierLabel.leftAnchor).isActive = true
        confidenceBar.heightAnchor.constraint(equalToConstant: 8).isActive = true
        
        // Width constraint for confidence bar that will be adjusted dynamically
        confidenceBarWidthConstraint = confidenceBar.widthAnchor.constraint(equalToConstant: 0)
        confidenceBarWidthConstraint.isActive = true
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
//        print("Camera was able to capture a frame:", Date())
        
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        // Resnet 50 Model from Apple
        guard let model = try? VNCoreMLModel(for: Resnet50().model) else { return }
        let request = VNCoreMLRequest(model: model) { (finishedReq, err) in
            
            guard let results = finishedReq.results as? [VNClassificationObservation] else { return }
            
            guard let firstObservation = results.first else { return }
            
            print(firstObservation.identifier, firstObservation.confidence)
            
            DispatchQueue.main.async {
                self.identifierLabel.text = "\(firstObservation.identifier) - \(Int(firstObservation.confidence * 100))%"
                
                // Update the width of the confidence bar based on confidence level
                self.confidenceBarWidthConstraint.constant = CGFloat(firstObservation.confidence) * self.identifierLabel.frame.width
                
                // Animate the width change for a smoother UI update
                UIView.animate(withDuration: 0.25) {
                    self.view.layoutIfNeeded()
                }
            }
            
        }
        
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
    }

}

