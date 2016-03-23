//
//  TileLogoSyleKit.swift
//  TIle Cam
//
//  Created by richayden on 2/28/16.
//  Copyright (c) 2016 richayden. All rights reserved.
//
//  Generated by PaintCode (www.paintcodeapp.com)
//



import UIKit

public class TileLogoSyleKit : NSObject {

    //// Cache

    private struct Cache {
        static var imageOfTileSquare: UIImage?
        static var tileSquareTargets: [AnyObject]?
    }

    //// Drawing Methods

    public class func drawTileSquare() {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()

        //// Text Drawing
        let textRect = CGRectMake(0.5, 0.5, 16, 16)
        let textPath = UIBezierPath(rect: textRect)
        UIColor.whiteColor().setStroke()
        textPath.lineWidth = 1
        textPath.stroke()
        let textTextContent = NSString(string: "T")
        let textStyle = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        textStyle.alignment = .Center

        let textFontAttributes = [NSFontAttributeName: UIFont.systemFontOfSize(15), NSForegroundColorAttributeName: UIColor.whiteColor(), NSParagraphStyleAttributeName: textStyle]

        let textTextHeight: CGFloat = textTextContent.boundingRectWithSize(CGSizeMake(textRect.width, CGFloat.infinity), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: textFontAttributes, context: nil).size.height
        CGContextSaveGState(context)
        CGContextClipToRect(context, textRect);
        textTextContent.drawInRect(CGRectMake(textRect.minX, textRect.minY + (textRect.height - textTextHeight) / 2, textRect.width, textTextHeight), withAttributes: textFontAttributes)
        CGContextRestoreGState(context)


        //// Text 2 Drawing
        let text2Rect = CGRectMake(16.5, 0.5, 16, 16)
        let text2Path = UIBezierPath(rect: text2Rect)
        UIColor.whiteColor().setStroke()
        text2Path.lineWidth = 1
        text2Path.stroke()
        let text2TextContent = NSString(string: "I")
        let text2Style = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        text2Style.alignment = .Center

        let text2FontAttributes = [NSFontAttributeName: UIFont.systemFontOfSize(15), NSForegroundColorAttributeName: UIColor.whiteColor(), NSParagraphStyleAttributeName: text2Style]

        let text2TextHeight: CGFloat = text2TextContent.boundingRectWithSize(CGSizeMake(text2Rect.width, CGFloat.infinity), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: text2FontAttributes, context: nil).size.height
        CGContextSaveGState(context)
        CGContextClipToRect(context, text2Rect);
        text2TextContent.drawInRect(CGRectMake(text2Rect.minX, text2Rect.minY + (text2Rect.height - text2TextHeight) / 2, text2Rect.width, text2TextHeight), withAttributes: text2FontAttributes)
        CGContextRestoreGState(context)


        //// Text 3 Drawing
        let text3Rect = CGRectMake(0.5, 16.5, 16, 16)
        let text3Path = UIBezierPath(rect: text3Rect)
        UIColor.whiteColor().setStroke()
        text3Path.lineWidth = 1
        text3Path.stroke()
        let text3TextContent = NSString(string: "L")
        let text3Style = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        text3Style.alignment = .Center

        let text3FontAttributes = [NSFontAttributeName: UIFont.systemFontOfSize(15), NSForegroundColorAttributeName: UIColor.whiteColor(), NSParagraphStyleAttributeName: text3Style]

        let text3TextHeight: CGFloat = text3TextContent.boundingRectWithSize(CGSizeMake(text3Rect.width, CGFloat.infinity), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: text3FontAttributes, context: nil).size.height
        CGContextSaveGState(context)
        CGContextClipToRect(context, text3Rect);
        text3TextContent.drawInRect(CGRectMake(text3Rect.minX, text3Rect.minY + (text3Rect.height - text3TextHeight) / 2, text3Rect.width, text3TextHeight), withAttributes: text3FontAttributes)
        CGContextRestoreGState(context)


        //// Text 4 Drawing
        let text4Rect = CGRectMake(16.5, 16.5, 16, 16)
        let text4Path = UIBezierPath(rect: text4Rect)
        UIColor.whiteColor().setStroke()
        text4Path.lineWidth = 1
        text4Path.stroke()
        let text4TextContent = NSString(string: "E")
        let text4Style = NSParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        text4Style.alignment = .Center

        let text4FontAttributes = [NSFontAttributeName: UIFont.systemFontOfSize(15), NSForegroundColorAttributeName: UIColor.whiteColor(), NSParagraphStyleAttributeName: text4Style]

        let text4TextHeight: CGFloat = text4TextContent.boundingRectWithSize(CGSizeMake(text4Rect.width, CGFloat.infinity), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: text4FontAttributes, context: nil).size.height
        CGContextSaveGState(context)
        CGContextClipToRect(context, text4Rect);
        text4TextContent.drawInRect(CGRectMake(text4Rect.minX, text4Rect.minY + (text4Rect.height - text4TextHeight) / 2, text4Rect.width, text4TextHeight), withAttributes: text4FontAttributes)
        CGContextRestoreGState(context)
    }

    //// Generated Images

    public class var imageOfTileSquare: UIImage {
        if Cache.imageOfTileSquare != nil {
            return Cache.imageOfTileSquare!
        }

        UIGraphicsBeginImageContextWithOptions(CGSizeMake(33, 36), false, 0)
            TileLogoSyleKit.drawTileSquare()

        Cache.imageOfTileSquare = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return Cache.imageOfTileSquare!
    }

    //// Customization Infrastructure

    @IBOutlet var tileSquareTargets: [AnyObject]! {
        get { return Cache.tileSquareTargets }
        set {
            Cache.tileSquareTargets = newValue
            for target: AnyObject in newValue {
                target.performSelector(#selector(CIImageAccumulator.setImage(_:)), withObject: TileLogoSyleKit.imageOfTileSquare)
            }
        }
    }

}
