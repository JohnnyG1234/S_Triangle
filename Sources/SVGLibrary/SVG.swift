//
//  SVG.swift
//  SierpinskiSwift
//
//  A class that can be used to generate
//  a basic SVG file.

import Foundation

open class SVG {
    private var svgString: String =  ""
    private let fileManager = FileManager.default
    
    // Initialize the SVG file with commands that will create a
    // width x height canvas
    public init(width: UInt, height: UInt) {
        svgString += "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
        svgString += "<svg version=\"1.1\" baseProfile=\"full\" width=\"\(width)\" height=\"\(height)\" xmlns=\"http://www.w3.org/2000/svg\">\n"
    }
    
    public func drawLine(x1: Int, y1: Int, x2: Int,  y2: Int) {
        svgString  += "<line x1=\"\(x1)\" y1=\"\(y1)\" x2=\"\(x2)\" y2=\"\(y2)\" stroke=\"Black\" />\n"
    }

    
    // Write the SVG file to disk
    public func write(filePath: String) {
        let svgData: Data? = svgString.data(using: .utf8) 

        let file = fileManager.createFile(atPath: filePath, contents: svgData, attributes: nil)
        if file  {
            print("File created.") 
        } else  {
            print("Failed to create file.")
        }
    }
}
