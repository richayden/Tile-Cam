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

//import CoreMedia

//class MaskView : UIView {
//    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        if let mask = self.layer.mask {
//            mask.frame = self.bounds
//        }
//    }
//}

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
    
    var someNumber = 1
    
    var screenWidth: CGFloat!
    
    //Slider Variables
    var slider:UISlider?
    // These number values represent each slider position
    var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] //Add your values here
    var oldIndex = 0
    
    //Camera Variables
    
    //@IBOutlet weak
    var previewView: UIView!
    
    var capturedImage: UIImageView!
    
    var captureSession : AVCaptureSession!
    var stillImageOutput : AVCaptureStillImageOutput!
    var previewLayer : AVCaptureVideoPreviewLayer!
    //var iv : UIImageView!
    
    var frameRect: CGRect?
    //var photoRect: CGRect?
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    var backFacingCamera: AVCaptureDevice?
    var frontFacingCamera: AVCaptureDevice?
    var currentDevice: AVCaptureDevice?
    
    //var toggleCameraGestureRecognizer = UISwipeGestureRecognizer()
    
    var zoomInGestureRecognizer = UISwipeGestureRecognizer()
    var zoomOutGestureRecognizer = UISwipeGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

        
        //self.collectionView.registerClass(CVCell.self, forCellWithReuseIdentifier: "Cell")
        
//        let btn: UIButton = UIButton(frame: CGRectMake((UIScreen.mainScreen().bounds.size.width / 2) - 30, (UIScreen.mainScreen().bounds.size.height) - 80, 60, 60))
//        btn.backgroundColor = UIColor.whiteColor()
//        //btn.setTitle("Click Me", forState: UIControlState.Normal)
//        btn.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
//        //btn.tag = 1               // change tag property
//        self.view.addSubview(btn) // add to view as subview
//        
//        btn.layer.cornerRadius = 30
//        //btn.layer.borderWidth = 1
//        //btn.layer.borderColor = UIColor.blackColor().CGColor
//        btn.layer.shadowColor = UIColor.whiteColor().CGColor
//        btn.layer.shadowOpacity = 1
//        btn.layer.shadowOffset = CGSizeZero
//        btn.layer.shadowRadius = 10
        
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
        
        // slider values go from 0 to the number of values in your numbers array
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
                //flash.enabled = true
                
            } else if device.position == AVCaptureDevicePosition.Front {
                frontFacingCamera = device
                //flash.enabled = false
                
            }
        }
        currentDevice = backFacingCamera
        //flash.enabled = true
        
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
    func presentActivityVCForImage(image: UIImage) {
        self.presentViewController(
            UIActivityViewController(activityItems: [image], applicationActivities: nil),
            animated: true,
            completion: nil
        )
    }
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
        //capturedImage.clipsToBounds = false
        //capturedImage.contentMode = UIViewContentMode.ScaleAspectFill
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        collectionView!.frame = previewView.frame
        previewLayer!.frame = previewView.bounds
//        previewView.contentMode = UIViewContentMode.ScaleAspectFit
    }
    
    func createGrid() {
        
        for subview in view.subviews {
            if subview is UICollectionView {
                //print(subview)
                subview.removeFromSuperview()
            }
        }
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        //layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: screenWidth/CGFloat(someNumber), height: screenWidth/CGFloat(someNumber))
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView! = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView!.frame = previewView.frame
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.registerClass(CVCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView!.backgroundColor = UIColor.clearColor()
        
        self.view.insertSubview(collectionView!, belowSubview: slider!)
        //self.collectionView!.reloadData()
    }
    
    func valueChanged(sender: UISlider) {
        
        let index = (Int)(slider!.value + 0.5);
        slider?.setValue(Float(index), animated: false)
        let number = numbers[index]; // <-- This numeric value you want
        if oldIndex != index{
            //print("sliderIndex:\(index)")
            print("number: \(number)")
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
    
    func doSnap(sender:AnyObject!) {
    //func doSnap(cell: CVCell) {
        
        if let videoConnection = stillImageOutput!.connectionWithMediaType(AVMediaTypeVideo) {
            videoConnection.videoOrientation = AVCaptureVideoOrientation.Portrait
            stillImageOutput?.captureStillImageAsynchronouslyFromConnection(videoConnection, completionHandler: {(sampleBuffer, error) in
                if (sampleBuffer != nil) {
                    let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer)
                    let dataProvider = CGDataProviderCreateWithCFData(imageData)
                    
                    //let cgImageRef = CGImageCreateWithJPEGDataProvider(dataProvider, nil, true, CGColorRenderingIntent.RenderingIntentAbsoluteColorimetric)
                    let cgImageRef = CGImageCreateWithJPEGDataProvider(dataProvider, nil, true, CGColorRenderingIntent.RenderingIntentDefault)
                    
                    if self.currentDevice?.position == AVCaptureDevicePosition.Front {
                        let image = UIImage(CGImage: cgImageRef!, scale: 1.0, orientation: UIImageOrientation.LeftMirrored)
                        
                        self.capturedImage.image = image
                        self.capturedImage.clipsToBounds = true
                        //self.capturedImage.contentMode = .ScaleAspectFit
                        print(self.capturedImage.image)
                        
                        self.slider!.hidden = true
                    }
                    
                    if self.currentDevice?.position == AVCaptureDevicePosition.Back {
                        let image = UIImage(CGImage: cgImageRef!, scale: 1.0, orientation: UIImageOrientation.Right)
                        
                        self.capturedImage.image = image
                        self.capturedImage.clipsToBounds = true
                        //self.capturedImage.contentMode = .ScaleAspectFit
                        print(self.capturedImage!.image)
                        
                        self.slider!.hidden = true
                    }
                    
                    //print(self.someNumber)
                    
                    
                }
            })
        }
    }
    

    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return someNumber * someNumber
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CVCell
        
        // Configure the cell
        cell.backgroundColor = UIColor.clearColor()
        cell.layer.borderColor = UIColor.darkGrayColor().CGColor
        cell.layer.borderWidth = 0.5
        //cell.layer.cornerRadius = 20
        
        //cell.shutter?.image = UIImage(named: "shutter")
        
        //cell.shutter.alpha = 0.1
        cell.delegate = self
        //cell.addSubview(capturedImage)
        //cell.setImage(image)
        
        
        
        

        //cell.label?.text = "\(indexPath.section):\(indexPath.row)"
        
        return cell
    }
    
//    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! CVCell
    
//    }
    
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! CVCell

        if cell.shutter.hidden == true {
            return
        } else {
            doSnap(CVCell)
        cell.shutter.hidden = true
            
        cell.tag = indexPath.row
        //cell.layer.borderColor = UIColor.clearColor().CGColor
            
        dispatch_async(dispatch_get_main_queue(), {
            let imageView = UIImageView()
            imageView.frame = self.previewView.frame
            
            self.capturedImage = imageView
            
            let mask = CALayer()
            mask.contents = UIImage(named: "white.png")!.CGImage
            //mask.frame = cell.bounds
            //mask.bounds = self.capturedImage.frame
            mask.bounds = cell.frame
            //CGRect(x: 0, y: 0, width: cell.bounds.width, height: cell.bounds.height)
            mask.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            mask.position = cell.center
            //mask.position = CGPoint(x: cell.frame.origin.x, y: cell.frame.origin.y)
            //imageView.alpha = 0.6
            imageView.layer.mask = mask
            //imageView.backgroundColor = UIColor.whiteColor()
            imageView.layer.masksToBounds = true
            //self.capturedImage = imageView
            imageView.image = self.capturedImage.image
            //imageView.clipsToBounds = true
            imageView.contentMode = .ScaleAspectFill
            self.view.addSubview(imageView)
            
//            imageView.layer.borderColor = cell.layer.borderColor
//            imageView.layer.borderWidth = cell.layer.borderWidth * 10
//            imageView.layer.cornerRadius = cell.layer.cornerRadius
            
            print("The cell is: \(cell.tag)")
            
        })

        }
    }
    
    // change background color back when user releases touch
    func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath) {
        //let cell = collectionView.cellForItemAtIndexPath(indexPath) as! CVCell
        
    }
    
    //    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    //    {
    //        return CGSize(width: Int(collectionView.frame.size.width)/numbers[3], height: Int(collectionView.frame.size.width)/numbers[3])
    //    }
    
    
    // MARK: UICollectionViewDelegate
    
    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
    }
    */
    
    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
    }
    */
    
    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
    return false
    }
    
    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
    return false
    }
    
    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
    
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
                //print(subview)
                subview.removeFromSuperview()
            }
            if subview is UIImageView {
                //print(subview)
                subview.removeFromSuperview()
            }
        }
        slider!.hidden = false
        createGrid()
    }
    @IBAction func saveImageButtonPressed(sender: AnyObject) {
        
        let image = self.view?.capture()
        
        //self.presentActivityVCForImage(image!)

        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
        
        for subview in view.subviews {
            if subview is UICollectionView {
                //print(subview)
                subview.removeFromSuperview()
            }
            if subview is UIImageView {
                //print(subview)
                subview.removeFromSuperview()
            }
        }
        slider!.hidden = false
        createGrid()
    }
    @IBAction func zoomPlusPressed(sender: AnyObject) {
        zoomIn()
    }
    
    @IBAction func zoomMinusPressed(sender: AnyObject) {
        zoomOut()
    }
    @IBAction func gridButtonPressed(sender: AnyObject) {
        if collectionView.hidden == false {
        collectionView.hidden = true
            slider!.hidden = true
        } else {
            collectionView.hidden = false
            slider!.hidden = false
        }
    }
//    func buttonAction(sender: UIButton) {
//        doSnap(CVCell)
//    }

    //FILTERS
//    override func viewDidLayoutSubviews() {
//        let topMargin = topLayoutGuide.length
//        
//        mainGroup.frame = CGRect(x: 0, y: topMargin, width: view.frame.width, height: view.frame.height - topMargin).insetBy(dx: 5, dy: 5)
//    }
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        let sourceController = segue.sourceViewController as! MenuTableViewController
        self.title = sourceController.currentItem
    }


    
}
