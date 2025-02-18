//
//  SVG.swift
//  SierpinskiSwift
//
//  A class that can be used to generate
//  a basic SVG file.

import Foundation

open class SVG {
    // YOUR CODE HERE
    private var svgString: String =  ""
    private let fileManager = FileManager.default
    
    // Initialize the SVG file with commands that will create a
    // width x height canvas
    public init(width: UInt, height: UInt) {
        svgString += "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
        svgString += "<svg version=\"1.1\" baseProfile=\"full\" width=\"\(width)\" height=\"\(height)\" xmlns=\"http://www.w3.org/2000/svg\">\n"
    }
    
    // YOUR CODE HERE
    
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
