//
//  CustomView.swift
//
//  Code generated using QuartzCode 1.39.12 on 3/16/16.
//  www.quartzcodeapp.com
//

import UIKit

@IBDesignable
class CustomView: UIView {
	
	var updateLayerValueForCompletedAnimation : Bool = false
	var completionBlocks : Dictionary<CAAnimation, (Bool) -> Void> = [:]
	var layers : Dictionary<String, AnyObject> = [:]
	
	
	
	//MARK: - Life Cycle
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupProperties()
		setupLayers()
	}
	
	required init?(coder aDecoder: NSCoder)
	{
		super.init(coder: aDecoder)
		setupProperties()
		setupLayers()
	}
	
	override var frame: CGRect{
		didSet{
			setupLayerFrames()
		}
	}
	
	override var bounds: CGRect{
		didSet{
			setupLayerFrames()
		}
	}
	
	func setupProperties(){
		
	}
	
	func setupLayers(){
		let Tile = CALayer()
		self.layer.addSublayer(Tile)
		
		layers["Tile"] = Tile
		let path = CAShapeLayer()
		Tile.addSublayer(path)
		path.fillColor   = UIColor(red:0.902, green: 0.906, blue:0.91, alpha:1).CGColor
		path.strokeColor = UIColor.blackColor().CGColor
		layers["path"] = path
		let path2 = CAShapeLayer()
		Tile.addSublayer(path2)
		path2.fillColor = UIColor.blackColor().CGColor
		path2.lineWidth = 0
		layers["path2"] = path2
		let path3 = CAShapeLayer()
		Tile.addSublayer(path3)
		path3.fillColor   = UIColor(red:0.902, green: 0.906, blue:0.91, alpha:1).CGColor
		path3.strokeColor = UIColor.blackColor().CGColor
		layers["path3"] = path3
		let path4 = CAShapeLayer()
		Tile.addSublayer(path4)
		path4.fillColor = UIColor.blackColor().CGColor
		path4.lineWidth = 0
		layers["path4"] = path4
		let path5 = CAShapeLayer()
		Tile.addSublayer(path5)
		path5.fillColor   = UIColor(red:0.902, green: 0.906, blue:0.91, alpha:1).CGColor
		path5.strokeColor = UIColor.blackColor().CGColor
		layers["path5"] = path5
		let path6 = CAShapeLayer()
		Tile.addSublayer(path6)
		path6.fillColor = UIColor.blackColor().CGColor
		path6.lineWidth = 0
		layers["path6"] = path6
		let path7 = CAShapeLayer()
		Tile.addSublayer(path7)
		path7.fillColor   = UIColor(red:0.902, green: 0.906, blue:0.91, alpha:1).CGColor
		path7.strokeColor = UIColor.blackColor().CGColor
		layers["path7"] = path7
		let path8 = CAShapeLayer()
		Tile.addSublayer(path8)
		path8.fillColor = UIColor.blackColor().CGColor
		path8.lineWidth = 0
		layers["path8"] = path8
		
		let Shutter = CALayer()
		self.layer.addSublayer(Shutter)
		
		layers["Shutter"] = Shutter
		let path9 = CAShapeLayer()
		Shutter.addSublayer(path9)
		path9.fillColor = UIColor.blackColor().CGColor
		path9.lineWidth = 0
		layers["path9"] = path9
		let path10 = CAShapeLayer()
		Shutter.addSublayer(path10)
		path10.fillColor = UIColor.blackColor().CGColor
		path10.lineWidth = 0
		layers["path10"] = path10
		let path11 = CAShapeLayer()
		Shutter.addSublayer(path11)
		path11.fillColor = UIColor.blackColor().CGColor
		path11.lineWidth = 0
		layers["path11"] = path11
		let path12 = CAShapeLayer()
		Shutter.addSublayer(path12)
		path12.fillColor = UIColor.blackColor().CGColor
		path12.lineWidth = 0
		layers["path12"] = path12
		let path13 = CAShapeLayer()
		Shutter.addSublayer(path13)
		path13.fillColor = UIColor.blackColor().CGColor
		path13.lineWidth = 0
		layers["path13"] = path13
		let path14 = CAShapeLayer()
		Shutter.addSublayer(path14)
		path14.fillColor = UIColor.blackColor().CGColor
		path14.lineWidth = 0
		layers["path14"] = path14
		setupLayerFrames()
	}
	
	func setupLayerFrames(){
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		
		if let Tile : CALayer = layers["Tile"] as? CALayer{
			Tile.frame = CGRectMake(0.2524 * Tile.superlayer!.bounds.width, 0.36051 * Tile.superlayer!.bounds.height, 0.4952 * Tile.superlayer!.bounds.width, 0.27898 * Tile.superlayer!.bounds.height)
		}
		
		if let path : CAShapeLayer = layers["path"] as? CAShapeLayer{
			path.frame = CGRectMake(0, 0, 0.5 * path.superlayer!.bounds.width, 0.5 * path.superlayer!.bounds.height)
			path.path  = pathPathWithBounds((layers["path"] as! CAShapeLayer).bounds).CGPath;
		}
		
		if let path2 : CAShapeLayer = layers["path2"] as? CAShapeLayer{
			path2.frame = CGRectMake(0.14955 * path2.superlayer!.bounds.width, 0.11909 * path2.superlayer!.bounds.height, 0.20091 * path2.superlayer!.bounds.width, 0.26182 * path2.superlayer!.bounds.height)
			path2.path  = path2PathWithBounds((layers["path2"] as! CAShapeLayer).bounds).CGPath;
		}
		
		if let path3 : CAShapeLayer = layers["path3"] as? CAShapeLayer{
			path3.frame = CGRectMake(0.5 * path3.superlayer!.bounds.width, 0, 0.5 * path3.superlayer!.bounds.width, 0.5 * path3.superlayer!.bounds.height)
			path3.path  = path3PathWithBounds((layers["path3"] as! CAShapeLayer).bounds).CGPath;
		}
		
		if let path4 : CAShapeLayer = layers["path4"] as? CAShapeLayer{
			path4.frame = CGRectMake(0.73364 * path4.superlayer!.bounds.width, 0.11955 * path4.superlayer!.bounds.height, 0.03273 * path4.superlayer!.bounds.width, 0.26136 * path4.superlayer!.bounds.height)
			path4.path  = path4PathWithBounds((layers["path4"] as! CAShapeLayer).bounds).CGPath;
		}
		
		if let path5 : CAShapeLayer = layers["path5"] as? CAShapeLayer{
			path5.frame = CGRectMake(0, 0.5 * path5.superlayer!.bounds.height, 0.5 * path5.superlayer!.bounds.width, 0.5 * path5.superlayer!.bounds.height)
			path5.path  = path5PathWithBounds((layers["path5"] as! CAShapeLayer).bounds).CGPath;
		}
		
		if let path6 : CAShapeLayer = layers["path6"] as? CAShapeLayer{
			path6.frame = CGRectMake(0.17091 * path6.superlayer!.bounds.width, 0.61955 * path6.superlayer!.bounds.height, 0.15864 * path6.superlayer!.bounds.width, 0.26136 * path6.superlayer!.bounds.height)
			path6.path  = path6PathWithBounds((layers["path6"] as! CAShapeLayer).bounds).CGPath;
		}
		
		if let path7 : CAShapeLayer = layers["path7"] as? CAShapeLayer{
			path7.frame = CGRectMake(0.5 * path7.superlayer!.bounds.width, 0.5 * path7.superlayer!.bounds.height, 0.5 * path7.superlayer!.bounds.width, 0.5 * path7.superlayer!.bounds.height)
			path7.path  = path7PathWithBounds((layers["path7"] as! CAShapeLayer).bounds).CGPath;
		}
		
		if let path8 : CAShapeLayer = layers["path8"] as? CAShapeLayer{
			path8.frame = CGRectMake(0.66909 * path8.superlayer!.bounds.width, 0.61955 * path8.superlayer!.bounds.height, 0.16182 * path8.superlayer!.bounds.width, 0.26136 * path8.superlayer!.bounds.height)
			path8.path  = path8PathWithBounds((layers["path8"] as! CAShapeLayer).bounds).CGPath;
		}
		
		if let Shutter : CALayer = layers["Shutter"] as? CALayer{
			Shutter.frame = CGRectMake(-0.70508 * Shutter.superlayer!.bounds.width, -0.17875 * Shutter.superlayer!.bounds.height, 2.41016 * Shutter.superlayer!.bounds.width, 1.35751 * Shutter.superlayer!.bounds.height)
		}
		
		if let path9 : CAShapeLayer = layers["path9"] as? CAShapeLayer{
			path9.frame = CGRectMake(0.02639 * path9.superlayer!.bounds.width, 0.01647 * path9.superlayer!.bounds.height, 0.5322 * path9.superlayer!.bounds.width, 0.32284 * path9.superlayer!.bounds.height)
			path9.path  = path9PathWithBounds((layers["path9"] as! CAShapeLayer).bounds).CGPath;
		}
		
		if let path10 : CAShapeLayer = layers["path10"] as? CAShapeLayer{
			path10.frame = CGRectMake(0, 0.36837 * path10.superlayer!.bounds.height, 0.39007 * path10.superlayer!.bounds.width, 0.45556 * path10.superlayer!.bounds.height)
			path10.path  = path10PathWithBounds((layers["path10"] as! CAShapeLayer).bounds).CGPath;
		}
		
		if let path11 : CAShapeLayer = layers["path11"] as? CAShapeLayer{
			path11.frame = CGRectMake(0.13971 * path11.superlayer!.bounds.width, 0.52652 * path11.superlayer!.bounds.height, 0.45496 * path11.superlayer!.bounds.width, 0.47348 * path11.superlayer!.bounds.height)
			path11.path  = path11PathWithBounds((layers["path11"] as! CAShapeLayer).bounds).CGPath;
		}
		
		if let path12 : CAShapeLayer = layers["path12"] as? CAShapeLayer{
			path12.frame = CGRectMake(0.43971 * path12.superlayer!.bounds.width, 0.66045 * path12.superlayer!.bounds.height, 0.5339 * path12.superlayer!.bounds.width, 0.32405 * path12.superlayer!.bounds.height)
			path12.path  = path12PathWithBounds((layers["path12"] as! CAShapeLayer).bounds).CGPath;
		}
		
		if let path13 : CAShapeLayer = layers["path13"] as? CAShapeLayer{
			path13.frame = CGRectMake(0.60944 * path13.superlayer!.bounds.width, 0.17026 * path13.superlayer!.bounds.height, 0.39056 * path13.superlayer!.bounds.width, 0.46113 * path13.superlayer!.bounds.height)
			path13.path  = path13PathWithBounds((layers["path13"] as! CAShapeLayer).bounds).CGPath;
		}
		
		if let path14 : CAShapeLayer = layers["path14"] as? CAShapeLayer{
			path14.frame = CGRectMake(0.40097 * path14.superlayer!.bounds.width, 0, 0.45424 * path14.superlayer!.bounds.width, 0.47082 * path14.superlayer!.bounds.height)
			path14.path  = path14PathWithBounds((layers["path14"] as! CAShapeLayer).bounds).CGPath;
		}
		
		CATransaction.commit()
	}
	
	//MARK: - Animation Setup
	
	func addTileCamSplashAnimation(){
		addTileCamSplashAnimationCompletionBlock(nil)
	}
	
	func addTileCamSplashAnimationCompletionBlock(completionBlock: ((finished: Bool) -> Void)?){
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = 1.25
			completionAnim.delegate = self
			completionAnim.setValue("tileCamSplash", forKey:"animId")
			completionAnim.setValue(false, forKey:"needEndAnim")
			layer.addAnimation(completionAnim, forKey:"tileCamSplash")
			if let anim = layer.animationForKey("tileCamSplash"){
				completionBlocks[anim] = completionBlock
			}
		}
		
		let fillMode : String = kCAFillModeForwards
		
		////Tile animation
		let TileHiddenAnim      = CAKeyframeAnimation(keyPath:"hidden")
		TileHiddenAnim.values   = [false, false, false, false]
		TileHiddenAnim.keyTimes = [0, 0.7, 0.747, 1]
		TileHiddenAnim.duration = 1.25
		
		let TileTileCamSplashAnim : CAAnimationGroup = QCMethod.groupAnimations([TileHiddenAnim], fillMode:fillMode)
		layers["Tile"]?.addAnimation(TileTileCamSplashAnim, forKey:"TileTileCamSplashAnim")
		
		let path9 = layers["path9"] as! CAShapeLayer
		
		////Path9 animation
		let path9TransformAnim      = CAKeyframeAnimation(keyPath:"transform")
		path9TransformAnim.values   = [NSValue(CATransform3D: CATransform3DMakeScale(2, 2, 2)), 
			 NSValue(CATransform3D: CATransform3DIdentity), 
			 NSValue(CATransform3D: CATransform3DIdentity), 
			 NSValue(CATransform3D: CATransform3DMakeScale(2, 2, 2))]
		path9TransformAnim.keyTimes = [0, 0.307, 0.698, 1]
		path9TransformAnim.duration = 1.25
		
		let path9TileCamSplashAnim : CAAnimationGroup = QCMethod.groupAnimations([path9TransformAnim], fillMode:fillMode)
		path9.addAnimation(path9TileCamSplashAnim, forKey:"path9TileCamSplashAnim")
		
		let path10 = layers["path10"] as! CAShapeLayer
		
		////Path10 animation
		let path10TransformAnim      = CAKeyframeAnimation(keyPath:"transform")
		path10TransformAnim.values   = [NSValue(CATransform3D: CATransform3DMakeScale(4.2, 4.2, 4.2)), 
			 NSValue(CATransform3D: CATransform3DIdentity), 
			 NSValue(CATransform3D: CATransform3DIdentity), 
			 NSValue(CATransform3D: CATransform3DMakeScale(4.2, 4.2, 4.2))]
		path10TransformAnim.keyTimes = [0, 0.307, 0.698, 1]
		path10TransformAnim.duration = 1.25
		
		let path10TileCamSplashAnim : CAAnimationGroup = QCMethod.groupAnimations([path10TransformAnim], fillMode:fillMode)
		path10.addAnimation(path10TileCamSplashAnim, forKey:"path10TileCamSplashAnim")
		
		let path11 = layers["path11"] as! CAShapeLayer
		
		////Path11 animation
		let path11TransformAnim      = CAKeyframeAnimation(keyPath:"transform")
		path11TransformAnim.values   = [NSValue(CATransform3D: CATransform3DMakeScale(3, 3, 3)), 
			 NSValue(CATransform3D: CATransform3DIdentity), 
			 NSValue(CATransform3D: CATransform3DIdentity), 
			 NSValue(CATransform3D: CATransform3DMakeScale(3, 3, 3))]
		path11TransformAnim.keyTimes = [0, 0.307, 0.698, 1]
		path11TransformAnim.duration = 1.25
		
		let path11TileCamSplashAnim : CAAnimationGroup = QCMethod.groupAnimations([path11TransformAnim], fillMode:fillMode)
		path11.addAnimation(path11TileCamSplashAnim, forKey:"path11TileCamSplashAnim")
		
		let path12 = layers["path12"] as! CAShapeLayer
		
		////Path12 animation
		let path12TransformAnim      = CAKeyframeAnimation(keyPath:"transform")
		path12TransformAnim.values   = [NSValue(CATransform3D: CATransform3DMakeScale(2, 2, 2)), 
			 NSValue(CATransform3D: CATransform3DIdentity), 
			 NSValue(CATransform3D: CATransform3DIdentity), 
			 NSValue(CATransform3D: CATransform3DMakeScale(2, 2, 2))]
		path12TransformAnim.keyTimes = [0, 0.307, 0.698, 1]
		path12TransformAnim.duration = 1.25
		
		let path12TileCamSplashAnim : CAAnimationGroup = QCMethod.groupAnimations([path12TransformAnim], fillMode:fillMode)
		path12.addAnimation(path12TileCamSplashAnim, forKey:"path12TileCamSplashAnim")
		
		let path13 = layers["path13"] as! CAShapeLayer
		
		////Path13 animation
		let path13TransformAnim      = CAKeyframeAnimation(keyPath:"transform")
		path13TransformAnim.values   = [NSValue(CATransform3D: CATransform3DMakeScale(4.1, 4.1, 4.1)), 
			 NSValue(CATransform3D: CATransform3DIdentity), 
			 NSValue(CATransform3D: CATransform3DIdentity), 
			 NSValue(CATransform3D: CATransform3DMakeScale(4.1, 4.1, 4.1))]
		path13TransformAnim.keyTimes = [0, 0.307, 0.698, 1]
		path13TransformAnim.duration = 1.25
		
		let path13TileCamSplashAnim : CAAnimationGroup = QCMethod.groupAnimations([path13TransformAnim], fillMode:fillMode)
		path13.addAnimation(path13TileCamSplashAnim, forKey:"path13TileCamSplashAnim")
		
		let path14 = layers["path14"] as! CAShapeLayer
		
		////Path14 animation
		let path14TransformAnim      = CAKeyframeAnimation(keyPath:"transform")
		path14TransformAnim.values   = [NSValue(CATransform3D: CATransform3DMakeScale(3, 3, 3)), 
			 NSValue(CATransform3D: CATransform3DIdentity), 
			 NSValue(CATransform3D: CATransform3DIdentity), 
			 NSValue(CATransform3D: CATransform3DMakeScale(3, 3, 3))]
		path14TransformAnim.keyTimes = [0, 0.307, 0.698, 1]
		path14TransformAnim.duration = 1.25
		
		let path14TileCamSplashAnim : CAAnimationGroup = QCMethod.groupAnimations([path14TransformAnim], fillMode:fillMode)
		path14.addAnimation(path14TileCamSplashAnim, forKey:"path14TileCamSplashAnim")
	}
	
	//MARK: - Animation Cleanup
	
	override func animationDidStop(anim: CAAnimation, finished flag: Bool){
		if let completionBlock = completionBlocks[anim]{
			completionBlocks.removeValueForKey(anim)
			if (flag && updateLayerValueForCompletedAnimation) || anim.valueForKey("needEndAnim") as! Bool{
				updateLayerValuesForAnimationId(anim.valueForKey("animId") as! String)
				removeAnimationsForAnimationId(anim.valueForKey("animId") as! String)
			}
			completionBlock(flag)
		}
	}
	
	func updateLayerValuesForAnimationId(identifier: String){
		if identifier == "tileCamSplash"{
			QCMethod.updateValueFromPresentationLayerForAnimation((layers["Tile"] as! CALayer).animationForKey("TileTileCamSplashAnim"), theLayer:(layers["Tile"] as! CALayer))
			QCMethod.updateValueFromPresentationLayerForAnimation((layers["path9"] as! CALayer).animationForKey("path9TileCamSplashAnim"), theLayer:(layers["path9"] as! CALayer))
			QCMethod.updateValueFromPresentationLayerForAnimation((layers["path10"] as! CALayer).animationForKey("path10TileCamSplashAnim"), theLayer:(layers["path10"] as! CALayer))
			QCMethod.updateValueFromPresentationLayerForAnimation((layers["path11"] as! CALayer).animationForKey("path11TileCamSplashAnim"), theLayer:(layers["path11"] as! CALayer))
			QCMethod.updateValueFromPresentationLayerForAnimation((layers["path12"] as! CALayer).animationForKey("path12TileCamSplashAnim"), theLayer:(layers["path12"] as! CALayer))
			QCMethod.updateValueFromPresentationLayerForAnimation((layers["path13"] as! CALayer).animationForKey("path13TileCamSplashAnim"), theLayer:(layers["path13"] as! CALayer))
			QCMethod.updateValueFromPresentationLayerForAnimation((layers["path14"] as! CALayer).animationForKey("path14TileCamSplashAnim"), theLayer:(layers["path14"] as! CALayer))
		}
	}
	
	func removeAnimationsForAnimationId(identifier: String){
		if identifier == "tileCamSplash"{
			(layers["Tile"] as! CALayer).removeAnimationForKey("TileTileCamSplashAnim")
			(layers["path9"] as! CALayer).removeAnimationForKey("path9TileCamSplashAnim")
			(layers["path10"] as! CALayer).removeAnimationForKey("path10TileCamSplashAnim")
			(layers["path11"] as! CALayer).removeAnimationForKey("path11TileCamSplashAnim")
			(layers["path12"] as! CALayer).removeAnimationForKey("path12TileCamSplashAnim")
			(layers["path13"] as! CALayer).removeAnimationForKey("path13TileCamSplashAnim")
			(layers["path14"] as! CALayer).removeAnimationForKey("path14TileCamSplashAnim")
		}
	}
	
	func removeAllAnimations(){
		for layer in layers.values{
			(layer as! CALayer).removeAllAnimations()
		}
	}
	
	//MARK: - Bezier Path
	
	func pathPathWithBounds(bound: CGRect) -> UIBezierPath{
		let pathPath = UIBezierPath()
		let minX = CGFloat(bound.minX), minY = bound.minY, w = bound.width, h = bound.height;
		
		pathPath.moveToPoint(CGPointMake(minX, minY))
		pathPath.addLineToPoint(CGPointMake(minX + w, minY))
		pathPath.addLineToPoint(CGPointMake(minX + w, minY + h))
		pathPath.addLineToPoint(CGPointMake(minX, minY + h))
		pathPath.closePath()
		pathPath.moveToPoint(CGPointMake(minX, minY))
		
		return pathPath;
	}
	
	func path2PathWithBounds(bound: CGRect) -> UIBezierPath{
		let path2Path = UIBezierPath()
		let minX = CGFloat(bound.minX), minY = bound.minY, w = bound.width, h = bound.height;
		
		path2Path.moveToPoint(CGPointMake(minX + 0.41855 * w, minY + h))
		path2Path.addLineToPoint(CGPointMake(minX + 0.41855 * w, minY + 0.11285 * h))
		path2Path.addLineToPoint(CGPointMake(minX, minY + 0.11285 * h))
		path2Path.addLineToPoint(CGPointMake(minX, minY))
		path2Path.addLineToPoint(CGPointMake(minX + w, minY))
		path2Path.addLineToPoint(CGPointMake(minX + w, minY + 0.11285 * h))
		path2Path.addLineToPoint(CGPointMake(minX + 0.58145 * w, minY + 0.11285 * h))
		path2Path.addLineToPoint(CGPointMake(minX + 0.58145 * w, minY + h))
		path2Path.addLineToPoint(CGPointMake(minX + 0.41855 * w, minY + h))
		path2Path.closePath()
		path2Path.moveToPoint(CGPointMake(minX + 0.41855 * w, minY + h))
		
		return path2Path;
	}
	
	func path3PathWithBounds(bound: CGRect) -> UIBezierPath{
		let path3Path = UIBezierPath()
		let minX = CGFloat(bound.minX), minY = bound.minY, w = bound.width, h = bound.height;
		
		path3Path.moveToPoint(CGPointMake(minX, minY))
		path3Path.addLineToPoint(CGPointMake(minX + w, minY))
		path3Path.addLineToPoint(CGPointMake(minX + w, minY + h))
		path3Path.addLineToPoint(CGPointMake(minX, minY + h))
		path3Path.closePath()
		path3Path.moveToPoint(CGPointMake(minX, minY))
		
		return path3Path;
	}
	
	func path4PathWithBounds(bound: CGRect) -> UIBezierPath{
		let path4Path = UIBezierPath()
		let minX = CGFloat(bound.minX), minY = bound.minY, w = bound.width, h = bound.height;
		
		path4Path.moveToPoint(CGPointMake(minX, minY + h))
		path4Path.addLineToPoint(CGPointMake(minX, minY))
		path4Path.addLineToPoint(CGPointMake(minX + w, minY))
		path4Path.addLineToPoint(CGPointMake(minX + w, minY + h))
		path4Path.addLineToPoint(CGPointMake(minX, minY + h))
		path4Path.closePath()
		path4Path.moveToPoint(CGPointMake(minX, minY + h))
		
		return path4Path;
	}
	
	func path5PathWithBounds(bound: CGRect) -> UIBezierPath{
		let path5Path = UIBezierPath()
		let minX = CGFloat(bound.minX), minY = bound.minY, w = bound.width, h = bound.height;
		
		path5Path.moveToPoint(CGPointMake(minX, minY))
		path5Path.addLineToPoint(CGPointMake(minX + w, minY))
		path5Path.addLineToPoint(CGPointMake(minX + w, minY + h))
		path5Path.addLineToPoint(CGPointMake(minX, minY + h))
		path5Path.closePath()
		path5Path.moveToPoint(CGPointMake(minX, minY))
		
		return path5Path;
	}
	
	func path6PathWithBounds(bound: CGRect) -> UIBezierPath{
		let path6Path = UIBezierPath()
		let minX = CGFloat(bound.minX), minY = bound.minY, w = bound.width, h = bound.height;
		
		path6Path.moveToPoint(CGPointMake(minX + w, minY + h))
		path6Path.addLineToPoint(CGPointMake(minX, minY + h))
		path6Path.addLineToPoint(CGPointMake(minX, minY))
		path6Path.addLineToPoint(CGPointMake(minX + 0.2063 * w, minY))
		path6Path.addLineToPoint(CGPointMake(minX + 0.2063 * w, minY + 0.8887 * h))
		path6Path.addLineToPoint(CGPointMake(minX + w, minY + 0.8887 * h))
		path6Path.addLineToPoint(CGPointMake(minX + w, minY + h))
		path6Path.closePath()
		path6Path.moveToPoint(CGPointMake(minX + w, minY + h))
		
		return path6Path;
	}
	
	func path7PathWithBounds(bound: CGRect) -> UIBezierPath{
		let path7Path = UIBezierPath()
		let minX = CGFloat(bound.minX), minY = bound.minY, w = bound.width, h = bound.height;
		
		path7Path.moveToPoint(CGPointMake(minX, minY))
		path7Path.addLineToPoint(CGPointMake(minX + w, minY))
		path7Path.addLineToPoint(CGPointMake(minX + w, minY + h))
		path7Path.addLineToPoint(CGPointMake(minX, minY + h))
		path7Path.closePath()
		path7Path.moveToPoint(CGPointMake(minX, minY))
		
		return path7Path;
	}
	
	func path8PathWithBounds(bound: CGRect) -> UIBezierPath{
		let path8Path = UIBezierPath()
		let minX = CGFloat(bound.minX), minY = bound.minY, w = bound.width, h = bound.height;
		
		path8Path.moveToPoint(CGPointMake(minX + w, minY + h))
		path8Path.addLineToPoint(CGPointMake(minX, minY + h))
		path8Path.addLineToPoint(CGPointMake(minX, minY))
		path8Path.addLineToPoint(CGPointMake(minX + w, minY))
		path8Path.addLineToPoint(CGPointMake(minX + w, minY + 0.11304 * h))
		path8Path.addLineToPoint(CGPointMake(minX + 0.19944 * w, minY + 0.11304 * h))
		path8Path.addLineToPoint(CGPointMake(minX + 0.19944 * w, minY + 0.43478 * h))
		path8Path.addLineToPoint(CGPointMake(minX + 0.95787 * w, minY + 0.43478 * h))
		path8Path.addLineToPoint(CGPointMake(minX + 0.95787 * w, minY + 0.54609 * h))
		path8Path.addLineToPoint(CGPointMake(minX + 0.19944 * w, minY + 0.54609 * h))
		path8Path.addLineToPoint(CGPointMake(minX + 0.19944 * w, minY + 0.89043 * h))
		path8Path.addLineToPoint(CGPointMake(minX + w, minY + 0.89043 * h))
		path8Path.addLineToPoint(CGPointMake(minX + w, minY + h))
		path8Path.closePath()
		path8Path.moveToPoint(CGPointMake(minX + w, minY + h))
		
		return path8Path;
	}
	
	func path9PathWithBounds(bound: CGRect) -> UIBezierPath{
		let path9Path = UIBezierPath()
		let minX = CGFloat(bound.minX), minY = bound.minY, w = bound.width, h = bound.height;
		
		path9Path.moveToPoint(CGPointMake(minX + w, minY + h))
		path9Path.addLineToPoint(CGPointMake(minX, minY + h))
		path9Path.addCurveToPoint(CGPointMake(minX + 0.64832 * w, minY), controlPoint1:CGPointMake(minX + 0.10009 * w, minY + 0.51238 * h), controlPoint2:CGPointMake(minX + 0.34395 * w, minY + 0.13353 * h))
		path9Path.addLineToPoint(CGPointMake(minX + w, minY + h))
		path9Path.closePath()
		path9Path.moveToPoint(CGPointMake(minX + w, minY + h))
		
		return path9Path;
	}
	
	func path10PathWithBounds(bound: CGRect) -> UIBezierPath{
		let path10Path = UIBezierPath()
		let minX = CGFloat(bound.minX), minY = bound.minY, w = bound.width, h = bound.height;
		
		path10Path.moveToPoint(CGPointMake(minX + w, minY))
		path10Path.addLineToPoint(CGPointMake(minX + 0.30602 * w, minY + h))
		path10Path.addCurveToPoint(CGPointMake(minX, minY + 0.28868 * h), controlPoint1:CGPointMake(minX + 0.11546 * w, minY + 0.80861 * h), controlPoint2:CGPointMake(minX, minY + 0.56034 * h))
		path10Path.addCurveToPoint(CGPointMake(minX + 0.04469 * w, minY), controlPoint1:CGPointMake(minX, minY + 0.18873 * h), controlPoint2:CGPointMake(minX + 0.01552 * w, minY + 0.09197 * h))
		path10Path.addLineToPoint(CGPointMake(minX + w, minY))
		path10Path.closePath()
		path10Path.moveToPoint(CGPointMake(minX + w, minY))
		
		return path10Path;
	}
	
	func path11PathWithBounds(bound: CGRect) -> UIBezierPath{
		let path11Path = UIBezierPath()
		let minX = CGFloat(bound.minX), minY = bound.minY, w = bound.width, h = bound.height;
		
		path11Path.moveToPoint(CGPointMake(minX + w, minY + 0.98107 * h))
		path11Path.addCurveToPoint(CGPointMake(minX + 0.79191 * w, minY + h), controlPoint1:CGPointMake(minX + 0.93294 * w, minY + 0.99335 * h), controlPoint2:CGPointMake(minX + 0.86323 * w, minY + h))
		path11Path.addCurveToPoint(CGPointMake(minX, minY + 0.67621 * h), controlPoint1:CGPointMake(minX + 0.48057 * w, minY + h), controlPoint2:CGPointMake(minX + 0.20011 * w, minY + 0.8757 * h))
		path11Path.addLineToPoint(CGPointMake(minX + 0.41831 * w, minY))
		path11Path.addLineToPoint(CGPointMake(minX + w, minY + 0.98107 * h))
		path11Path.closePath()
		path11Path.moveToPoint(CGPointMake(minX + w, minY + 0.98107 * h))
		
		return path11Path;
	}
	
	func path12PathWithBounds(bound: CGRect) -> UIBezierPath{
		let path12Path = UIBezierPath()
		let minX = CGFloat(bound.minX), minY = bound.minY, w = bound.width, h = bound.height;
		
		path12Path.moveToPoint(CGPointMake(minX + w, minY))
		path12Path.addCurveToPoint(CGPointMake(minX + 0.34558 * w, minY + h), controlPoint1:CGPointMake(minX + 0.89932 * w, minY + 0.49028 * h), controlPoint2:CGPointMake(minX + 0.65261 * w, minY + 0.8707 * h))
		path12Path.addLineToPoint(CGPointMake(minX, minY))
		path12Path.addLineToPoint(CGPointMake(minX + w, minY))
		path12Path.closePath()
		path12Path.moveToPoint(CGPointMake(minX + w, minY))
		
		return path12Path;
	}
	
	func path13PathWithBounds(bound: CGRect) -> UIBezierPath{
		let path13Path = UIBezierPath()
		let minX = CGFloat(bound.minX), minY = bound.minY, w = bound.width, h = bound.height;
		
		path13Path.moveToPoint(CGPointMake(minX + w, minY + 0.71481 * h))
		path13Path.addCurveToPoint(CGPointMake(minX + 0.95536 * w, minY + h), controlPoint1:CGPointMake(minX + w, minY + 0.81355 * h), controlPoint2:CGPointMake(minX + 0.9845 * w, minY + 0.90914 * h))
		path13Path.addLineToPoint(CGPointMake(minX, minY + h))
		path13Path.addLineToPoint(CGPointMake(minX + 0.68196 * w, minY))
		path13Path.addCurveToPoint(CGPointMake(minX + w, minY + 0.71481 * h), controlPoint1:CGPointMake(minX + 0.87973 * w, minY + 0.19065 * h), controlPoint2:CGPointMake(minX + w, minY + 0.44065 * h))
		path13Path.closePath()
		path13Path.moveToPoint(CGPointMake(minX + w, minY + 0.71481 * h))
		
		return path13Path;
	}
	
	func path14PathWithBounds(bound: CGRect) -> UIBezierPath{
		let path14Path = UIBezierPath()
		let minX = CGFloat(bound.minX), minY = bound.minY, w = bound.width, h = bound.height;
		
		path14Path.moveToPoint(CGPointMake(minX + w, minY + 0.3143 * h))
		path14Path.addLineToPoint(CGPointMake(minX + 0.58902 * w, minY + h))
		path14Path.addLineToPoint(CGPointMake(minX, minY + 0.02058 * h))
		path14Path.addCurveToPoint(CGPointMake(minX + 0.21802 * w, minY + 0 * h), controlPoint1:CGPointMake(minX + 0.07036 * w, minY + 0.00669 * h), controlPoint2:CGPointMake(minX + 0.14339 * w, minY + 0 * h))
		path14Path.addCurveToPoint(CGPointMake(minX + w, minY + 0.3143 * h), controlPoint1:CGPointMake(minX + 0.52399 * w, minY + -0.00051 * h), controlPoint2:CGPointMake(minX + 0.80064 * w, minY + 0.11986 * h))
		path14Path.closePath()
		path14Path.moveToPoint(CGPointMake(minX + w, minY + 0.3143 * h))
		
		return path14Path;
	}
	
	
}
