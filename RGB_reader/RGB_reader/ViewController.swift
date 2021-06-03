//
//  ViewController.swift
//  RGB_reader
//
//  Created by Mason Kirby on 5/25/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addCameraInput()
        // Do any additional setup after loading the view.
    }
    private var captureSession: AVCaptureSession = AVCaptureSession()
    private func addCameraInput(){
        guard let device = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera, .builtInDualCamera,.builtInTrueDepthCamera], mediaType: .video, position: .back).devices.first else{
            fatalError("no back camera found")
        }
        let cameraInput = try! AVCaptureDeviceInput(device: device)
        self.captureSession.addInput(cameraInput)
    }
    func captureOutput(_ output: AVCaptureOutput, didDrop sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        print("did recieve frame")
    }
    private let videoDataOutput = AVCaptureVideoDataOutput()
    


}

