//
//  CustomView.swift
//
//  Code generated using QuartzCode 1.39.9 on 2/21/16.
//  www.quartzcodeapp.com
//

import UIKit

@IBDesignable
class CustomView: UIView {
	
	var layers : Dictionary<String, AnyObject> = [:]
	var completionBlocks : Dictionary<CAAnimation, (Bool) -> Void> = [:]
	var updateLayerValueForCompletedAnimation : Bool = false
	
	
	
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
	
	
	
	func setupProperties(){
		
	}
	
	func setupLayers(){
		let Tile = CALayer()
		Tile.frame = CGRectMake(80.77, 204.77, 158.46, 158.46)
		self.layer.addSublayer(Tile)
		layers["Tile"] = Tile
		let path7 = CAShapeLayer()
		path7.frame = CGRectMake(0, 0, 79.23, 79.23)
		path7.path = path7Path().CGPath;
		Tile.addSublayer(path7)
		layers["path7"] = path7
		let path8 = CAShapeLayer()
		path8.frame = CGRectMake(23.7, 18.87, 31.84, 41.49)
		path8.path = path8Path().CGPath;
		Tile.addSublayer(path8)
		layers["path8"] = path8
		let path9 = CAShapeLayer()
		path9.frame = CGRectMake(79.23, 0, 79.23, 79.23)
		path9.path = path9Path().CGPath;
		Tile.addSublayer(path9)
		layers["path9"] = path9
		let path10 = CAShapeLayer()
		path10.frame = CGRectMake(116.25, 18.94, 5.19, 41.42)
		path10.path = path10Path().CGPath;
		Tile.addSublayer(path10)
		layers["path10"] = path10
		let path11 = CAShapeLayer()
		path11.frame = CGRectMake(0, 79.23, 79.23, 79.23)
		path11.path = path11Path().CGPath;
		Tile.addSublayer(path11)
		layers["path11"] = path11
		let path12 = CAShapeLayer()
		path12.frame = CGRectMake(27.08, 98.17, 25.14, 41.42)
		path12.path = path12Path().CGPath;
		Tile.addSublayer(path12)
		layers["path12"] = path12
		let path13 = CAShapeLayer()
		path13.frame = CGRectMake(79.23, 79.23, 79.23, 79.23)
		path13.path = path13Path().CGPath;
		Tile.addSublayer(path13)
		layers["path13"] = path13
		let path14 = CAShapeLayer()
		path14.frame = CGRectMake(106.03, 98.17, 25.64, 41.42)
		path14.path = path14Path().CGPath;
		Tile.addSublayer(path14)
		layers["path14"] = path14
		
		let Shutter = CALayer()
		Shutter.frame = CGRectMake(152.3, 281.99, 9.71, 9.71)
		self.layer.addSublayer(Shutter)
		layers["Shutter"] = Shutter
		let path15 = CAShapeLayer()
		path15.frame = CGRectMake(0.26, 0.16, 5.17, 3.13)
		path15.path = path15Path().CGPath;
		Shutter.addSublayer(path15)
		layers["path15"] = path15
		let path16 = CAShapeLayer()
		path16.frame = CGRectMake(0, 3.58, 3.79, 4.42)
		path16.path = path16Path().CGPath;
		Shutter.addSublayer(path16)
		layers["path16"] = path16
		let path17 = CAShapeLayer()
		path17.frame = CGRectMake(1.36, 5.11, 4.42, 4.6)
		path17.path = path17Path().CGPath;
		Shutter.addSublayer(path17)
		layers["path17"] = path17
		let path18 = CAShapeLayer()
		path18.frame = CGRectMake(4.27, 6.41, 5.18, 3.14)
		path18.path = path18Path().CGPath;
		Shutter.addSublayer(path18)
		layers["path18"] = path18
		let path19 = CAShapeLayer()
		path19.frame = CGRectMake(5.92, 1.65, 3.79, 4.48)
		path19.path = path19Path().CGPath;
		Shutter.addSublayer(path19)
		layers["path19"] = path19
		let path20 = CAShapeLayer()
		path20.frame = CGRectMake(3.89, 0, 4.41, 4.57)
		path20.path = path20Path().CGPath;
		Shutter.addSublayer(path20)
		layers["path20"] = path20
		
		resetLayerPropertiesForLayerIdentifiers(nil)
	}
	
	func resetLayerPropertiesForLayerIdentifiers(layerIds: [String]!){
		CATransaction.begin()
		CATransaction.setDisableActions(true)
		
		if layerIds == nil || layerIds.contains("path7"){
			let path7 = layers["path7"] as! CAShapeLayer
			path7.fillColor   = UIColor(red:0.902, green: 0.906, blue:0.91, alpha:1).CGColor
			path7.strokeColor = UIColor.blackColor().CGColor
		}
		if layerIds == nil || layerIds.contains("path8"){
			let path8 = layers["path8"] as! CAShapeLayer
			path8.fillColor = UIColor.blackColor().CGColor
			path8.lineWidth = 0
		}
		if layerIds == nil || layerIds.contains("path9"){
			let path9 = layers["path9"] as! CAShapeLayer
			path9.fillColor   = UIColor(red:0.902, green: 0.906, blue:0.91, alpha:1).CGColor
			path9.strokeColor = UIColor.blackColor().CGColor
		}
		if layerIds == nil || layerIds.contains("path10"){
			let path10 = layers["path10"] as! CAShapeLayer
			path10.fillColor = UIColor.blackColor().CGColor
			path10.lineWidth = 0
		}
		if layerIds == nil || layerIds.contains("path11"){
			let path11 = layers["path11"] as! CAShapeLayer
			path11.fillColor   = UIColor(red:0.902, green: 0.906, blue:0.91, alpha:1).CGColor
			path11.strokeColor = UIColor.blackColor().CGColor
		}
		if layerIds == nil || layerIds.contains("path12"){
			let path12 = layers["path12"] as! CAShapeLayer
			path12.fillColor = UIColor.blackColor().CGColor
			path12.lineWidth = 0
		}
		if layerIds == nil || layerIds.contains("path13"){
			let path13 = layers["path13"] as! CAShapeLayer
			path13.fillColor   = UIColor(red:0.902, green: 0.906, blue:0.91, alpha:1).CGColor
			path13.strokeColor = UIColor.blackColor().CGColor
		}
		if layerIds == nil || layerIds.contains("path14"){
			let path14 = layers["path14"] as! CAShapeLayer
			path14.fillColor = UIColor.blackColor().CGColor
			path14.lineWidth = 0
		}
		if layerIds == nil || layerIds.contains("path15"){
			let path15 = layers["path15"] as! CAShapeLayer
			path15.fillColor = UIColor(red:0.137, green: 0.122, blue:0.125, alpha:1).CGColor
			path15.lineWidth = 0
		}
		if layerIds == nil || layerIds.contains("path16"){
			let path16 = layers["path16"] as! CAShapeLayer
			path16.fillColor = UIColor(red:0.137, green: 0.122, blue:0.125, alpha:1).CGColor
			path16.lineWidth = 0
		}
		if layerIds == nil || layerIds.contains("path17"){
			let path17 = layers["path17"] as! CAShapeLayer
			path17.fillColor = UIColor(red:0.137, green: 0.122, blue:0.125, alpha:1).CGColor
			path17.lineWidth = 0
		}
		if layerIds == nil || layerIds.contains("path18"){
			let path18 = layers["path18"] as! CAShapeLayer
			path18.fillColor = UIColor(red:0.137, green: 0.122, blue:0.125, alpha:1).CGColor
			path18.lineWidth = 0
		}
		if layerIds == nil || layerIds.contains("path19"){
			let path19 = layers["path19"] as! CAShapeLayer
			path19.fillColor = UIColor(red:0.137, green: 0.122, blue:0.125, alpha:1).CGColor
			path19.lineWidth = 0
		}
		if layerIds == nil || layerIds.contains("path20"){
			let path20 = layers["path20"] as! CAShapeLayer
			path20.fillColor = UIColor(red:0.137, green: 0.122, blue:0.125, alpha:1).CGColor
			path20.lineWidth = 0
		}
		
		CATransaction.commit()
	}
	
	//MARK: - Animation Setup
	
	func addTileCamSplashAnimation(){
		addTileCamSplashAnimationCompletionBlock(nil)
	}
	
	func addTileCamSplashAnimationCompletionBlock(completionBlock: ((finished: Bool) -> Void)?){
		addTileCamSplashAnimationTotalDuration(0.75, completionBlock:completionBlock)
	}
	
	func addTileCamSplashAnimationTotalDuration(totalDuration: CFTimeInterval, completionBlock: ((finished: Bool) -> Void)?){
		if completionBlock != nil{
			let completionAnim = CABasicAnimation(keyPath:"completionAnim")
			completionAnim.duration = totalDuration
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
		TileHiddenAnim.values   = [true, true, false]
		TileHiddenAnim.keyTimes = [0, 0.862, 1]
		TileHiddenAnim.duration = 1 * totalDuration
		
		let TileTileCamSplashAnim : CAAnimationGroup = QCMethod.groupAnimations([TileHiddenAnim], fillMode:fillMode)
		layers["Tile"]?.addAnimation(TileTileCamSplashAnim, forKey:"TileTileCamSplashAnim")
		
		////Shutter animation
		let ShutterTransformAnim      = CAKeyframeAnimation(keyPath:"transform")
		ShutterTransformAnim.values   = [NSValue(CATransform3D: CATransform3DIdentity), 
			 NSValue(CATransform3D: CATransform3DConcat(CATransform3DMakeScale(80, 80, 100), CATransform3DMakeRotation(-CGFloat(M_PI), 0, 0, 1)))]
		ShutterTransformAnim.keyTimes = [0, 1]
		ShutterTransformAnim.duration = totalDuration
		
		let ShutterOpacityAnim      = CAKeyframeAnimation(keyPath:"opacity")
		ShutterOpacityAnim.values   = [0, 1]
		ShutterOpacityAnim.keyTimes = [0, 1]
		ShutterOpacityAnim.duration = totalDuration
		
		let ShutterTileCamSplashAnim : CAAnimationGroup = QCMethod.groupAnimations([ShutterTransformAnim, ShutterOpacityAnim], fillMode:fillMode)
		layers["Shutter"]?.addAnimation(ShutterTileCamSplashAnim, forKey:"ShutterTileCamSplashAnim")
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
			QCMethod.updateValueFromPresentationLayerForAnimation((layers["Shutter"] as! CALayer).animationForKey("ShutterTileCamSplashAnim"), theLayer:(layers["Shutter"] as! CALayer))
		}
	}
	
	func removeAnimationsForAnimationId(identifier: String){
		if identifier == "tileCamSplash"{
			(layers["Tile"] as! CALayer).removeAnimationForKey("TileTileCamSplashAnim")
			(layers["Shutter"] as! CALayer).removeAnimationForKey("ShutterTileCamSplashAnim")
		}
	}
	
	func removeAllAnimations(){
		for layer in layers.values{
			(layer as! CALayer).removeAllAnimations()
		}
	}
	
	//MARK: - Bezier Path
	
	func path7Path() -> UIBezierPath{
		let path7Path = UIBezierPath()
		path7Path.moveToPoint(CGPointMake(0, 0))
		path7Path.addLineToPoint(CGPointMake(79.231, 0))
		path7Path.addLineToPoint(CGPointMake(79.231, 79.231))
		path7Path.addLineToPoint(CGPointMake(0, 79.231))
		path7Path.closePath()
		path7Path.moveToPoint(CGPointMake(0, 0))
		
		return path7Path;
	}
	
	func path8Path() -> UIBezierPath{
		let path8Path = UIBezierPath()
		path8Path.moveToPoint(CGPointMake(13.325, 41.488))
		path8Path.addLineToPoint(CGPointMake(13.325, 4.682))
		path8Path.addLineToPoint(CGPointMake(0, 4.682))
		path8Path.addLineToPoint(CGPointMake(0, 0))
		path8Path.addLineToPoint(CGPointMake(31.837, 0))
		path8Path.addLineToPoint(CGPointMake(31.837, 4.682))
		path8Path.addLineToPoint(CGPointMake(18.511, 4.682))
		path8Path.addLineToPoint(CGPointMake(18.511, 41.488))
		path8Path.addLineToPoint(CGPointMake(13.325, 41.488))
		path8Path.closePath()
		path8Path.moveToPoint(CGPointMake(13.325, 41.488))
		
		return path8Path;
	}
	
	func path9Path() -> UIBezierPath{
		let path9Path = UIBezierPath()
		path9Path.moveToPoint(CGPointMake(0, 0))
		path9Path.addLineToPoint(CGPointMake(79.231, 0))
		path9Path.addLineToPoint(CGPointMake(79.231, 79.231))
		path9Path.addLineToPoint(CGPointMake(0, 79.231))
		path9Path.closePath()
		path9Path.moveToPoint(CGPointMake(0, 0))
		
		return path9Path;
	}
	
	func path10Path() -> UIBezierPath{
		let path10Path = UIBezierPath()
		path10Path.moveToPoint(CGPointMake(0, 41.416))
		path10Path.addLineToPoint(CGPointMake(0, 0))
		path10Path.addLineToPoint(CGPointMake(5.186, 0))
		path10Path.addLineToPoint(CGPointMake(5.186, 41.416))
		path10Path.addLineToPoint(CGPointMake(0, 41.416))
		path10Path.closePath()
		path10Path.moveToPoint(CGPointMake(0, 41.416))
		
		return path10Path;
	}
	
	func path11Path() -> UIBezierPath{
		let path11Path = UIBezierPath()
		path11Path.moveToPoint(CGPointMake(0, 0))
		path11Path.addLineToPoint(CGPointMake(79.231, 0))
		path11Path.addLineToPoint(CGPointMake(79.231, 79.231))
		path11Path.addLineToPoint(CGPointMake(0, 79.231))
		path11Path.closePath()
		path11Path.moveToPoint(CGPointMake(0, 0))
		
		return path11Path;
	}
	
	func path12Path() -> UIBezierPath{
		let path12Path = UIBezierPath()
		path12Path.moveToPoint(CGPointMake(25.138, 41.416))
		path12Path.addLineToPoint(CGPointMake(0, 41.416))
		path12Path.addLineToPoint(CGPointMake(0, 0))
		path12Path.addLineToPoint(CGPointMake(5.186, 0))
		path12Path.addLineToPoint(CGPointMake(5.186, 36.806))
		path12Path.addLineToPoint(CGPointMake(25.138, 36.806))
		path12Path.addLineToPoint(CGPointMake(25.138, 41.416))
		path12Path.closePath()
		path12Path.moveToPoint(CGPointMake(25.138, 41.416))
		
		return path12Path;
	}
	
	func path13Path() -> UIBezierPath{
		let path13Path = UIBezierPath()
		path13Path.moveToPoint(CGPointMake(0, 0))
		path13Path.addLineToPoint(CGPointMake(79.231, 0))
		path13Path.addLineToPoint(CGPointMake(79.231, 79.231))
		path13Path.addLineToPoint(CGPointMake(0, 79.231))
		path13Path.closePath()
		path13Path.moveToPoint(CGPointMake(0, 0))
		
		return path13Path;
	}
	
	func path14Path() -> UIBezierPath{
		let path14Path = UIBezierPath()
		path14Path.moveToPoint(CGPointMake(25.642, 41.416))
		path14Path.addLineToPoint(CGPointMake(0, 41.416))
		path14Path.addLineToPoint(CGPointMake(0, 0))
		path14Path.addLineToPoint(CGPointMake(25.642, 0))
		path14Path.addLineToPoint(CGPointMake(25.642, 4.682))
		path14Path.addLineToPoint(CGPointMake(5.114, 4.682))
		path14Path.addLineToPoint(CGPointMake(5.114, 18.007))
		path14Path.addLineToPoint(CGPointMake(24.562, 18.007))
		path14Path.addLineToPoint(CGPointMake(24.562, 22.617))
		path14Path.addLineToPoint(CGPointMake(5.114, 22.617))
		path14Path.addLineToPoint(CGPointMake(5.114, 36.879))
		path14Path.addLineToPoint(CGPointMake(25.642, 36.879))
		path14Path.addLineToPoint(CGPointMake(25.642, 41.416))
		path14Path.closePath()
		path14Path.moveToPoint(CGPointMake(25.642, 41.416))
		
		return path14Path;
	}
	
	func path15Path() -> UIBezierPath{
		let path15Path = UIBezierPath()
		path15Path.moveToPoint(CGPointMake(5.166, 3.133))
		path15Path.addLineToPoint(CGPointMake(0, 3.133))
		path15Path.addCurveToPoint(CGPointMake(3.349, 0), controlPoint1:CGPointMake(0.517, 1.605), controlPoint2:CGPointMake(1.777, 0.418))
		path15Path.addLineToPoint(CGPointMake(5.166, 3.133))
		path15Path.closePath()
		path15Path.moveToPoint(CGPointMake(5.166, 3.133))
		
		return path15Path;
	}
	
	func path16Path() -> UIBezierPath{
		let path16Path = UIBezierPath()
		path16Path.moveToPoint(CGPointMake(3.787, 0))
		path16Path.addLineToPoint(CGPointMake(1.159, 4.421))
		path16Path.addCurveToPoint(CGPointMake(0, 1.276), controlPoint1:CGPointMake(0.437, 3.575), controlPoint2:CGPointMake(0, 2.477))
		path16Path.addCurveToPoint(CGPointMake(0.169, 0), controlPoint1:CGPointMake(0, 0.834), controlPoint2:CGPointMake(0.059, 0.407))
		path16Path.addLineToPoint(CGPointMake(3.787, 0))
		path16Path.closePath()
		path16Path.moveToPoint(CGPointMake(3.787, 0))
		
		return path16Path;
	}
	
	func path17Path() -> UIBezierPath{
		let path17Path = UIBezierPath()
		path17Path.moveToPoint(CGPointMake(4.417, 4.508))
		path17Path.addCurveToPoint(CGPointMake(3.498, 4.595), controlPoint1:CGPointMake(4.12, 4.565), controlPoint2:CGPointMake(3.813, 4.595))
		path17Path.addCurveToPoint(CGPointMake(0, 3.107), controlPoint1:CGPointMake(2.123, 4.595), controlPoint2:CGPointMake(0.884, 4.024))
		path17Path.addLineToPoint(CGPointMake(1.848, 0))
		path17Path.addLineToPoint(CGPointMake(4.417, 4.508))
		path17Path.closePath()
		path17Path.moveToPoint(CGPointMake(4.417, 4.508))
		
		return path17Path;
	}
	
	func path18Path() -> UIBezierPath{
		let path18Path = UIBezierPath()
		path18Path.moveToPoint(CGPointMake(5.183, 0))
		path18Path.addCurveToPoint(CGPointMake(1.791, 3.145), controlPoint1:CGPointMake(4.661, 1.542), controlPoint2:CGPointMake(3.382, 2.738))
		path18Path.addLineToPoint(CGPointMake(0, 0))
		path18Path.addLineToPoint(CGPointMake(5.183, 0))
		path18Path.closePath()
		path18Path.moveToPoint(CGPointMake(5.183, 0))
		
		return path18Path;
	}
	
	func path19Path() -> UIBezierPath{
		let path19Path = UIBezierPath()
		path19Path.moveToPoint(CGPointMake(3.791, 3.199))
		path19Path.addCurveToPoint(CGPointMake(3.622, 4.475), controlPoint1:CGPointMake(3.791, 3.641), controlPoint2:CGPointMake(3.733, 4.069))
		path19Path.addLineToPoint(CGPointMake(0, 4.475))
		path19Path.addLineToPoint(CGPointMake(2.586, 0))
		path19Path.addCurveToPoint(CGPointMake(3.791, 3.199), controlPoint1:CGPointMake(3.335, 0.853), controlPoint2:CGPointMake(3.791, 1.972))
		path19Path.closePath()
		path19Path.moveToPoint(CGPointMake(3.791, 3.199))
		
		return path19Path;
	}
	
	func path20Path() -> UIBezierPath{
		let path20Path = UIBezierPath()
		path20Path.moveToPoint(CGPointMake(4.41, 1.436))
		path20Path.addLineToPoint(CGPointMake(2.597, 4.569))
		path20Path.addLineToPoint(CGPointMake(0, 0.094))
		path20Path.addCurveToPoint(CGPointMake(0.961, 0), controlPoint1:CGPointMake(0.31, 0.031), controlPoint2:CGPointMake(0.632, 0))
		path20Path.addCurveToPoint(CGPointMake(4.41, 1.436), controlPoint1:CGPointMake(2.311, -0.002), controlPoint2:CGPointMake(3.53, 0.548))
		path20Path.closePath()
		path20Path.moveToPoint(CGPointMake(4.41, 1.436))
		
		return path20Path;
	}
	
	
}
