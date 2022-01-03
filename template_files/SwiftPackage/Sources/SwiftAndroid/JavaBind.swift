//
//  JavaBind.swift
//  
//
//

import Foundation

import Java
import Android
import java_swift
import UIKit

@_silgen_name("Java_io_kodika_kodikaplayerandroid_Application_bind")
public func bindApplication( __env: UnsafeMutablePointer<JNIEnv?>, __this: jobject?) -> jlong? {
    
    let swiftObject = AndroidUIKitApplication(javaObject: __this)

    UIApplication.shared.delegate = AndroidAppDelegate()

    return jlong(Int(bitPattern: Unmanaged.passRetained(swiftObject).toOpaque()))
}


@_silgen_name("Java_io_kodika_kodikaplayerandroid_MainActivity_bind")
public func bindActivity( __env: UnsafeMutablePointer<JNIEnv?>, __this: jobject?) -> jlong? {
    
    let swiftObject = AndroidUIKitActivity(javaObject: __this)
    return jlong(Int(bitPattern: Unmanaged.passRetained(swiftObject).toOpaque()))
}
