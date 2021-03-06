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

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, CustomCollectionViewCellDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var snapSelector: UIBarButtonItem!
    @IBOutlet weak var btn2: UIButton!
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
    @IBOutlet var gridSettingsView: UIView!
    @IBOutlet weak var RedLabel: UILabel!
    @IBOutlet weak var GreenLabel: UILabel!
    @IBOutlet weak var BlueLabel: UILabel!
    @IBOutlet weak var RedSlider: UISlider!
    @IBOutlet weak var GreenSlider: UISlider!
    @IBOutlet weak var BlueSlider: UISlider!
    @IBOutlet weak var DisplayingLabel: UILabel!
    @IBOutlet weak var doneColorButton: UIButton!
    @IBOutlet weak var groutWidthSlider: UISlider!
    @IBOutlet weak var groutWidthLabel: UILabel!
    
    // MARK: - Public API
    var RedColor: Float = 0
    var GreenColor: Float = 0
    var BlueColor: Float = 0
    var groutColor = UIColor.lightGrayColor()
    var snapState = 0
    var dummyArray = [CVCell]()
    var groutRadius: Float = 0.0
    var groutWidth: Float = 0.5
    var tileCorner: Int?
    var someNumber = 1
    var screenWidth: CGFloat!
    //Slider Variables
    var slider:UISlider?
    var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    var oldIndex = 0
    var previewView: UIView!
    var capturedImage: UIImageView!
    var fingerPrint: UIImageView!
    var captureSession : AVCaptureSession!
    var stillImageOutput : AVCaptureStillImageOutput!
    var previewLayer : AVCaptureVideoPreviewLayer!
    var frameRect: CGRect?
    var backFacingCamera: AVCaptureDevice?
    var frontFacingCamera: AVCaptureDevice?
    var currentDevice: AVCaptureDevice?
    var zoomInGestureRecognizer = UISwipeGestureRecognizer()
    var zoomOutGestureRecognizer = UISwipeGestureRecognizer()
    var borderView: UIView?
    var cellsTouched = [CVCell]()
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    // MARK: - Phone Type Enum
    enum UIUserInterfaceIdiom : Int {
        case Unspecified
        case Phone
        case Pad
    }
    struct ScreenSize {
        static let SCREEN_WIDTH         = UIScreen.mainScreen().bounds.size.width
        static let SCREEN_HEIGHT        = UIScreen.mainScreen().bounds.size.height
        static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    }
    struct DeviceType {
        static let IS_IPHONE_4_OR_LESS  = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
        static let IS_IPHONE_5          = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
        static let IS_IPHONE_6          = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
        static let IS_IPHONE_6P         = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
        static let IS_IPAD              = UIDevice.currentDevice().userInterfaceIdiom == .Pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    }

    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        gridButton.enabled = false
        save.enabled = false
        
        let attributes = [NSFontAttributeName: UIFont.fontAwesomeOfSize(24)] as Dictionary!
        flash.setTitleTextAttributes(attributes, forState: .Normal)
        flash.title = String.fontAwesomeIconWithName(.SunO)
        switchCamera.setTitleTextAttributes(attributes, forState: .Normal)
        switchCamera.title = String.fontAwesomeIconWithName(.Refresh)
        cancel.setTitleTextAttributes(attributes, forState: .Normal)
        cancel.title = String.fontAwesomeIconWithName(.Eraser)
        save.setTitleTextAttributes(attributes, forState: .Normal)
        save.title = String.fontAwesomeIconWithName(.Photo)
//        share.setTitleTextAttributes(attributes, forState: .Normal)
//        share.title = String.fontAwesomeIconWithName(.Share)
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
        snapSelector.setTitleTextAttributes(attributes, forState: .Normal)
        snapSelector.title = String.fontAwesomeIconWithName(.Random)
//        snapSelector.setTitleTextAttributes(attributes, forState: .Normal)
//        snapSelector.title = String.fontAwesomeIconWithName(.HandPointerO)

        //Camera Buttons
        btn.frame = CGRectMake((UIScreen.mainScreen().bounds.size.width / 2) - 35, (UIScreen.mainScreen().bounds.size.height) - 129, 70, 70)
        btn.backgroundColor = UIColor.whiteColor()
        btn.addTarget(self, action: #selector(ViewController.buttonAction(_:)), forControlEvents: .TouchDown)
        btn.addTarget(self, action: #selector(ViewController.buttonActionEnd(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btn)
        btn.layer.cornerRadius = 0.5 * btn.bounds.size.width
        btn2.frame = CGRectMake((UIScreen.mainScreen().bounds.size.width / 2) - 29, (UIScreen.mainScreen().bounds.size.height) - 129, 58, 58)
        btn2.backgroundColor = UIColor.clearColor()
        btn2.enabled = false
        self.view.addSubview(btn2)
        btn2.layer.cornerRadius = 0.5 * btn2.bounds.size.width
        btn2.layer.borderWidth = 1.0
        btn2.layer.borderColor = UIColor.blackColor().CGColor
        capturedImage?.image = UIImage(named: "shutter")
        screenWidth = UIScreen.mainScreen().bounds.size.width
        
        // Grid Slider
        if DeviceType.IS_IPHONE_4_OR_LESS {
            slider = UISlider(frame: CGRectMake(20, screenWidth + 38, screenWidth - 40, 50))
        } else {
            slider = UISlider(frame: CGRectMake(20, screenWidth + 54, screenWidth - 40, 50))
        }
        self.view.addSubview(slider!)
        let numberOfSteps = Float(numbers.count - 1)
        slider!.maximumValue = numberOfSteps;
        slider!.minimumValue = 0;
        slider!.continuous = true
        slider!.addTarget(self, action: #selector(ViewController.valueChanged(_:)), forControlEvents: .ValueChanged)
        slider!.minimumTrackTintColor = UIColor.whiteColor()
        slider!.setThumbImage((UIImage.fontAwesomeIconWithName(.DotCircleO, textColor: UIColor.whiteColor(), size: CGSizeMake(36, 36))), forState: .Normal)
        createGrid()
        
        // AV
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
            stillImageOutput = AVCaptureStillImageOutput()
            stillImageOutput!.outputSettings = [AVVideoCodecKey: AVVideoCodecJPEG]

            if captureSession!.canAddOutput(stillImageOutput) {
                captureSession!.addOutput(stillImageOutput)
                previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                previewLayer!.videoGravity = AVLayerVideoGravityResizeAspectFill
                previewLayer!.connection?.videoOrientation = AVCaptureVideoOrientation.Portrait
                previewView.layer.addSublayer(previewLayer)
                previewView.layer.borderColor = groutColor.CGColor
                previewView.layer.borderWidth = CGFloat(groutWidth)
                captureSession!.startRunning()
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        capturedImage = UIImageView(frame: previewView.frame)
        if DeviceType.IS_IPHONE_4_OR_LESS {
            navigationController?.setToolbarHidden(true, animated: false)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        collectionView!.frame = previewView.frame
        previewLayer!.frame = previewView.bounds
        borderView = UIView(frame: collectionView.frame)
        self.view.addSubview(borderView!)
        borderView?.backgroundColor = UIColor.clearColor()
        borderView!.layer.borderColor = groutColor.CGColor
        borderView!.layer.borderWidth = CGFloat(groutWidth)
        borderView?.hidden = true
        rateMe()
    }
    
    // MARK: - Grid and Slider
    func createGrid() {
        for subview in view.subviews {
            if subview is UICollectionView {
                //print(subview)
                subview.removeFromSuperview()
            }
        }
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: self.screenWidth/CGFloat(self.someNumber), height: self.screenWidth/CGFloat(self.someNumber))
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0.25
        self.collectionView! = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        self.collectionView!.frame = self.previewView.frame
        self.collectionView!.dataSource = self
        self.collectionView!.delegate = self
        self.collectionView!.registerClass(CVCell.self, forCellWithReuseIdentifier: "Cell")
        self.collectionView!.backgroundColor = UIColor.clearColor()
        // Added to 1.3 Bug Fix - collectionView was scrolling
        self.collectionView!.scrollEnabled = false
        dispatch_async(dispatch_get_main_queue()) {
            self.view.insertSubview(self.collectionView!, belowSubview: self.slider!)
        }
        self.view.setNeedsLayout()
    }
    
    func valueChanged(sender: UISlider) {
        let index = (Int)(slider!.value + 0.5);
        slider?.setValue(Float(index), animated: false)
        let number = numbers[index]
        if oldIndex != index{
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
    
    // MARK: - Camera Snap
    func doSnap(sender: AnyObject!) {
        
        let priority = QOS_CLASS_USER_INITIATED
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            
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
    
    func postSnap() {
        let snapCell = self.dummyArray.randomItem()
        //let snapCell = self.dummyArray.iterateItem()
        let index = self.collectionView.indexPathForCell(snapCell)
        //snapCell.tag = index!.item
        let cell = index!.item
        let imageView = UIImageView()
        imageView.frame = self.previewView.frame
        self.capturedImage = imageView
        let mask = CALayer()
        mask.contents = UIImage(named: "white.png")!.CGImage
        mask.bounds = snapCell.frame
        mask.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        mask.position = snapCell.center
        imageView.layer.mask = mask
        imageView.layer.masksToBounds = true
        imageView.image = self.capturedImage.image
        imageView.contentMode = .ScaleAspectFill
        snapCell.layer.borderColor = UIColor.clearColor().CGColor
        self.view.insertSubview(imageView, belowSubview: self.collectionView)
        print("The cell is: \(cell)")
    }
    
    // MARK: - Camera Button
    func buttonAction(sender: UIButton) {
        
        dispatch_async(dispatch_get_main_queue()) {
            self.btn2.backgroundColor = UIColor.grayColor()
        }
        
        let currentCells = self.collectionView.visibleCells() as! [CVCell]
        //print("currentsnapCell indices:\(self.dummyArray.indices)")
        
        if self.dummyArray.isEmpty == true  {
            UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.dummyArray = currentCells
            self.doSnap(CVCell)
            self.postSnap()
            self.view.layoutIfNeeded()
            }, completion: nil)
        } else {
            UIView.animateWithDuration(0.5, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
                self.doSnap(CVCell)
                self.postSnap()
                self.view.layoutIfNeeded()
            self.view.setNeedsDisplay()
            }, completion: nil)
        }
    }
    
    func buttonActionEnd(sender: UIButton) {
        self.snapSelector.enabled = false
        self.switchCamera.enabled = false

        dispatch_async(dispatch_get_main_queue()) {
            self.btn2.backgroundColor = UIColor.clearColor()
            if self.dummyArray.count < 1 {
                self.btn.hidden = true
                self.gridButton.enabled = true
                self.save.enabled = true
                self.zoomMinus.enabled = false
                self.zoomPlus.enabled = false
                self.switchCamera.enabled = false
                self.flash.enabled = false
                self.borderView?.layer.borderColor = UIColor.clearColor().CGColor
                if DeviceType.IS_IPHONE_4_OR_LESS {
                    self.navigationController?.setToolbarHidden(false, animated: false)
                }
            }
        }
    }
    
    // MARK: - UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Grid = \(someNumber * someNumber)")
        return someNumber * someNumber
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CVCell
        let borderWidth = groutWidth

        cell.frame = CGRectInset(cell.frame, -CGFloat(borderWidth), -CGFloat(borderWidth))
        cell.backgroundColor = UIColor.clearColor()
        //if groutColor != nil {
            cell.layer.borderColor = groutColor.CGColor
//        } else {
//            cell.layer.borderColor = UIColor.lightGrayColor().CGColor
//        }
        cell.layer.borderWidth = CGFloat(groutWidth)
        //cell.layer.cornerRadius = CGFloat(groutRadius)
        cell.delegate = self
        //cell.label?.text = "\(indexPath.section):\(indexPath.row)"
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! CVCell
        //let currentCells = collectionView.visibleCells()
        //print(currentCells)
        //if (cellsTouched.indexOf(cell.tag) != nil) {
        
        if cellsTouched.contains(cell) {
            return
        } else {
            if snapState == 1 {
                doSnap(self)
                switchCamera.enabled = false
                snapSelector.enabled = false
                //cell.shutter.hidden = true
                btn.hidden = true
                cell.tag = indexPath.item
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
                    cell.layer.borderColor = UIColor.clearColor().CGColor
                    self.view.insertSubview(imageView, belowSubview: collectionView)
                    print("The cell is: \(cell.tag)")
                    self.cellsTouched.append(cell)
                    print(self.cellsTouched)
                    if self.cellsTouched.count > (self.someNumber * self.someNumber) - 1 {
                        self.flash.enabled = false
                        self.gridButton.enabled = true
                        self.save.enabled = true
                    }

                })
            }
        }
    }
    // MARK: - Review App
    var iMinSessions = 3
    var iTryAgainSessions = 6
    
    func rateMe() {
        let neverRate = NSUserDefaults.standardUserDefaults().boolForKey("neverRate")
        var numLaunches = NSUserDefaults.standardUserDefaults().integerForKey("numLaunches") + 1
        
        if (!neverRate && (numLaunches == iMinSessions || numLaunches >= (iMinSessions + iTryAgainSessions + 1)))
        {
            showRateMe()
            numLaunches = iMinSessions + 1
        }
        NSUserDefaults.standardUserDefaults().setInteger(numLaunches, forKey: "numLaunches")
    }
    
    func showRateMe() {
        let alert = UIAlertController(title: "Rate Us", message: "Thanks for using Tile Cam", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Rate Tile Cam", style: UIAlertActionStyle.Default, handler: { alertAction in
            UIApplication.sharedApplication().openURL(NSURL(string : "itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=1082732582")!)
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "No Thanks", style: UIAlertActionStyle.Default, handler: { alertAction in
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "neverRate")
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Maybe Later", style: UIAlertActionStyle.Default, handler: { alertAction in
            alert.dismissViewControllerAnimated(true, completion: nil)
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    }

    // MARK: - Toolbar Buttons
    //Torch
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
    //Toggle cameras
    @IBAction func switchCameraButtonPressed(sender: AnyObject) {
        if currentDevice?.position == AVCaptureDevicePosition.Back {
            flash.enabled = false
        }
        if currentDevice?.position == AVCaptureDevicePosition.Front {
            flash.enabled = true
        }
        toggleCamera()
    }
    
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
    //Cancel
    @IBAction func cancelButtonPressed(sender: AnyObject) {
        for subview in view.subviews {
            if subview is UICollectionView {
                subview.removeFromSuperview()
            }
            if subview is UIImageView {
                subview.removeFromSuperview()
            }
            if DeviceType.IS_IPHONE_4_OR_LESS {
                self.navigationController?.setToolbarHidden(true, animated: false)
            }
        }
        if snapState == 0 {
            slider!.hidden = false
            createGrid()
            dummyArray = [CVCell]()
            btn.hidden = false
            btn.enabled = true
            btn.backgroundColor = UIColor.whiteColor()
            self.gridButton.enabled = false
            self.save.enabled = false
            self.zoomMinus.enabled = true
            self.zoomPlus.enabled = true
            self.switchCamera.enabled = true
            self.snapSelector.enabled = true
            self.flash.enabled = true
            groutColor = UIColor.lightGrayColor()
            groutWidth = 0.5
            borderView?.hidden = true
            borderView!.layer.borderColor = groutColor.CGColor
            borderView!.layer.borderWidth = 0.5
            cellsTouched = []
        } else {
            slider!.hidden = false
            createGrid()
            dummyArray = [CVCell]()
            btn.hidden = true
            btn.enabled = true
            btn.backgroundColor = UIColor.whiteColor()
            self.gridButton.enabled = false
            self.save.enabled = false
            self.zoomMinus.enabled = true
            self.zoomPlus.enabled = true
            self.switchCamera.enabled = true
            self.snapSelector.enabled = true
            self.flash.enabled = true
            groutColor = UIColor.lightGrayColor()
            groutWidth = 0.5
            borderView?.hidden = true
            borderView!.layer.borderColor = groutColor.CGColor
            borderView!.layer.borderWidth = 0.5
            cellsTouched = []
        }
    }
    //Save
    @IBAction func saveImageButtonPressed(sender: AnyObject) {
        
        let alert = UIAlertController(title: "Image Saved!", message:"", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default) { _ in })
        self.presentViewController(alert, animated: true){}
        
        dispatch_async(dispatch_get_main_queue()) {
            let image = self.view?.capture()
            UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
            
            dispatch_async(dispatch_get_main_queue()) {
                for subview in self.view.subviews {
                    if subview is UICollectionView {
                        subview.removeFromSuperview()
                    }
                    if subview is UIImageView {
                        subview.removeFromSuperview()
                    }
                    if self.snapState == 0 {
                        self.slider!.hidden = false
                        self.createGrid()
                        self.dummyArray = [CVCell]()
                        self.btn.hidden = false
                        self.btn.enabled = true
                        self.btn.backgroundColor = UIColor.whiteColor()
                        self.groutColor = UIColor.lightGrayColor()
                        self.groutWidth = 0.5
                        self.borderView!.layer.borderColor = self.groutColor.CGColor
                        self.borderView!.layer.borderWidth = 0.5
                        self.save.enabled = false
                        self.gridButton.enabled = false
                        self.flash.enabled = true
                        self.switchCamera.enabled = true
                        self.snapSelector.enabled = true
                        self.zoomMinus.enabled = true
                        self.zoomPlus.enabled = true
                        if DeviceType.IS_IPHONE_4_OR_LESS {
                            self.navigationController?.setToolbarHidden(true, animated: false)
                        }
                        self.borderView?.hidden = true
                        self.cellsTouched = []
                    } else {
                        self.slider!.hidden = false
                        self.createGrid()
                        self.dummyArray = [CVCell]()
                        self.btn.hidden = true
                        self.btn.enabled = true
                        self.btn.backgroundColor = UIColor.whiteColor()
                        self.groutColor = UIColor.lightGrayColor()
                        self.groutWidth = 0.5
                        self.borderView!.layer.borderColor = self.groutColor.CGColor
                        self.borderView!.layer.borderWidth = 0.5
                        self.save.enabled = false
                        self.gridButton.enabled = false
                        self.flash.enabled = true
                        self.switchCamera.enabled = true
                        self.snapSelector.enabled = true
                        self.zoomMinus.enabled = true
                        self.zoomPlus.enabled = true
                        if DeviceType.IS_IPHONE_4_OR_LESS {
                            self.navigationController?.setToolbarHidden(true, animated: false)
                        }
                        self.borderView?.hidden = true
                        self.cellsTouched = []

                    }
                }
            }
        }
    }
    
    // Snap Selector
    @IBAction func snapSelectorPressed(sender: UIBarButtonItem) {
        if snapState == 0 {
            snapState = 1
            btn.hidden = true
            btn2.hidden = true
            snapSelector.title = String.fontAwesomeIconWithName(.HandPointerO)
            showFingerPrint()
            print("snapState =\(snapState)")
        } else {
            snapState = 0
            btn.hidden = false
            btn2.hidden = false
            snapSelector.title = String.fontAwesomeIconWithName(.Random)
            animateSnapButton()
            print("snapState =\(snapState)")
        }
    }
    func showFingerPrint() {
        fingerPrint  = UIImageView(frame: (previewView.frame))
        //fingerPrint.frame = previewView.frame
        //fingerPrint.bounds = previewView.bounds
        fingerPrint.image = UIImage(named: "fingerprint")
        self.view.addSubview(fingerPrint)
        UIView.animateWithDuration(1.0, animations: {
            self.fingerPrint.alpha = 0
            }, completion: {
                finished in
                self.fingerPrint.removeFromSuperview()
        })
    }
    func animateSnapButton() {
        btn.transform = CGAffineTransformMakeScale(0, 0)
        UIView.animateWithDuration(1.0,
            delay: 0.5,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 10,
            options: .CurveLinear,
            animations: {
                self.btn.transform = CGAffineTransformIdentity
            },
            completion: nil
        )
    }
    
    //Share
//    func presentActivityVCForImage(image: UIImage) {
//        self.presentViewController(
//            UIActivityViewController(activityItems: [image], applicationActivities: nil), animated: true, completion: nil)
//    }
//    
//    @IBAction func shareButtonPressed(sender: AnyObject) {
//        let image = self.view?.capture()
//        self.presentActivityVCForImage(image!)
//        
//        UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
//        for subview in view.subviews {
//            if subview is UICollectionView {
//                subview.removeFromSuperview()
//            }
//            if subview is UIImageView {
//                subview.removeFromSuperview()
//            }
//            slider!.hidden = false
//            createGrid()
//            dummyArray = [CVCell]()
//            btn.hidden = false
//            btn.enabled = true
//            btn.backgroundColor = UIColor.whiteColor()
//        }
//    }
    //Zoom
    @IBAction func zoomPlusPressed(sender: AnyObject) {
        zoomIn()
    }
    
    @IBAction func zoomMinusPressed(sender: AnyObject) {
        zoomOut()
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
    
    // MARK: - Grout Controls
    @IBAction func gridButtonPressed(sender: AnyObject) {
        if gridSettingsView != nil {
            addGridSettingsView(self)
            btn.enabled = false
            slider!.hidden = true
        }
    }
    
    func addGridSettingsView(view: ViewController) {
        gridSettingsView.frame = previewView.frame
        gridSettingsView.bounds = previewView.bounds
        gridSettingsView.clipsToBounds = true
        
        self.view.addSubview(gridSettingsView)
    }
    
    func removeGridSettingsView() {
        gridSettingsView.removeFromSuperview()
    }
    //Grout width
    @IBAction func groutSliderValueChanged(sender: UISlider) {
        let selectedValue = Float(sender.value)
        let roundedValue: Float = roundf(selectedValue / 0.5) * 0.5
        groutWidthLabel.text = "W: \(String(stringInterpolationSegment: roundedValue))"
        groutWidth = roundedValue
    }
    //Grout color sliders
    @IBAction func RedSliderAction(sender: UISlider) {
        ChangeColors()
    }
    
    @IBAction func GreenSliderAction(sender: UISlider) {
        ChangeColors()
    }
    
    @IBAction func BlueSliderAction(sender: UISlider) {
        ChangeColors()
    }
    
    func ChangeDisplayLabelColor(){
        DisplayingLabel.backgroundColor = UIColor(red: CGFloat(RedColor), green: CGFloat(GreenColor), blue: CGFloat(BlueColor), alpha: 1.0)
        changeLabelNumbers()
    }
    
    func ChangeColors(){
        RedColor = RedSlider.value
        GreenColor = GreenSlider.value
        BlueColor = BlueSlider.value
        ChangeDisplayLabelColor()
    }
    
    func changeLabelNumbers(){
        let RoundedRed = String(format: "%0.0f", (RedColor * 255))
        let RoundedGreen = String(format: "%0.0f", (GreenColor * 255))
        let RoundedBlue = String(format: "%0.0f", (BlueColor * 255))
        RedLabel.text = "R: \(RoundedRed)"
        GreenLabel.text = "G: \(RoundedGreen)"
        BlueLabel.text = "B: \(RoundedBlue)"
    }
    
    @IBAction func doneColorButtonPressed(sender: AnyObject) {
        gridSettingsView.removeFromSuperview()
        slider!.hidden = true
        btn.enabled = true
        if DisplayingLabel.backgroundColor == nil {
            groutColor = UIColor.lightGrayColor()
        } else if DisplayingLabel.backgroundColor != nil {
            groutColor = DisplayingLabel.backgroundColor!
        }
        borderView?.hidden = false
        borderView!.layer.borderColor = groutColor.CGColor
        borderView!.layer.borderWidth = CGFloat(groutWidth)
        createGrid()
    }
    
    // MARK: - Help Segue
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        let sourceController = segue.sourceViewController as! MenuTableViewController
        self.title = sourceController.currentItem
    }
}

// MARK: - Extensions
extension Array {
    mutating func randomItem() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        print("index: \(index)")
        return self.removeAtIndex(index)
        //return self[index]
    }
    mutating func iterateItem() -> Element {
        let index = Index(self.count)
        //return self.removeAtIndex(index)
        return self[index]
    }
}