//
//  ViewController.swift
//  Tile Cam
//
//  Created by Richard Hayden on 1/6/16.
//  Copyright © 2016 richayden. All rights reserved.
//

import UIKit
import AVFoundation
import CoreImage
import FontAwesome_swift

//FILTERS
//let Posterize = "Posterize"
//let PosterizeFilter = CIFilter(name: "CIColorPosterize", withInputParameters: ["inputLevels" : 5])
//
//let BlackAndWhite = "Black and White"
//let blackAndWhiteFilter = CIFilter(name: "CIPhotoEffectMono")
//
//let Filters = [
//    Posterize: PosterizeFilter,
//    BlackAndWhite: blackAndWhiteFilter]
//
//let FilterNames = [String](Filters.keys).sort()
//END FILTERS


class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, CustomCollectionViewCellDelegate {
    
    //FILTERS
//    let mainGroup = UIStackView()
//    let fImageView = UIImageView(frame: CGRectZero)
//    let filtersControl = UISegmentedControl(items: FilterNames)
    //END
    @IBOutlet weak var btn: UIButton!
    
    @IBOutlet weak var help: UIBarButtonItem!
    @IBOutlet weak var zoomMinus: UIBarButtonItem!
    @IBOutlet weak var zoomMag: UIBarButtonItem!
    @IBOutlet weak var zoomPlus: UIBarButtonItem!
    @IBOutlet weak var gridButton: UIBarButtonItem!
    @IBOutlet weak var save: UIBarButtonItem!
    @IBOutlet weak var cancel: UIBarButtonItem!
    @IBOutlet weak var switchCamera: UIBarButtonItem!
    @IBOutlet weak var flash: UIBarButtonItem!
    @IBOutlet var collectionView: UICollectionView!
    
    var dummyArray = [CVCell]()
    
    var groutWidth: Int?
    var tileCorner: Int?
    var someNumber = 1
    var screenWidth: CGFloat!
    //Slider Variables
    var slider:UISlider?
    var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    var oldIndex = 0
    var previewView: UIView!
    var capturedImage: UIImageView!
    var captureSession : AVCaptureSession!
    var stillImageOutput : AVCaptureStillImageOutput!
    var previewLayer : AVCaptureVideoPreviewLayer!
    var frameRect: CGRect?
    var backFacingCamera: AVCaptureDevice?
    var frontFacingCamera: AVCaptureDevice?
    var currentDevice: AVCaptureDevice?
    //var toggleCameraGestureRecognizer = UISwipeGestureRecognizer()
    var zoomInGestureRecognizer = UISwipeGestureRecognizer()
    var zoomOutGestureRecognizer = UISwipeGestureRecognizer()
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //collectionView.registerClass(CVCell.self, forCellWithReuseIdentifier: "Cell")
        
        let attributes = [NSFontAttributeName: UIFont.fontAwesomeOfSize(24)] as Dictionary!
        flash.setTitleTextAttributes(attributes, forState: .Normal)
        flash.title = String.fontAwesomeIconWithName(.SunO)
        switchCamera.setTitleTextAttributes(attributes, forState: .Normal)
        switchCamera.title = String.fontAwesomeIconWithName(.Refresh)
        cancel.setTitleTextAttributes(attributes, forState: .Normal)
        cancel.title = String.fontAwesomeIconWithName(.Eraser)
        save.setTitleTextAttributes(attributes, forState: .Normal)
        save.title = String.fontAwesomeIconWithName(.Photo)
        gridButton.setTitleTextAttributes(attributes, forState: .Normal)
        gridButton.title = String.fontAwesomeIconWithName(.Th)
        zoomPlus.setTitleTextAttributes(attributes, forState: .Normal)
        zoomPlus.title = String.fontAwesomeIconWithName(.PlusSquareO)
        zoomMag.setTitleTextAttributes(attributes, forState: .Normal)
        zoomMag.title = String.fontAwesomeIconWithName(.Search)
        zoomMinus.setTitleTextAttributes(attributes, forState: .Normal)
        zoomMinus.title = String.fontAwesomeIconWithName(.MinusSquareO)
        help.setTitleTextAttributes(attributes, forState: .Normal)
        help.title = String.fontAwesomeIconWithName(.QuestionCircle)
        
//        var fixedSpace:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FixedSpace, target: nil, action: nil)
//        fixedSpace.width = 25.0
//        
//        var negativeSpace:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FixedSpace, target: nil, action: nil)
//        negativeSpace.width = 15.0
//        
//        navigationItem.rightBarButtonItems = [negativeSpace, save, fixedSpace, cancel, negativeSpace, titleButton, negativeSpace, switchCamera, fixedSpace, flash, negativeSpace]

        btn.frame = CGRectMake((UIScreen.mainScreen().bounds.size.width / 2) - 35, (UIScreen.mainScreen().bounds.size.height) - 129, 70, 70)
        btn.backgroundColor = UIColor.whiteColor()
        //btn.setTitle("Click Me", forState: UIControlState.Normal)
        btn.addTarget(self, action: "buttonAction:", forControlEvents: .TouchDown)
        btn.addTarget(self, action: "buttonActionEnd:", forControlEvents: .TouchUpInside)
        //btn.tag = 1               // change tag property
        self.view.addSubview(btn) // add to view as subview
        btn.layer.cornerRadius = 35
        //btn.layer.borderWidth = 1
        
        //btn.layer.borderColor = UIColor.blackColor().CGColor
        
        //btn.layer.shadowColor = UIColor.whiteColor().CGColor
        //btn.layer.shadowOpacity = 1
        //btn.layer.shadowOffset = CGSizeZero
        //btn.layer.shadowRadius = 10
        
        let btn2: UIButton = UIButton(frame: CGRectMake((UIScreen.mainScreen().bounds.size.width / 2) - 29, (UIScreen.mainScreen().bounds.size.height) - 128, 58, 58))
        btn2.backgroundColor = UIColor.clearColor()
        btn2.enabled = false
        //btn2.addTarget(self, action: "buttonAction:", forControlEvents: .TouchUpInside)
        self.view.addSubview(btn2) // add to view as subview
        btn2.layer.cornerRadius = 29
        btn2.layer.borderWidth = 1.5
        btn2.layer.borderColor = UIColor.blackColor().CGColor

        
//FILTERS
//        view.addSubview(mainGroup)
//        mainGroup.axis = UILayoutConstraintAxis.Vertical
//        mainGroup.distribution = UIStackViewDistribution.Fill
//        
//        mainGroup.addArrangedSubview(fImageView)
//        mainGroup.addArrangedSubview(filtersControl)
//        
//        //fImageView.contentMode = UIViewContentMode.ScaleAspectFit
//        
//        filtersControl.selectedSegmentIndex = 0
        //END
        
        capturedImage?.image = UIImage(named: "shutter")
        screenWidth = UIScreen.mainScreen().bounds.size.width
        
        slider = UISlider(frame: CGRectMake(20, screenWidth + 54, screenWidth - 40, 50))
        self.view.addSubview(slider!)
        let numberOfSteps = Float(numbers.count - 1)
        slider!.maximumValue = numberOfSteps;
        slider!.minimumValue = 0;
        // As the slider moves it will continously call the -valueChanged:
        slider!.continuous = true; // false makes it call only once you let go
        slider!.addTarget(self, action: "valueChanged:", forControlEvents: .ValueChanged)
        slider!.minimumTrackTintColor = UIColor.whiteColor()
        //slider!.maximumTrackTintColor = UIColor.blackColor()
        //tabBarItem.image = UIImage.fontAwesomeIconWithName(.Github, textColor: UIColor.blackColor(), size: CGSizeMake(30, 30))
        //slider!.setThumbImage(UIImage(named: "sliderSquare")!, forState: .Normal)
        slider!.setThumbImage((UIImage.fontAwesomeIconWithName(.DotCircleO, textColor: UIColor.whiteColor(), size: CGSizeMake(36, 36))), forState: .Normal)
        createGrid()
        
        let devices = AVCaptureDevice.devicesWithMediaType(AVMediaTypeVideo) as! [AVCaptureDevice]
        
        for device in devices {
            if device.position == AVCaptureDevicePosition.Back {
                backFacingCamera = device
            } else if device.position == AVCaptureDevicePosition.Front {
                frontFacingCamera = device
            }
        }
        currentDevice = backFacingCamera
        do {
            _ = try AVCaptureDeviceInput(device: currentDevice)
        } catch {
            print(error)
        }
        
//        toggleCameraGestureRecognizer.direction = .Up
//        toggleCameraGestureRecognizer.addTarget(self, action: "toggleCamera")
//        view.addGestureRecognizer(toggleCameraGestureRecognizer)
        
//        zoomInGestureRecognizer.direction = .Right
//        zoomInGestureRecognizer.addTarget(self, action: "zoomIn")
//        view.addGestureRecognizer(zoomInGestureRecognizer)
//        
//        zoomOutGestureRecognizer.direction = .Left
//        zoomOutGestureRecognizer.addTarget(self, action: "zoomOut")
//        view.addGestureRecognizer(zoomOutGestureRecognizer)
        
        if self.captureSession != nil && self.captureSession.running {
            self.captureSession.stopRunning()
            self.previewLayer.removeFromSuperlayer()
            self.captureSession = nil
            return
        }
        self.captureSession = AVCaptureSession()
        
//        if someNumber > 0 && someNumber < 4 {
//            self.captureSession.sessionPreset = AVCaptureSessionPresetPhoto
//        }
//        if someNumber > 3 && someNumber < 8 {
//            self.captureSession.sessionPreset = AVCaptureSessionPresetHigh
//        }
//        if someNumber > 7 {
//            self.captureSession.sessionPreset = AVCaptureSessionPresetLow
//        }
        
        self.captureSession.sessionPreset = AVCaptureSessionPresetHigh
        let backCamera = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        var error: NSError?
        var input: AVCaptureDeviceInput!
        do {
            input = try AVCaptureDeviceInput(device: backCamera)
        } catch let error1 as NSError {
            error = error1
            input = nil
        }
        if error == nil && captureSession!.canAddInput(input) {
            captureSession!.addInput(input)
//            let videoOutput = AVCaptureVideoDataOutput()
//            videoOutput.videoSettings = [kCVPixelBufferPixelFormatTypeKey : Int(kCVPixelFormatType_32BGRA)]
//            videoOutput.alwaysDiscardsLateVideoFrames = true
            stillImageOutput = AVCaptureStillImageOutput()
            stillImageOutput!.outputSettings = [AVVideoCodecKey: AVVideoCodecJPEG]
//            videoOutput.setSampleBufferDelegate(self, queue: dispatch_queue_create("sample buffer delegate", DISPATCH_QUEUE_SERIAL))
            if captureSession!.canAddOutput(stillImageOutput) {
                captureSession!.addOutput(stillImageOutput)
//            if captureSession!.canAddOutput(videoOutput) {
//                captureSession!.addOutput(videoOutput)
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayer!.videoGravity = AVLayerVideoGravityResizeAspectFill
                previewLayer!.connection?.videoOrientation = AVCaptureVideoOrientation.Portrait
                previewView.layer.addSublayer(previewLayer)
                
                //FILTERS
//                let videoOutput = AVCaptureVideoDataOutput()
//                
//                videoOutput.setSampleBufferDelegate(self, queue: dispatch_queue_create("sample buffer delegate", DISPATCH_QUEUE_SERIAL))
//                if captureSession.canAddOutput(videoOutput) {
//                    captureSession.addOutput(videoOutput)
//                }

                //END
                
                //previewView.layer.insertSublayer(previewLayer, atIndex: 1)
                //previewView.contentMode = UIViewContentMode.ScaleAspectFit
                
                captureSession!.startRunning()
            }
        }
    }
    
//    func presentActivityVCForImage(image: UIImage) {
//        self.presentViewController(
//            UIActivityViewController(activityItems: [image], applicationActivities: nil),
//            animated: true,
//            completion: nil
//        )
//    }
    //FILTERS
//    func captureOutput(captureOutput: AVCaptureOutput!, didOutputSampleBuffer sampleBuffer: CMSampleBuffer!, fromConnection connection: AVCaptureConnection!) {
//        guard let filter = Filters[FilterNames[filtersControl.selectedSegmentIndex]] else
//        {
//            return
//        }
//        
//        let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer)
//        let cameraImage = CIImage(CVPixelBuffer: pixelBuffer!)
//        
//        filter!.setValue(cameraImage, forKey: kCIInputImageKey)
//        
//        let filteredImage = UIImage(CIImage: filter!.valueForKey(kCIOutputImageKey) as! CIImage!)
//        
//        dispatch_async(dispatch_get_main_queue())
//            {
//                self.fImageView.image = filteredImage
//        }
//    }
    //END
    
    func toggleCamera() {
        captureSession.beginConfiguration()
        let newDevice = (currentDevice?.position == AVCaptureDevicePosition.Back) ? frontFacingCamera : backFacingCamera
        
        for input in captureSession.inputs {
            captureSession.removeInput(input as! AVCaptureDeviceInput)
        }
        
        let cameraInput: AVCaptureDeviceInput
        do {
            cameraInput = try AVCaptureDeviceInput(device: newDevice)
        } catch {
            print(error)
            return
        }
        if captureSession.canAddInput(cameraInput) {
            captureSession.addInput(cameraInput)
        }
        currentDevice = newDevice
        captureSession.commitConfiguration()
    }
    
    func zoomIn() {
        if let zoomFactor = currentDevice?.videoZoomFactor {
            if zoomFactor < 5.0 {
                let newZoomFactor = min(zoomFactor + 1.0, 5.0)
                do {
                    try currentDevice?.lockForConfiguration()
                    currentDevice?.rampToVideoZoomFactor(newZoomFactor, withRate: 1.0)
                    currentDevice?.unlockForConfiguration()
                } catch {
                    print(error)
                }
            }
        }
    }
    
    func zoomOut() {
        if let zoomFactor = currentDevice?.videoZoomFactor {
            if zoomFactor > 1.0 {
                let newZoomFactor = max(zoomFactor - 1.0, 1.0)
                do {
                    try currentDevice?.lockForConfiguration()
                    currentDevice?.rampToVideoZoomFactor(newZoomFactor, withRate: 1.0)
                    currentDevice?.unlockForConfiguration()
                } catch {
                    print(error)
                }
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        capturedImage = UIImageView(frame: previewView.frame)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        collectionView!.frame = previewView.frame
        previewLayer!.frame = previewView.bounds
    }

    func createGrid() {
        
        for subview in view.subviews {
            if subview is UICollectionView {
                //print(subview)
                subview.removeFromSuperview()
            }
        }
        //let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        //dispatch_async(dispatch_get_global_queue(priority, 0)) {
            let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            layout.itemSize = CGSize(width: self.screenWidth/CGFloat(self.someNumber), height: self.screenWidth/CGFloat(self.someNumber))
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
            self.collectionView! = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
            self.collectionView!.frame = self.previewView.frame
            self.collectionView!.dataSource = self
            self.collectionView!.delegate = self
            self.collectionView!.registerClass(CVCell.self, forCellWithReuseIdentifier: "Cell")
            self.collectionView!.backgroundColor = UIColor.clearColor()
            //dispatch_async(dispatch_get_main_queue()) {
                self.view.insertSubview(self.collectionView!, belowSubview: self.slider!)
            //}
            self.view.setNeedsLayout()
        //}
    }
    
    func valueChanged(sender: UISlider) {
        let index = (Int)(slider!.value + 0.5);
        slider?.setValue(Float(index), animated: false)
        let number = numbers[index]; // <-- This numeric value you want
        if oldIndex != index{
            //print("sliderIndex:\(index)")
            print("Slider: \(number)")
            oldIndex = index
            someNumber = number
            createGrid()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: CustomCollectionViewCellDelegate
    
    func doSnap(sender: AnyObject!) {
        
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            // do some task
            
            if let videoConnection = self.stillImageOutput!.connectionWithMediaType(AVMediaTypeVideo) {
                videoConnection.videoOrientation = AVCaptureVideoOrientation.Portrait
                self.stillImageOutput?.captureStillImageAsynchronouslyFromConnection(videoConnection, completionHandler: {(sampleBuffer, error) in
                    if (sampleBuffer != nil) {
                        
                        dispatch_async(dispatch_get_main_queue()) {
                            
                        let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer)
                        let dataProvider = CGDataProviderCreateWithCFData(imageData)
                        let cgImageRef = CGImageCreateWithJPEGDataProvider(dataProvider, nil, true, CGColorRenderingIntent.RenderingIntentDefault)
                        if self.currentDevice?.position == AVCaptureDevicePosition.Front {
                            let image = UIImage(CGImage: cgImageRef!, scale: 1.0, orientation: UIImageOrientation.LeftMirrored)
                            self.capturedImage.image = image
                            self.capturedImage.clipsToBounds = true
                            print(self.capturedImage.image)
                            self.slider!.hidden = true
                        }
                        if self.currentDevice?.position == AVCaptureDevicePosition.Back {
                            let image = UIImage(CGImage: cgImageRef!, scale: 1.0, orientation: UIImageOrientation.Right)
                            self.capturedImage.image = image
                            self.capturedImage.clipsToBounds = true
                            print(self.capturedImage!.image)
                            self.slider!.hidden = true
                        }
                        }
                    }
                })
            }
        }
    }
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        print("Grid = \(someNumber * someNumber)")
        return someNumber * someNumber
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CVCell
        groutWidth = someNumber
        cell.backgroundColor = UIColor.clearColor()
        cell.layer.borderColor = UIColor.darkGrayColor().CGColor
        cell.layer.borderWidth = CGFloat(groutWidth!)
        //cell.layer.cornerRadius = 20
        cell.delegate = self
        //cell.label?.text = "\(indexPath.section):\(indexPath.row)"
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! CVCell
        if cell.shutter.hidden == true {
            return
        } else {
            doSnap(self)
        cell.shutter.hidden = true
        btn.hidden = true
        cell.tag = indexPath.row
        dispatch_async(dispatch_get_main_queue(), {
            let imageView = UIImageView()
            imageView.frame = self.previewView.frame
            self.capturedImage = imageView
            let mask = CALayer()
            mask.contents = UIImage(named: "white.png")!.CGImage
            mask.bounds = cell.frame
            mask.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            mask.position = cell.center
            imageView.layer.mask = mask
            imageView.layer.masksToBounds = true
            imageView.image = self.capturedImage.image
            imageView.contentMode = .ScaleAspectFill
            //self.view.addSubview(imageView)
            self.view.insertSubview(imageView, belowSubview: collectionView)
            print("The cell is: \(cell.tag)")
        })

        }
    }
    
    func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath) {
        //let cell = collectionView.cellForItemAtIndexPath(indexPath) as! CVCell
    }
    
    @IBAction func flashButton(sender: AnyObject) {
        let avDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        if avDevice.hasTorch {
            do {
                _ = try avDevice.lockForConfiguration()
            } catch {
                print("aaaa")
            }
            if avDevice.torchActive {
                avDevice.torchMode = AVCaptureTorchMode.Off
            } else {
                do {
                    _ = try avDevice.setTorchModeOnWithLevel(1.0)
                } catch {
                    print("bbb")
                }
            }
            avDevice.unlockForConfiguration()
        }
    }
    
    @IBAction func switchCameraButtonPressed(sender: AnyObject) {
        if currentDevice?.position == AVCaptureDevicePosition.Back {
            flash.enabled = false
        }
        if currentDevice?.position == AVCaptureDevicePosition.Front {
            flash.enabled = true
        }
        toggleCamera()
    }
    
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        for subview in view.subviews {
            if subview is UICollectionView {
                subview.removeFromSuperview()
            }
            if subview is UIImageView {
                subview.removeFromSuperview()
            }
        }
        slider!.hidden = false
        createGrid()
        dummyArray = [CVCell]()
        btn.hidden = false
        btn.enabled = true
        btn.backgroundColor = UIColor.whiteColor()
    }
    
    @IBAction func saveImageButtonPressed(sender: AnyObject) {
        let image = self.view?.capture()
        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        for subview in view.subviews {
            if subview is UICollectionView {
                subview.removeFromSuperview()
            }
            if subview is UIImageView {
                subview.removeFromSuperview()
            }
            slider!.hidden = false
            createGrid()
            dummyArray = [CVCell]()
            btn.hidden = false
            btn.enabled = true
            btn.backgroundColor = UIColor.whiteColor()
        }
    }
    
    @IBAction func zoomPlusPressed(sender: AnyObject) {
        zoomIn()
    }
    
    @IBAction func zoomMinusPressed(sender: AnyObject) {
        zoomOut()
    }
    
    @IBAction func gridButtonPressed(sender: AnyObject) {
        if collectionView.hidden == false {
            btn.enabled = false
            
        collectionView.hidden = true
            slider!.hidden = true
        } else {
            collectionView.hidden = false
            slider!.hidden = false
            btn.enabled = true
        }
    }
    
    func buttonActionEnd(sender: UIButton) {
        dispatch_async(dispatch_get_main_queue()) {
            self.btn.backgroundColor = UIColor.whiteColor()
            if self.dummyArray.count < 1 {
                self.btn.enabled = false
                self.btn.backgroundColor = UIColor.darkGrayColor()
            }
        }
    }
    
    func buttonAction(sender: UIButton) {
        dispatch_async(dispatch_get_main_queue()) {
            self.btn.backgroundColor = UIColor.grayColor()
        }
        
        //let maxCount = someNumber * someNumber
        
        let currentCells = collectionView.visibleCells() as! [CVCell]
        print("currentCells indices:\(dummyArray.indices)")
        
        if dummyArray.isEmpty == true  {
            //UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.dummyArray = currentCells
            let myCell = self.dummyArray.randomItem()
            let index = self.collectionView.indexPathForCell(myCell)
            myCell.tag = index!.row
            
            print("myCell:\(myCell.tag)")
            
            if myCell.shutter.hidden == false {
                
                print("CurrentCells: \(currentCells.count)")
                self.doSnap(CVCell)
                dispatch_async(dispatch_get_main_queue()) {
                    let imageView = UIImageView()
                    imageView.frame = self.previewView.frame
                    self.capturedImage = imageView
                    let mask = CALayer()
                    mask.contents = UIImage(named: "white.png")!.CGImage
                    mask.bounds = myCell.frame
                    mask.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                    mask.position = myCell.center
                    imageView.layer.mask = mask
                    imageView.layer.masksToBounds = true
                    imageView.image = self.capturedImage.image
                    imageView.contentMode = .ScaleAspectFill
                    self.view.addSubview(imageView)
                    print("The cell tag is: \(myCell.tag)")
                    myCell.shutter.hidden = true
                }
            }
            self.view.layoutIfNeeded()
        //}, completion: nil)
        
        } else {
            
            //UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                
            
            let myCell = self.dummyArray.randomItem()
            let index = self.collectionView.indexPathForCell(myCell)
            myCell.tag = index!.row
            
            print("myCell:\(myCell.tag)")
            
            if myCell.shutter.hidden == false {
                
                print("CurrentCells: \(currentCells.count)")
                self.doSnap(CVCell)

                dispatch_async(dispatch_get_main_queue()) {
                    let imageView = UIImageView()
                    imageView.frame = self.previewView.frame
                    self.capturedImage = imageView
                    let mask = CALayer()
                    mask.contents = UIImage(named: "white.png")!.CGImage
                    mask.bounds = myCell.frame
                    mask.anchorPoint = CGPoint(x: 0.5, y: 0.5)
                    mask.position = myCell.center
                    imageView.layer.mask = mask
                    imageView.layer.masksToBounds = true
                    imageView.image = self.capturedImage.image
                    imageView.contentMode = .ScaleAspectFill
                    self.view.addSubview(imageView)
                    print("The cell tag is: \(myCell.tag)")
                    myCell.shutter.hidden = true
                }
            }
                self.view.layoutIfNeeded()
                self.view.setNeedsDisplay()
                //}, completion: nil)
            
        }
    }

    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        let sourceController = segue.sourceViewController as! MenuTableViewController
        self.title = sourceController.currentItem
    }
}

extension Array {
    mutating func randomItem() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self.removeAtIndex(index)
        //return self[index]
    }
}
