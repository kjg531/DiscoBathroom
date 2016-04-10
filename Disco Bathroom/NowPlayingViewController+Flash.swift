//
//  NowPlayingViewController+Flash.swift
//  Disco Bathroom
//
//  Created by KG on 4/9/16.
//  Copyright © 2016 Kenneth Gabbara. All rights reserved.
//

import Foundation
import AVFoundation

extension NowPlayingViewController: LightsViewControllerDelegate {
    
    func toggleFlash() {
        let device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        if (device.hasTorch) {
            do {
                try device.lockForConfiguration()
                if (device.torchMode == AVCaptureTorchMode.On) {
                    device.torchMode = AVCaptureTorchMode.Off
                } else {
                    do {
                        try device.setTorchModeOnWithLevel(1.0)
                    } catch {
                        print(error)
                    }
                }
                device.torchMode = AVCaptureTorchMode.Off
                device.unlockForConfiguration()
            } catch {
                print(error)
            }
        }
    }
    
    
    func lightsViewControllerDidUpdateState(withFlashOption flashOption: Bool, lightsOptions: Bool) {
        lightsOptionIsOn = lightsOptions
        flashOptionIsOn = flashOption
        
        if lightsOptionIsOn && flashOptionIsOn {
            if flashTimer == nil {
                flashTimer = CancelableTimer(once: false) { [unowned self] in
                    self.toggleFlash()
                }
                flashTimer?.startWithInterval(0.1)
            }
        }
        else {
            flashTimer?.cancel()
            flashTimer = nil
        }
    }
}
